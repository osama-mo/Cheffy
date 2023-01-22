// import 'package:asugar/auth-requests.dart';
// import 'package:asugar/screens/signup_screen/widgets/signup_request_payload.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class SignupForm extends StatefulWidget {
//   const SignupForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<SignupForm> createState() => _SignupFormState();
// }

// class _SignupFormState extends State<SignupForm> {
//   @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp().whenComplete(() {
//       print("completed");
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     SignUpRequsetPayload signUpRequsetPayload =
//         SignUpRequsetPayload(password: "", email: "");
//     return Form(
//         key: formKey,
//         child: Column(children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 0),
//             child: TextFormField(
//               onSaved: (v) {
//                 signUpRequsetPayload.email = v!;
//               },
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Cant be Empty!';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.emailAddress,
//               textInputAction: TextInputAction.done,
//               cursorColor: Colors.lightBlue,
//               decoration: const InputDecoration(
//                 hintText: "Email",
//                 prefixIcon: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Icon(Icons.mail),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: TextFormField(
//               onSaved: (v) {
//                 signUpRequsetPayload.password = v!;
//               },
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Cant be Empty!';
//                 }
//                 return null;
//               },
//               textInputAction: TextInputAction.done,
//               obscureText: true,
//               cursorColor: Colors.lightBlue,
//               decoration: const InputDecoration(
//                 hintText: "password",
//                 prefixIcon: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Icon(Icons.lock),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Hero(
//                 tag: "signup_btn",
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (formKey.currentState!.validate()) {
//                       formKey.currentState!.save();
//                       var signupResponse =
//                           AuthClient().signup(signUpRequsetPayload);
//                       if (signupResponse == null) {
//                       } else {
//                         _showToast(context, signupResponse.toString());
//                       }
//                     }
//                   },
//                   child: Text(
//                     "Signup".toUpperCase(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16.0)
//         ]));
//   }
// }

// void _showToast(BuildContext context, String m) {
//   final scaffold = ScaffoldMessenger.of(context);
//   scaffold.showSnackBar(
//     SnackBar(
//       content: const Text("blalba"),
//       action: SnackBarAction(
//           label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
//     ),
//   );
// }
