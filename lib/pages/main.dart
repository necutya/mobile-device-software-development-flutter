
import 'package:base/models/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../common/components.dart';

class MainPage extends StatefulWidget {
  late DarkThemeProvider dtp;
  late void Function() onSettingsTap;

  MainPage({Key? key, DarkThemeProvider? dtp, void Function()? onSettingsTap}) : super(key: key) {
    this.dtp = dtp!;
    this.onSettingsTap = onSettingsTap!;
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

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
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: CustomColors(widget.dtp.darkTheme).textColor,
                      ),
                      Icon(
                        Icons.history,
                        color: CustomColors(widget.dtp.darkTheme).textColor,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: CustomColors(widget.dtp.darkTheme).textColor,
                        ),
                        onPressed: this.widget.onSettingsTap,
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
                            isDarkTheme: widget.dtp.darkTheme,
                            playlistId: "37i9dQZF1EIUFjCG9oFx2k?si=e24523bd6bb743fa"
                            ),
                        SizedBox(
                          width: 10.0,
                        ),
                        DayMixin(
                            imageSrc: 'assets/images/tima.jpeg',
                            text: 'Day mixin #2',
                            isDarkTheme: widget.dtp.darkTheme,
                            playlistId: "37i9dQZF1E35HpfmdpOmPR?si=514dc83243364071"
                            ),
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
                            isDarkTheme: widget.dtp.darkTheme,
                            playlistId: "37i9dQZF1EIYKAmQjM0nAQ?si=c19685413c704266"),
                        SizedBox(
                          width: 10.0,
                        ),
                        DayMixin(
                            imageSrc: 'assets/images/liked.jpeg',
                            text: 'Liked songs',
                            isDarkTheme: widget.dtp.darkTheme,
                            playlistId: "37i9dQZF1EUMDoJuT8yJsl?si=311eb1a9e12f4665"),
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
                            isDarkTheme: widget.dtp.darkTheme,
                            playlistId: "37i9dQZF1E369QCfppav3M?si=35df2b8198624c75"),
                        SizedBox(
                          width: 10.0,
                        ),
                        DayMixin(
                            imageSrc: 'assets/images/frank.jpeg',
                            text: 'Day mixin #5',
                            isDarkTheme: widget.dtp.darkTheme,
                            playlistId: "37i9dQZF1E38DSV3eGEa4u?si=bd1142e332a54813"),
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
