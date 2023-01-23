import 'package:cheffy/food_api_service.dart';
import 'package:cheffy/screens/MealDetailsScreen/meal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoCard extends StatelessWidget {
  const LogoCard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
          color: Color.fromARGB(255, 44, 44, 44),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 52.0, bottom: 8.0, right: 8.0),
                child: Image.asset(
                  "assets/imgs/logo.png",
                  scale: 15,
                ),
              ),
              Text("CHEFFY",
                  style: GoogleFonts.medievalSharp(
                      color: Colors.white, fontSize: 60.0)),
            ],
          )),
    );
  }
}
