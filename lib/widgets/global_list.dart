import 'package:flutter/material.dart';

import '../utils/color.dart';

class GlobalListTile extends StatelessWidget {
  final String caseInfo;
  final String infoHeader;
  final Color tileColor;
  final String assetImage;
  GlobalListTile(
      {required this.caseInfo, required this.infoHeader,required this.tileColor,required this.assetImage});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: tileColor,
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.04),
          width: width,
          height: height * 0.14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Global",
                    style: TextStyle(
                        color:whiteColor,
                        fontSize: height * .015,
                        fontFamily:   primaryFont),
                  ),
                  Text("Total $infoHeader",
                      style: TextStyle(
                          fontFamily:   primaryFont,
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.025)),
                  Text(caseInfo,
                      style: TextStyle(
                          fontFamily:   primaryFont,
                          color: whiteColor,
                          fontSize: height * 0.025))
                ],
              ),
              Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "$assetImage",
                    height: height * 0.1,
                  )),
            ],
          )),
    );
  }
}
