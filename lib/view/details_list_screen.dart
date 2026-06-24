import 'package:covid_19_tracking_app/utils/assests.dart';
import 'package:covid_19_tracking_app/utils/color.dart';
import 'package:flutter/material.dart';
import '../widgets/virus_Loader.dart';
import '../widgets/details_card.dart';

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
                      title: todayCasesTitle,
                      subtitle: widget.todayCases.toString(),
                      icon: Icons.masks,
                      iconColor:todayCase,
                    ),
                    DetailCard(
                      title: todayRecoveredTitle,
                      subtitle: widget.todayRecovered.toString(),
                      icon: Icons.security,
                      iconColor: todayRecovered,
                    ),
                    DetailCard(
                      title: todayDeathsTitle,
                      subtitle: widget.totalDeaths.toString(),
                      icon: Icons.person,
                      iconColor: totalDeaths,
                    ),
                    DetailCard(
                      title: activeCasesTitle,
                      subtitle: widget.active.toString(),
                      icon: Icons.access_time,
                      iconColor: activeCases,
                    ),
                    DetailCard(
                      title: totalCasesTitle,
                      subtitle: widget.totalCases.toString(),
                      icon: Icons.assignment,
                      iconColor:  totalCase,
                    ),
                    DetailCard(
                      title:  totalDeathsTitle,
                      iconColor: totalDeaths,
                      icon: Icons.airline_seat_individual_suite,
                      subtitle: widget.totalDeaths.toString(),
                    ),
                    DetailCard(
                      title: totalRecoveredTitle,
                      iconColor: totalRecovered,
                      icon: Icons.security_update_good,
                      subtitle: widget.totalRecovered.toString(),
                    ),
                    DetailCard(
                      title: totalTestsTitle,
                      subtitle: widget.test.toString(),
                      icon: Icons.colorize,
                      iconColor: testCases,
                    ),
                    DetailCard(
                      title: criticalCasesTitle,
                      subtitle: widget.critical.toString(),
                      icon: Icons.add_circle,
                      iconColor: criticalCases,
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

