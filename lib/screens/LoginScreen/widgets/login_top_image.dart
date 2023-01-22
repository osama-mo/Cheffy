import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    this.logo = "assets/imgs/logo.png",
    Key? key,
  }) : super(key: key);

  final String logo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0 * 4),
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                logo,
                width: 80,
              ),
            ),
            const Text(
              "Asugar",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                  fontFamily: 'share',
                  color: Color.fromARGB(255, 2, 111, 161)),
            )
          ],
        )),
        const SizedBox(height: 16.0 * 4),
        const Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        const SizedBox(height: 16.0 * 2),
      ],
    );
  }
}
