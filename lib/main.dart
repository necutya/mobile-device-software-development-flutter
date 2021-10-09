import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const gothamFont = 'Gotham';
const spotifyColors = <String, Color>{
  'white': Colors.white,
  'green': Color(0xff2F8E50),
  'light_green': Color(0xff1ed760),
  'black': Color(0xff121212),
  'grey': Color(0xff272727),
  'light_grey': Color(0xff636363),
};

void main() => runApp(MaterialApp(
      home: SpotifyMain(),
    ));

class SpotifyMain extends StatelessWidget {
  const SpotifyMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: spotifyColors['black'],
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(-0.6, -0.6),
              colors: [
                spotifyColors['green'] ?? Colors.green,
                spotifyColors['black'] ?? Colors.black,
              ],
            )),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 55, 20, 5),
            // Nav bar
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Good morning",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: spotifyColors['white'],
                          fontFamily: gothamFont,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.history,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                ),
        
                // Day mixes
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            DayMixin(
                                imageSrc: 'assets/images/joji.jpeg',
                                text: 'Day mixin #1'),
                            SizedBox(
                              width: 10.0,
                            ),
                            DayMixin(
                                imageSrc: 'assets/images/tima.jpeg',
                                text: 'Day mixin #2'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            DayMixin(
                                imageSrc: 'assets/images/loqi.jpeg',
                                text: 'Day mixin #3'),
                            SizedBox(
                              width: 10.0,
                            ),
                            DayMixin(
                                imageSrc: 'assets/images/liked.jpeg',
                                text: 'Liked songs'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            DayMixin(
                                imageSrc: 'assets/images/anacondaz.jpeg',
                                text: 'Day mixin #4'),
                            SizedBox(
                              width: 10.0,
                            ),
                            DayMixin(
                                imageSrc: 'assets/images/frank.jpeg',
                                text: 'Day mixin #5'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        
                // For u
                SizedBox(height: 20),
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Only for you, Artem Lebedev",
                        style: TextStyle(
                            color: spotifyColors['white'],
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      height: 200,
                      padding: EdgeInsets.zero,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 10,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return new Tile(
                                imageSrc: 'assets/images/weekly_mixtape.jpeg',
                                text:
                                    'Your weekly mixtape of fresh music. Enjoy new music and deep custs picked for you.');
                          }),
                    ),
                  ],
                ),
        
                // Check out these Spotify playlists!
                SizedBox(height: 20),
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Check out these Spotify playlists!",
                        style: TextStyle(
                            color: spotifyColors['white'],
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      height: 200,
                      padding: EdgeInsets.zero,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 10,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return new Tile(
                                imageSrc: 'assets/images/indi.jpeg',
                                text:
                                    'Your weekly mixtape of fresh music. Enjoy new music and deep custs picked for you.');
                          }),
                    ),
                  ],
                ),
        
                // Favourite singers
                SizedBox(height: 20),
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Favourite singers",
                        style: TextStyle(
                            color: spotifyColors['white'],
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      height: 200,
                      padding: EdgeInsets.zero,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 10,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return new RoundedTile(
                                imageSrc: 'assets/images/joji.jpeg',
                                text:
                                    'Joji');
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
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
        selectedItemColor: spotifyColors['white'],
        unselectedItemColor: spotifyColors['light_grey'],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String imageSrc, text;

  const Tile({Key? key, required this.imageSrc, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        width: 150.0,
        child: Wrap(
          children: [
            Image.asset(
              this.imageSrc,
              width: 150,
              height: 150,
            ),
            Container(margin: EdgeInsets.only(bottom: 10)),
            Text(
              this.text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: spotifyColors['light_grey'],
                  fontSize: 14),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
      color: spotifyColors['black'],
    );
  }
}


class RoundedTile extends StatelessWidget {
  final String imageSrc, text;

  const RoundedTile({Key? key, required this.imageSrc, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        width: 150.0,
        child: Wrap(
          children: [
            Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(this.imageSrc)
                        )
                    )),
            
            Container(margin: EdgeInsets.only(bottom: 10)),
            Center(
              child: Text(
                this.text,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: spotifyColors['white'],
                    fontSize: 14),
              ),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
      color: spotifyColors['black'],
    );
  }
}

class DayMixin extends StatelessWidget {
  final String imageSrc;
  final String text;
  const DayMixin({Key? key, required this.imageSrc, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(4)),
                    child: Image.asset(this.imageSrc, width: 52, height: 52)),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontFamily: gothamFont,
                      color: spotifyColors['white'],
                      fontSize: 14,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Artem Lebedev',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(title: 'Artem Lebedev'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
