import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AnimatedApp",
      home: AnimatedApp(),
    );
  }
}

class AnimatedApp extends StatefulWidget {
  final List<MaterialColor> containersColors = [
    Colors.red,
    Colors.teal,
    Colors.indigo
  ];
  AnimatedApp({Key? key}) : super(key: key);

  double getContainerHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return (height) / 3.5;
  }

  @override
  _AnimatedAppState createState() => _AnimatedAppState();
}

class _AnimatedAppState extends State<AnimatedApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _curveAnimation;
  
  late ColorTween _colorTween;
  late Tween<double> _sizeTween;
  late AlignmentTween _alignmentTween;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _colorTween =
        ColorTween(begin: Colors.teal, end: Colors.yellow[100]);
    _sizeTween = Tween<double>(begin: 100.0, end: 370.0);
    _alignmentTween = AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: widget.containersColors[0],
                height: widget.getContainerHeight(context),
                width: _sizeTween.evaluate(_curveAnimation),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: _colorTween.evaluate(_curveAnimation),
                height: widget.getContainerHeight(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: _alignmentTween.evaluate(_curveAnimation),
                child: Container(
                  width: 100,
                  color: widget.containersColors[2],
                  height: widget.getContainerHeight(context),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.forward();
        }
      },),
    );
  }
}