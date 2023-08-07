import 'package:flutter/material.dart';

import '../Model/world_states.model.dart';
import '../utils/assets_manager.dart';
import '../view/view.dart';
import 'customLoader.dart';
import 'global_list.dart';

class GlobalDataList extends StatelessWidget {
  

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
                    assetImage:ImageAssets.covidBlue,
                  ),
                  GlobalListTile(
                    caseInfo: snapshot.data!.deaths.toString(),
                    infoHeader: 'Deaths',
                    tileColor: Colors.red.withAlpha(500),
                    assetImage: ImageAssets.death,
                  ),
                  GlobalListTile(
                    caseInfo: snapshot.data!.recovered.toString(),
                    infoHeader: 'Recoveries',
                    tileColor: Colors.green.withAlpha(500),
                    assetImage: ImageAssets.recoverUser,
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
