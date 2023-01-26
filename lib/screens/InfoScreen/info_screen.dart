import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/background.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Developed By:",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            TextButton(
                onPressed: () {
                  launch("https://github.com/osama-mo");
                },
                child: Text(
                  'OSAMA AL MOSELLI',
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 20),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Api Source:",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            TextButton(
                onPressed: () {
                  launch("https://www.themealdb.com/");
                },
                child: Text(
                  'TheMealDB',
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 20),
                ))
          ],
        )
      ],
    )));
  }
}
