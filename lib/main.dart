import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:base/pages/main.dart';
import 'package:base/pages/library.dart';
import 'models/composition.dart';
import 'components.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => Library(),
    child: MaterialApp(
      home: SpotifyMain(),
    )));

class SpotifyMain extends StatefulWidget {
  const SpotifyMain({Key? key}) : super(key: key);

  @override
  State<SpotifyMain> createState() => _SpotifyMainState();
}

class _SpotifyMainState extends State<SpotifyMain> {
  int _selectedIndex = 0;

  void _handlePageTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<StatelessWidget> _widgetOptions = <StatelessWidget>[
      MainPage(),
      MainPage(),
      LibraryPage()
    ];

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight, minWidth: constraint.maxWidth),
                child: _widgetOptions.elementAt(_selectedIndex)));
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
        selectedItemColor: spotifyColors['white'],
        unselectedItemColor: spotifyColors['light_grey'],
        onTap: _handlePageTap,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
