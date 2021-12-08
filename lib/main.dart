import 'package:base/common/requests.dart';
import 'package:base/models/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:base/pages/main.dart';
import 'package:base/pages/library.dart';
import 'models/composition.dart';
import 'common/components.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Library(),
          ),
          ChangeNotifierProvider(
            create: (context) => DarkThemeProvider(),
          )
        ],
        child: MaterialApp(home: SpotifyMain(), routes: {
          '/playlist': (context) => SpotifyPlaylist(),
        })));

class SpotifyMain extends StatefulWidget {
  const SpotifyMain({Key? key}) : super(key: key);

  @override
  State<SpotifyMain> createState() => _SpotifyMainState();
}

class _SpotifyMainState extends State<SpotifyMain> {
  late DarkThemeProvider themeChangeProvider =
      Provider.of<DarkThemeProvider>(context);
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _handlePageTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      MainPage(
        dtp: themeChangeProvider,
        onSettingsTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Settings()));
        },
      ),
      MainPage(
        dtp: themeChangeProvider,
        onSettingsTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Settings()));
        },
      ),
      ListPage(
        dtp: themeChangeProvider,
        mainText: "Your library",
        getListItems: (BuildContext context, DarkThemeProvider dtp) {
          List<Widget> likedCompositions = [];
          Provider.of<Library>(context, listen: false).items.forEach((element) {
            likedCompositions.add(CompositionListItem(
              composition: element,
              isDarkTheme: dtp.darkTheme,
            ).build(context));
          });
          return likedCompositions;
        },
      )
    ];

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: constraint.maxHeight,
                      minWidth: constraint.maxWidth),
                  child: Consumer<Library>(builder: (context, library, child) {
                    return Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(-0.6, -0.6),
                          colors: [
                            CustomColors(themeChangeProvider.darkTheme)
                                .mainColor,
                            CustomColors(themeChangeProvider.darkTheme)
                                .backgroundColor,
                          ],
                        )),
                        child: _widgetOptions.elementAt(_selectedIndex));
                  })));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff2c2c2c),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pause),
            label: 'My library',
          ),
        ],
        selectedItemColor:
            CustomColors(themeChangeProvider.darkTheme).activeColor,
        unselectedItemColor:
            CustomColors(themeChangeProvider.darkTheme).inActiveColor,
        onTap: _handlePageTap,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

class SpotifyPlaylist extends StatefulWidget {
  const SpotifyPlaylist({Key? key}) : super(key: key);

  @override
  State<SpotifyPlaylist> createState() => _SpotifyPlaylistState();
}

class _SpotifyPlaylistState extends State<SpotifyPlaylist> {
  late DarkThemeProvider themeChangeProvider =
      Provider.of<DarkThemeProvider>(context);
  late SpotifyAPI spotifyAPI;
  late Future<List<Composition>> futurePlaylistCompositions;

  int clicks = 0;

  @override
  void initState() {
    super.initState();
    startSpotifyApi();
  }

  void startSpotifyApi() async {
    spotifyAPI = SpotifyAPI(
        "82756cd3d4c645e8858c1fc62a245977", "bcbd05e859a44da48cf1cb6586b57b8d");
  }

  @override
  Widget build(BuildContext context) {
    final playlistID = ModalRoute.of(context)!.settings.arguments ?? "";
    futurePlaylistCompositions = spotifyAPI.fetchPlaylist(playlistID as String);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, clicks);
        return false;
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: constraint.maxHeight,
                        minWidth: constraint.maxWidth),
                    child:
                        Consumer<Library>(builder: (context, library, child) {
                      return Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(-0.6, -0.6),
                            colors: [
                              CustomColors(themeChangeProvider.darkTheme)
                                  .mainColor,
                              CustomColors(themeChangeProvider.darkTheme)
                                  .backgroundColor,
                            ],
                          )),
                          child: ListPage(
                              mainText: "Playlist",
                              dtp: themeChangeProvider,
                              getListItems: (BuildContext context,
                                  DarkThemeProvider dtp) {
                                Widget result =
                                    FutureBuilder<List<Composition>>(
                                  future: futurePlaylistCompositions,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<Composition> compositions =
                                          snapshot.data!;
                                      return Container(
                                        height: 1000,
                                        child: ListView.builder(
                                            itemCount: compositions.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                child: CompositionListItem(
                                                  composition:
                                                      compositions[index],
                                                  isDarkTheme: dtp.darkTheme,
                                                ),
                                                onTap: () => clicks++,
                                              );
                                            }).build(context),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                        child: Text(
                                          '${snapshot.error}',
                                          style: TextStyle(
                                              color: CustomColors(
                                                      themeChangeProvider
                                                          .darkTheme)
                                                  .textColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      );
                                    }

                                    // By default, show a loading spinner.
                                    return Center(
                                      child: const CircularProgressIndicator(),
                                    );
                                  },
                                );
                                return [result];
                              }));
                    })));
          },
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late DarkThemeProvider themeChangeProvider =
      Provider.of<DarkThemeProvider>(context);

  void _handleChangethemeTap(bool? value) {
    if (value != null) {
      setState(() {
        themeChangeProvider.darkTheme = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: constraint.maxHeight,
                      minWidth: constraint.maxWidth),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(-0.6, -0.6),
                      colors: [
                        CustomColors(themeChangeProvider.darkTheme).mainColor,
                        CustomColors(themeChangeProvider.darkTheme)
                            .backgroundColor,
                      ],
                    )),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 55, 20, 5),
                        child: Column(
                          children: [
                            Text("Settings",
                                style: TextStyle(
                                    color: CustomColors(
                                            themeChangeProvider.darkTheme)
                                        .textColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800)),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.symmetric(horizontal:
                                  BorderSide(color: CustomColors(
                                            themeChangeProvider.darkTheme)
                                        .lightGrey))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Change theme",
                                      style: TextStyle(
                                          color: CustomColors(
                                                  themeChangeProvider.darkTheme)
                                              .textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800)),
                                  Switch(
                                    value: themeChangeProvider.darkTheme,
                                    onChanged: _handleChangethemeTap,
                                    activeColor: CustomColors(
                                            themeChangeProvider.darkTheme)
                                        .lightGrey,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  )));
        },
      ),
    );
  }
}
