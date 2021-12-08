import 'package:base/models/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../common/components.dart';
import '../models/composition.dart';

class ListPage extends StatelessWidget {
  late DarkThemeProvider dtp;
  late String mainText; 
  late List<Widget> Function(BuildContext context, DarkThemeProvider dtp) getListItems;

  ListPage({
    Key? key, DarkThemeProvider? dtp, String? mainText, 
    List<Widget> Function(BuildContext context, DarkThemeProvider dtp)? getListItems}) : super(key: key) {
    this.dtp = dtp!;
    this.mainText = mainText!; 
    this.getListItems = getListItems!; 
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
            padding: EdgeInsets.fromLTRB(20, 55, 20, 5),
            // Nav bar
            child: Column(
              children: <Widget>[
                    Text(
                      this.mainText,
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
                  getListItems(context, dtp),
            ));
  }
}
