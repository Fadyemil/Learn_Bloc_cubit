import 'package:flutter/material.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/Sign_inWidget/Sign_in_Filed.dart';
// import 'package:sin_api/widgets/Sign_inWidget/Sign_in_Filed.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String id = "SignInScreen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: (){
           FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color(0xffEEF1F3),
          body: Sign_in_Filed(size: size),
        ),
      ),
    );
  }
}
