import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'models/composition.dart';

const gothamFont = 'Gotham';
const spotifyColors = <String, Color>{
  'white': Colors.white,
  'green': Color(0xff2F8E50),
  'light_green': Color(0xff1ed760),
  'black': Color(0xff121212),
  'grey': Color(0xff272727),
  'light_grey': Color(0xff636363),
};

class MyLibrryPage extends StatelessWidget {
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
            child: Column()));
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
                        image: new AssetImage(this.imageSrc)))),
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

class CompositionListItem extends StatelessWidget {
  final Composition composition;
  const CompositionListItem({Key? key, required this.composition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
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
                  child: Image.asset(this.composition.cover,
                      width: 70, height: 70)),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.composition.name,
                    style: TextStyle(
                        fontFamily: gothamFont,
                        color: spotifyColors['white'],
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    this.composition.author,
                    style: TextStyle(
                        fontFamily: gothamFont,
                        color: spotifyColors['white'],
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class NewRelease extends StatelessWidget {
  final String imageReleaseSrc;
  final String imageCompositionSrc;
  final String singer;
  final String composition;
  final String releaseType;
  late final Composition likedCompos;

  NewRelease(
      {Key? key,
      required this.imageReleaseSrc,
      required this.imageCompositionSrc,
      required this.singer,
      required this.composition,
      required this.releaseType})
      : super(key: key) {
    likedCompos = Composition(singer, composition, imageCompositionSrc);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 65.0,
              height: 65.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage(this.imageReleaseSrc))),
              margin: EdgeInsets.only(right: 10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NEW RELEASE FROM',
                  style: TextStyle(
                      fontFamily: gothamFont,
                      color: spotifyColors['light_grey'],
                      fontSize: 9,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 5),
                Text(
                  this.singer,
                  style: TextStyle(
                      fontFamily: gothamFont,
                      color: spotifyColors['white'],
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 140,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(10)),
                        child: Image.asset(this.imageCompositionSrc,
                            width: 140, height: 140),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  this.composition,
                                  style: TextStyle(
                                      fontFamily: gothamFont,
                                      color: spotifyColors['white'],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${this.releaseType} • ${this.singer}',
                                  style: TextStyle(
                                      fontFamily: gothamFont,
                                      color: spotifyColors['white'],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Consumer<Library>(
                                builder: (context, library, child) {
                              return SizedBox(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        icon: (library
                                                .hasComposition(likedCompos))
                                            ? Icon(Icons.favorite)
                                            : Icon(Icons.favorite_border),
                                        iconSize: 30,
                                        color: spotifyColors['light_grey'],
                                        tooltip: 'Play the composition',
                                        onPressed: () {
                                          Provider.of<Library>(context,
                                                  listen: false)
                                              .addOrRemove(likedCompos);
                                        }),
                                    IconButton(
                                        icon: Icon(Icons.play_circle),
                                        iconSize: 45,
                                        color: spotifyColors['light_grey'],
                                        tooltip: 'Play the composition',
                                        onPressed: () {}),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
