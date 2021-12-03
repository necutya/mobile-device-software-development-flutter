import 'package:base/models/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../common/components.dart';

class MainPage extends StatefulWidget {
  late DarkThemeProvider dtp;

  MainPage({Key? key, DarkThemeProvider? dtp}) : super(key: key) {
    this.dtp = dtp!;
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _handleChangethemeTap(bool? value) {
    if (value != null) {
      setState(() {
        widget.dtp.darkTheme = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                      color: CustomColors(widget.dtp.darkTheme).textColor,
                      fontFamily: gothamFont,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Switch(
                        value: widget.dtp.darkTheme,
                        onChanged: _handleChangethemeTap,
                        activeColor: CustomColors(widget.dtp.darkTheme).black,
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: CustomColors(widget.dtp.darkTheme).textColor,
                      ),
                      Icon(
                        Icons.history,
                        color: CustomColors(widget.dtp.darkTheme).textColor,
                      ),
                      Icon(
                        Icons.settings,
                        color: CustomColors(widget.dtp.darkTheme).textColor,
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
                            text: 'Day mixin #1',
                            isDarkTheme: widget.dtp.darkTheme),
                        SizedBox(
                          width: 10.0,
                        ),
                        DayMixin(
                            imageSrc: 'assets/images/tima.jpeg',
                            text: 'Day mixin #2',
                            isDarkTheme: widget.dtp.darkTheme),
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
                            text: 'Day mixin #3',
                            isDarkTheme: widget.dtp.darkTheme),
                        SizedBox(
                          width: 10.0,
                        ),
                        DayMixin(
                            imageSrc: 'assets/images/liked.jpeg',
                            text: 'Liked songs',
                            isDarkTheme: widget.dtp.darkTheme),
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
                            text: 'Day mixin #4',
                            isDarkTheme: widget.dtp.darkTheme),
                        SizedBox(
                          width: 10.0,
                        ),
                        DayMixin(
                            imageSrc: 'assets/images/frank.jpeg',
                            text: 'Day mixin #5',
                            isDarkTheme: widget.dtp.darkTheme),
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
                isDarkTheme: widget.dtp.darkTheme),
            SizedBox(height: 30),
            NewRelease(
                imageCompositionSrc: 'assets/images/anacondaz.jpeg',
                imageReleaseSrc: 'assets/images/anacondaz.jpeg',
                releaseType: 'Single',
                singer: 'Anacondaz',
                composition: 'Дубак',
                isDarkTheme: widget.dtp.darkTheme),

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
                        color: CustomColors(widget.dtp.darkTheme).textColor,
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
                                'Your weekly mixtape of fresh music. Enjoy new music and deep custs picked for you.',
                            isDarkTheme: widget.dtp.darkTheme);
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
                        color:  CustomColors(widget.dtp.darkTheme).textColor,
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
                                'Your weekly mixtape of fresh music. Enjoy new music and deep custs picked for you.',
                            isDarkTheme: widget.dtp.darkTheme);
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
                        color: CustomColors(widget.dtp.darkTheme).textColor,
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
                            text: 'Joji',
                            isDarkTheme: widget.dtp.darkTheme);
                      }),
                ),
              ],
            )
          ],
        ),
      );
  }
}
