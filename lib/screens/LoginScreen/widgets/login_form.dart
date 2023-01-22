// import 'package:cheffy/screens/signupScreen/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(children: [
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.lightBlue,
        decoration: const InputDecoration(
          hintText: "Your email",
          prefixIcon: Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.person),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TextFormField(
          textInputAction: TextInputAction.done,
          obscureText: true,
          cursorColor: Colors.lightBlue,
          decoration: const InputDecoration(
            hintText: "Your password",
            prefixIcon: Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.lock),
            ),
          ),
        ),
      ),
      const SizedBox(height: 16.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(width: 16.0 * 6),
          Hero(
            tag: "signup_btn",
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const SignupScreen();
                // }));
              },
              child: Text(
                "Signup".toUpperCase(),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 16.0)
    ]));
  }
}
