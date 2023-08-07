import 'package:covid_19_tracking_app/utils/color.dart';
import 'package:covid_19_tracking_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ViewModel/main_image.dart';

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

