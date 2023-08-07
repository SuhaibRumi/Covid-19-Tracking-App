import 'package:covid_19_tracking_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import '../animation/faderAnimation.dart';
import '../widgets/personal_info.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {
  late AnimationController _controllerImage;
  late Animation<double> animation;
  late AnimationController _controller;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _controllerImage = new AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this)
      ..addListener(() => setState(() {}));
    animation = Tween(begin: 5.0, end: 20.0).animate(_controllerImage);
    _controllerImage.repeat();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerImage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Stack(
      children: <Widget>[
        Positioned(
          top: -height * 0.2,
          child: EntranceFader(
            key: _key,
            delay: Duration(milliseconds: 3000),
            duration: Duration(seconds: 5),
            offset: Offset(0, 1200),
            child: Opacity(
              opacity: 0.6,
              child: RotationTransition(
                turns: Tween(begin: 1.0, end: 0.0).animate(_controller),
                child: Image.asset(
                  ImageAssets.covidBlue,
                  height: height * 0.20,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: height * 0.3,
          right: -width * 0.5,
          child: EntranceFader(
            key: _formKey,
            delay: Duration(milliseconds: 500),
            duration: Duration(seconds: 8),
            offset: Offset(-width - 50, height * 0.5),
            child: Opacity(
              opacity: 0.5,
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Image.asset(
                  ImageAssets.covidRed,
                  height: height * 0.18,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Opacity(
            opacity: 0.4,
            child: RotationTransition(
              turns: Tween(begin: 2.0, end: 1.0).animate(_controller),
              child: Image.asset(
                ImageAssets.covidGreen,
                height: height * 0.2,
              ),
            ),
          ),
        ),
        Center(
          child: PersonalInfo(),
        )
      ],
    ));
  }
}
