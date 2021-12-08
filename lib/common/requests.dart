import 'dart:convert';

import 'package:base/models/composition.dart';
import 'package:http/http.dart' as http;

class TokenManager {
  late String token;
  late int _expires_in;
  late DateTime _expires_at;

  TokenManager(
    this.token,
    this._expires_in,
    this._expires_at,
  );

  factory TokenManager.fromJson(Map<String, dynamic> json) {
    return TokenManager(
      json['access_token'],
      json['expires_in'],
      DateTime.now().add(Duration(seconds: json['expires_in'])),
    );
  }

  bool isValidToken() {
    if (token.isEmpty) {
      return false;
    }
    if (DateTime.now().isAfter(this._expires_at)) {
      return false;
    }
    return true;
  }
}

class SpotifyAPI {
  late String _basic_token;
  TokenManager? _tokenManager;

  SpotifyAPI(String clientId, clientSeret) {
    Codec<String, String> _stringToBase64 = utf8.fuse(base64);
    _basic_token = _stringToBase64.encode("$clientId:$clientSeret");  
  }


  Future<bool> _loginToSpotify() async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Basic $_basic_token",
    };

    final response = await http.post(
        Uri.parse('https://accounts.spotify.com/api/token'),
        headers: headers,
        encoding: Encoding.getByName('utf-8'),
        body: <String, String>{"grant_type": "client_credentials"});

    if (response.statusCode == 200) {
      _tokenManager = TokenManager.fromJson(jsonDecode(response.body));
      return true;
    } else {
      throw Exception('Failed to log in to spotify');
    }
  }

  Future<String> _getAuthorizationToken() async {
    if (_tokenManager == null) {
      await _loginToSpotify();
    }
    if (!_tokenManager!.isValidToken()) {
      await _loginToSpotify();
    }
    return _tokenManager!.token;
  }

  Future<List<Composition>> fetchPlaylist(String playlistId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${await _getAuthorizationToken()}",
    };

    final response = await http
        .get(Uri.parse('https://api.spotify.com/v1/playlists/$playlistId'), headers: headers);

    if (response.statusCode == 200) {
      List<Composition> compositions = [];
      for(var item in jsonDecode(response.body)['tracks']['items']) {
        compositions.add(Composition.fromJson(item));
      }
      return compositions;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load composition');
    }
  }
}
