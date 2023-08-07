import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';
import '../utils/color.dart';
import 'main_info.dart';

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          maxRadius: height * 0.105,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            maxRadius: height * 0.10,
            backgroundImage: NetworkImage(ImageAssets.personalImg),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text("Muhammad Suhaib Salman",
            style: TextStyle(
                fontFamily: 'MyFont',
                color: kBGColor,
                fontSize: height * 0.03,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: height * 0.03,
        ),
        Text(
          "Flutter Developer",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto Mono',
              fontSize: height * 0.028),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            MainInfo(
                username: "suhaibsohan007@gmail.com",
                imgUrl: ImageAssets.gmailLogo),
            MainInfo(username: "SuhaibRumi", imgUrl: ImageAssets.githubLogo),
          ],
        )
      ],
    );
  }
}
