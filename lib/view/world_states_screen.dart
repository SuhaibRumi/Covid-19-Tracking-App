import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/model.dart';
import '../ViewModel/world_states_view_model.dart';
import '../widgets/customLoader.dart';
import '../widgets/global_list.dart';

class GlobalWorldStates extends StatefulWidget {
  const GlobalWorldStates({Key? key}) : super(key: key);

  @override
  State<GlobalWorldStates> createState() => _GlobalWorldStatesState();
}

WorldStateViewModel worldStateViewModel = WorldStateViewModel();

class _GlobalWorldStatesState extends State<GlobalWorldStates> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.02),
      width: width,
      height: height * 0.57,
      child: Stack(
        children: <Widget>[
          Text(
            "\tGlobal COVID-19",
            style: TextStyle(
              fontSize: height * 0.03,
              fontWeight: FontWeight.w700,
            ),
          ),
          GlobalDataList()
        ],
      ),
    );
  }
}

class GlobalDataList extends StatelessWidget {
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
                    infoHeader: 'Cases',
                    tileColor: Colors.blueAccent.withAlpha(500),
                    assetImage: 'assets/images/covidBlue.png',
                  ),
                  GlobalListTile(
                    caseInfo: snapshot.data!.deaths.toString(),
                    infoHeader: 'Deaths',
                    tileColor: Colors.red.withAlpha(500),
                    assetImage: 'assets/images/death.png',
                  ),
                  GlobalListTile(
                    caseInfo: snapshot.data!.recovered.toString(),
                    infoHeader: 'Recoveries',
                    tileColor: Colors.green.withAlpha(500),
                    assetImage: 'assets/images/recover.png',
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
