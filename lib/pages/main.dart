import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../components.dart';
import '../models/composition.dart';

class MainPage extends StatelessWidget {
  final ValueChanged<Composition> onChanged;

  const MainPage({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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

            // New Releases
            SizedBox(height: 20),
            NewRelease(
              imageCompositionSrc: 'assets/images/joji.jpeg',
              imageReleaseSrc: 'assets/images/joji.jpeg',
              releaseType: 'Single',
              singer: 'Joji',
              composition: 'Pretty boy',
              onChanged: onChanged,
            ),
            SizedBox(height: 30),
            NewRelease(
              imageCompositionSrc: 'assets/images/anacondaz.jpeg',
              imageReleaseSrc: 'assets/images/anacondaz.jpeg',
              releaseType: 'Single',
              singer: 'Anacondaz',
              composition: 'Дубак',
              onChanged: onChanged,
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
                            imageSrc: 'assets/images/joji.jpeg', text: 'Joji');
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
