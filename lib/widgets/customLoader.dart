import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class VirusLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: HeartbeatProgressIndicator(
        child: SizedBox(
            height: 40.0,
            child: Image(
              height: MediaQuery.of(context).size.height,
              image: AssetImage('assets/images/loader.png'),
            )),
      ),
    );
  }
}
