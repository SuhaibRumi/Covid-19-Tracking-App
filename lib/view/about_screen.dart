import 'package:flutter/material.dart';

import 'package:covid_19_tracking_app/utils/color.dart';

import '../animation/faderAnimation.dart';

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
                  'assets/images/covidBlue.png',
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
                  'assets/images/covidRed.png',
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
                'assets/images/covidGreen.png',
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

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          maxRadius: height * 0.105,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            maxRadius: height * 0.10,
            backgroundImage: NetworkImage(
                "https://pbs.twimg.com/profile_images/1595796649246343169/y4H_svjl_400x400.jpg"),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text("Muhammad Suhaib Salman",
            style: TextStyle(
                fontFamily: 'MyFont',
                color: kBGColor,
                fontSize: height * 0.03,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: height * 0.03,
        ),
        Text(
          "Flutter Developer",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto Mono',
              fontSize: height * 0.028),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            MainInfo(
                username: "suhaibsohan007@gmail.com",
                imgUrl: 'assets/images/gmail-logo.png'),
            MainInfo(
                username: "SuhaibRumi",
                imgUrl: 'assets/images/github-logo.png'),
          ],
        )
      ],
    );
  }
}

class MainInfo extends StatelessWidget {
  final String, username, imgUrl;
  MainInfo(
      {Key? key, required this.username, required this.imgUrl, this.String})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 8,
        shadowColor: Colors.grey[500],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            leading: Image(
              height: 50,
              width: 50,
              image: AssetImage(imgUrl),
            ),
            title: Text(
              username,
              style: const TextStyle(color: kBGColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
