import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.topImage = "assets/imgs/logo.png",
    this.bottomImage = "",
  }) : super(key: key);

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.2,
              1.5,
            ],
            colors: [
              Color.fromARGB(255, 26, 25, 25),
              Color.fromARGB(255, 26, 25, 25)
            ],
          )),
          child: Stack(
            children: <Widget>[
              SafeArea(child: child),
            ],
          ),
        ));
  }
}
