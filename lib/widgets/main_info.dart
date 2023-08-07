import 'package:flutter/material.dart';

import '../utils/color.dart';

class MainInfo extends StatelessWidget {
  final String, username, imgUrl;
  MainInfo(
      {Key? key, required this.username, required this.imgUrl, this.String})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 8,
        shadowColor: Colors.grey[500],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            leading: Image(
              height: 50,
              width: 50,
              image: AssetImage(imgUrl),
            ),
            title: Text(
              username,
              style: const TextStyle(color: kBGColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
