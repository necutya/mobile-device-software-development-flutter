import 'package:base/models/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../common/components.dart';
import '../models/composition.dart';

class LibraryPage extends StatelessWidget {
  late DarkThemeProvider dtp;

  LibraryPage({
    Key? key, DarkThemeProvider? dtp}) : super(key: key) {
    this.dtp = dtp!;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> likedCompositions = [];
    Provider.of<Library>(context, listen: false).items.forEach((element) {
      likedCompositions.add(CompositionListItem(
        composition: element,
        isDarkTheme: this.dtp.darkTheme,
      ).build(context));
    });
    return Padding(
            padding: EdgeInsets.fromLTRB(20, 55, 20, 5),
            // Nav bar
            child: Column(
              children: <Widget>[
                    Text(
                      "Your library",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: CustomColors(this.dtp.darkTheme).textColor,
                        fontFamily: gothamFont,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ] +
                  likedCompositions,
            ));
  }
}
