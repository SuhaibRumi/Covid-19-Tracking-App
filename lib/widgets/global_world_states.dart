import 'package:covid_19_tracking_app/Model/world_states.model.dart';
import 'package:covid_19_tracking_app/widgets/global_list.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../utils/assests.dart';
import '../utils/color.dart';
import '../view/world_states_screen.dart';
import 'virus_Loader.dart';

class GlobalWorldStatesList extends StatelessWidget {
  final formatter = NumberFormat("###,###");

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      top: height * 0.07,
      child: FutureBuilder(
        future: worldStateViewModel.fetchWorldRecords(),
        builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
          if (snapshot.hasData) {
            (snapshot.data!.cases);
            (snapshot.data!.deaths);
            (snapshot.data!.recovered);
            return Container(
              height: height * 0.7,
              width: width * 0.95,
              child: ListView(
                children: <Widget>[
                  GlobalListTile(
                    caseInfo: snapshot.data!.cases.toString(),
                    infoHeader: casesTitle,
                    tileColor:cases,
                    assetImage: covidBlue,
                  ),
                  GlobalListTile(
                    caseInfo: snapshot.data!.deaths.toString(),
                    infoHeader: deathsTitle,
                    tileColor: deaths,
                    assetImage: covidRed,
                  ),
                  GlobalListTile(
                    caseInfo: snapshot.data!.recovered.toString(),
                    infoHeader: recoveriesTitle,
                    tileColor: recoveries,
                    assetImage: covidGreen,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
                width: width,
                height: height * 0.4,
                child: Center(child: Text("${snapshot.error}")));
          }
          return Container(
            width: width,
            height: height * 0.4,
            child: Center(
              child: VirusLoader(),
            ),
          );
        },
      ),
    );
  }
}
