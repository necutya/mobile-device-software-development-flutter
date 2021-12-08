import 'package:base/common/requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../models/composition.dart';

const gothamFont = 'Gotham';

class CustomColors {
  late Color backgroundColor;
  late Color textColor;
  late Color tileColor;
  late Color activeColor;
  late Color inActiveColor;
  late Color mainColor;
  late Color black;
  late Color white;
  late Color lightGrey;

  CustomColors(bool isDarkTheme) {
    mainColor = Color(0xff2F8E50);
    backgroundColor = isDarkTheme ? Color(0xff121212) : Colors.white;
    textColor = isDarkTheme ? Colors.white : Color(0xff121212);
    activeColor = Colors.white;
    inActiveColor = Color(0xff636363);
    black = Color(0xff121212);
    white = Colors.white;
    lightGrey = isDarkTheme ? Color(0xff636363) : Color(0xff272727);
    tileColor =
        isDarkTheme ? Colors.grey.withOpacity(0.2) : black.withOpacity(0.6);
  }
}

class Tile extends StatelessWidget {
  final String imageSrc, text;
  final bool isDarkTheme;
  const Tile(
      {Key? key,
      required this.imageSrc,
      required this.text,
      required this.isDarkTheme})
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
                  color: CustomColors(this.isDarkTheme).lightGrey,
                  fontSize: 14),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
      color: CustomColors(this.isDarkTheme).backgroundColor,
    );
  }
}

class RoundedTile extends StatelessWidget {
  final String imageSrc, text;
  final bool isDarkTheme;
  const RoundedTile(
      {Key? key,
      required this.imageSrc,
      required this.text,
      required this.isDarkTheme})
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
                    color: CustomColors(this.isDarkTheme).textColor,
                    fontSize: 14),
              ),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
      color: CustomColors(this.isDarkTheme).backgroundColor,
    );
  }
}

class DayMixin extends StatelessWidget {
  final String imageSrc;
  final String text;
  final bool isDarkTheme;
  final String playlistId;

  late Future<List<Composition>> futureCompositions;

  DayMixin(
      {Key? key,
      required this.imageSrc,
      required this.text,
      required this.isDarkTheme,
      required this.playlistId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          var futureTask =
              Navigator.pushNamed(context, '/playlist', arguments: playlistId);
          futureTask.then((value) => ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('$value'))));
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: CustomColors(this.isDarkTheme).tileColor,
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
                        color: CustomColors(this.isDarkTheme).white,
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CompositionListItem extends StatelessWidget {
  final Composition composition;
  final bool isDarkTheme;
  const CompositionListItem(
      {Key? key, required this.composition, required this.isDarkTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: CustomColors(this.isDarkTheme).tileColor,
          ),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(4)),
                  child: Image.network(this.composition.cover,
                      errorBuilder: (context, object, stacktrace) {
                    return Image.asset(this.composition.cover,
                        width: 70, height: 70);
                  })),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.composition.name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      style: TextStyle(
                          fontFamily: gothamFont,
                          color: CustomColors(this.isDarkTheme).white,
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
                          color: CustomColors(this.isDarkTheme).white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
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
  final bool isDarkTheme;

  NewRelease(
      {Key? key,
      required this.imageReleaseSrc,
      required this.imageCompositionSrc,
      required this.singer,
      required this.composition,
      required this.releaseType,
      required this.isDarkTheme})
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
                      color: CustomColors(this.isDarkTheme).lightGrey,
                      fontSize: 9,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 5),
                Text(
                  this.singer,
                  style: TextStyle(
                      fontFamily: gothamFont,
                      color: CustomColors(this.isDarkTheme).textColor,
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
                color: CustomColors(this.isDarkTheme).tileColor,
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
                                      color:
                                          CustomColors(this.isDarkTheme).white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${this.releaseType} • ${this.singer}',
                                  style: TextStyle(
                                      fontFamily: gothamFont,
                                      color:
                                          CustomColors(this.isDarkTheme).white,
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
                                        color: CustomColors(this.isDarkTheme)
                                            .lightGrey,
                                        tooltip: 'Play the composition',
                                        onPressed: () {
                                          Provider.of<Library>(context,
                                                  listen: false)
                                              .addOrRemove(likedCompos);
                                        }),
                                    IconButton(
                                        icon: Icon(Icons.play_circle),
                                        iconSize: 45,
                                        color: CustomColors(this.isDarkTheme)
                                            .lightGrey,
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
