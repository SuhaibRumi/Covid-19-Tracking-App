import 'package:covid_19_tracking_app/utils/assests.dart';
import 'package:flutter/material.dart';
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
          backgroundColor: primaryColor,
          child: CircleAvatar(
            maxRadius: height * 0.10,
            backgroundImage: AssetImage(
              developerImage,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(name,
            style: TextStyle(
                fontFamily: primaryFont,
                color: kBGColor,
                fontSize: height * 0.03,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: height * 0.03,
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: secondaryFont,
              fontSize: height * 0.028),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            MainInfo(username: email, imgUrl: gmailLogo),
            MainInfo(username: name, imgUrl: githubLogo),
          ],
        )
      ],
    );
  }
}
