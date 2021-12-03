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
        child: MaterialApp(
          home: SpotifyMain(),
        )));

class SpotifyMain extends StatefulWidget {
  const SpotifyMain({Key? key}) : super(key: key);

  @override
  State<SpotifyMain> createState() => _SpotifyMainState();
}

class _SpotifyMainState extends State<SpotifyMain> {
  late DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
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
      ),
      MainPage(
        dtp: themeChangeProvider,
      ),
      LibraryPage(
        dtp: themeChangeProvider,
      )
    ];

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: constraint.maxHeight, minWidth: constraint.maxWidth),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(-0.6, -0.6),
                colors: [
                  CustomColors(themeChangeProvider.darkTheme).mainColor,
                  CustomColors(themeChangeProvider.darkTheme).backgroundColor,
                ],
              )),
              child: _widgetOptions.elementAt(_selectedIndex)),
        ));
      }),
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
