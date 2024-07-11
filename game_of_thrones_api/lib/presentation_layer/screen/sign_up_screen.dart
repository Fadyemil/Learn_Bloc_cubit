import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/user/user_bloc.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/Sign_UP_Widget/Sign_UPFiled.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: const Color(0xffEEF1F3),
          body: SingleChildScrollView(
            child: Form(
              key: context.read<UserBloc>().signUpFormKey,
              child: SignUpFiled(),
            ),
          ),
        ),
      ),
    );
  }
}
