import 'package:covid_19_tracking_app/utils/color.dart';
import 'package:covid_19_tracking_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  int currentIndex = 0;
  final List<Widget> children = [
    GlobalWorldStates(),
    CountriesListScreeen(),
    About(),
  ];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: InkWell(
          child: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: kBGColor,
            showUnselectedLabels: true,
            selectedFontSize: height * 0.02,
            iconSize: height * 0.035,
            onTap: onTabTapped,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                activeIcon: RotationTransition(
                  turns: Tween(begin: 0.0, end: 0.0).animate(_controller),
                  child: Icon(Icons.home_filled),
                ),
                icon: Icon(Icons.home_rounded),
                label: 'Global Country ',
              ),
              BottomNavigationBarItem(
                  activeIcon: RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.0).animate(_controller),
                    child: Icon(Icons.flag_circle),
                  ),
                  icon: Icon(Icons.flag),
                  label: "Countries States"),
              BottomNavigationBarItem(
                  activeIcon: RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.0).animate(_controller),
                    child: Icon(Icons.person),
                  ),
                  icon: Icon(Icons.info),
                  label: "About")
            ],
          ),
        ),
        body: currentIndex == 0
            ? WillPopScope(
                onWillPop: () async {
                  SystemNavigator.pop();
                  return true;
                },
                child: SafeArea(
                  child: Container(
                    child: Scaffold(
                      body: ListView(
                        children: <Widget>[
                          MainImage(),
                          SizedBox(height: height * 0.035),
                          children[currentIndex]
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : children[currentIndex],
      ),
    );
  }
}

class MainImage extends StatefulWidget {
  @override
  _MainImageState createState() => _MainImageState();
}

class _MainImageState extends State<MainImage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _animationController;

  toggleAnimation() {
    animation = Tween(begin: 0.0, end: 25.0).animate(_animationController);
    if (_animationController.isDismissed) {
      _animationController.forward().whenComplete(() => toggleAnimation());
    }
    if (_animationController.isCompleted) {
      _animationController.reverse().whenComplete(() => toggleAnimation());
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this)
      ..addListener(() => setState(() {}));
    toggleAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, animation.value),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/personFighting.png',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Stay Home, Stay Safe!",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
