import 'package:covid_19_tracking_app/utils/color.dart';
import 'package:flutter/material.dart';

import '../widgets/customLoader.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      todayCases,
      test;

  const DetailScreen({
    Key? key,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.todayCases,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: kCardColor,
              expandedHeight: height * 0.22,
              pinned: true,
              elevation: 8.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: VirusLoader(),
                title: Text(widget.name),
              ),
            ),
            SliverFillRemaining(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Column(children: <Widget>[
                    DetailCard(
                      title: "Today Cases",
                      subtitle: widget.todayCases.toString(),
                      icon: Icons.masks,
                      iconColor: Colors.blue,
                    ),
                    DetailCard(
                      title: "Today Recovered",
                      subtitle: widget.todayRecovered.toString(),
                      icon: Icons.security,
                      iconColor: Colors.green,
                    ),
                    DetailCard(
                      title: "Today Deaths",
                      subtitle: widget.totalDeaths.toString(),
                      icon: Icons.person,
                      iconColor: Colors.red,
                    ),
                    DetailCard(
                      title: "Actives Cases",
                      subtitle: widget.active.toString(),
                      icon: Icons.access_time,
                      iconColor: Colors.purple,
                    ),
                    DetailCard(
                      title: "Total Cases",
                      subtitle: widget.totalCases.toString(),
                      icon: Icons.assignment,
                      iconColor: Colors.blue,
                    ),
                    DetailCard(
                      title: "Total Deaths",
                      iconColor: Colors.red,
                      icon: Icons.airline_seat_individual_suite,
                      subtitle: widget.totalDeaths.toString(),
                    ),
                    DetailCard(
                      title: "Total Recoveries",
                      iconColor: Colors.green,
                      icon: Icons.security_update_good,
                      subtitle: widget.totalRecovered.toString(),
                    ),
                    DetailCard(
                      title: "Total Tests",
                      subtitle: widget.test.toString(),
                      icon: Icons.colorize,
                      iconColor: Colors.amber,
                    ),
                    DetailCard(
                      title: "Critical Cases",
                      subtitle: widget.critical.toString(),
                      icon: Icons.add_circle,
                      iconColor: Colors.deepOrange,
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// * this is custome card Widget
class DetailCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  DetailCard(
      {required this.title,
      required this.icon,
      required this.subtitle,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Card(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            subtitle,
            style: TextStyle(fontSize: height * 0.03, fontFamily: "MyFont"),
          ),
          subtitle: Text(
            title,
            style: TextStyle(fontSize: height * 0.02, fontFamily: "MyFont"),
          ),
          trailing: Icon(
            icon,
            size: height * 0.06,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
