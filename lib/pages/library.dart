import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../components.dart';
import '../models/composition.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> likedCompositions = [];
    Provider.of<Library>(context, listen: false).items.forEach((element) {
      likedCompositions.add(CompositionListItem(
        composition: element,
      ).build(context));
    });
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
              children: <Widget>[
                    Text(
                      "Your library",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: spotifyColors['white'],
                        fontFamily: gothamFont,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ] +
                  likedCompositions,
            )));
  }
}
