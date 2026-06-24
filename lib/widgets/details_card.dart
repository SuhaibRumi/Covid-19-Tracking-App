import 'package:flutter/material.dart';

import '../utils/color.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 8,
      shadowColor: shadowColor,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            subtitle,
            style: TextStyle(fontSize: height * 0.03, fontFamily: primaryFont),
          ),
          subtitle: Text(
            title,
            style: TextStyle(fontSize: height * 0.02, fontFamily: primaryFont),
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
