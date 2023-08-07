import 'package:flutter/material.dart';

import '../ViewModel/world_states_view_model.dart';
import '../widgets/global_data_list.dart';

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
