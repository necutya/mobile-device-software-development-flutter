import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

class Composition {
  final String author;
  final String name;
  final String cover;

  Composition(this.author, this.name, this.cover);

  factory Composition.fromJson(Map<String, dynamic> json) {
    return Composition(json['track']['artists'][0]['name'], json['track']['name'],
        json['track']['album']['images'][2]['url']);
  }

  bool operator ==(o) =>
      o is Composition && author == o.author && name == o.name;
  int get hashCode => hash2(author.hashCode, name.hashCode);
}

class Library extends ChangeNotifier {
  final List<Composition> _items = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Composition> get items => UnmodifiableListView(_items);

  bool hasComposition(Composition item) {
    return _items.contains(item);
  }

  void addOrRemove(Composition item) {
    bool existed = _items.remove(item);
    if (!existed) {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
