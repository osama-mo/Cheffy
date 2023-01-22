// import 'package:flutter/material.dart';

// import '../../widgets/background.dart';
// import 'widgets/signup_form.dart';
// import 'widgets/signup_top_image.dart';

// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       specialAppBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       child: SingleChildScrollView(
//           child: LayoutBuilder(builder: (context, constraints) {
//         if (constraints.maxWidth < 600) {
//           return const MobileSignupScreen();
//         } else {
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Expanded(
//                 child: LoginScreenTopImage(),
//               ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     SizedBox(
//                       width: 450,
//                       child: SignupForm(),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         }
//       })),
//     );
//   }
// }

// class MobileSignupScreen extends StatelessWidget {
//   const MobileSignupScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         const LoginScreenTopImage(),
//         Row(
//           children: const [
//             Spacer(),
//             Expanded(
//               flex: 8,
//               child: SignupForm(),
//             ),
//             Spacer(),
//           ],
//         ),
//       ],
//     );
//   }
// }
