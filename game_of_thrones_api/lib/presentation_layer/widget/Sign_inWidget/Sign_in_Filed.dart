import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/characters/characters_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/user/user_bloc.dart';
import 'package:game_of_thrones_api/data_layer/helper/route/routes.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/App/custom_form_button.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/App/custom_input_field.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/App/page_header.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/App/page_heading.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/Sign_inWidget/dont_have_an_account.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/Sign_inWidget/forget_password_widget.dart';

class Sign_in_Filed extends StatelessWidget {
  const Sign_in_Filed({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(listener: (context, state) {
      if (state is SignInSucess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("success"),
          ),
        );
        context.read<CharactersBloc>().add(GetCharactersEvent());
        Navigator.pushNamed(context, CharactersPage);
      } else if (state is SignInFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'opps error enter email , password  reset or cheack Email'),
          ),
        );
      }
    }, builder: (context, state) {
      return Column(
        children: [
          const PageHeader(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: context.read<UserBloc>().signInFormKey,
                  child: Column(
                    children: [
                      const PageHeading(title: 'Sign-in'),
                      //!Email
                      CustomInputField(
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                        hintText: 'Your email',
                        controller: context.read<UserBloc>().signInEmail,
                      ),
                      const SizedBox(height: 16),
                      //!Password
                      CustomInputField(
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'Password',
                        hintText: 'Your password',
                        obscureText: true,
                        suffixIcon: true,
                        controller: context.read<UserBloc>().signInPassword,
                      ),
                      const SizedBox(height: 16),
                      //! Forget password?
                      ForgetPasswordWidget(size: size),
                      const SizedBox(height: 20),
                      //!Sign In Button
                      if (state is SignInLoading)
                        const CircularProgressIndicator()
                      else
                        CustomFormButton(
                          innerText: 'Sign In',
                          onPressed: () {
                            context.read<UserBloc>().add(SignInEvent());
                          },
                        ),
                      const SizedBox(height: 18),
                      //! Dont Have An Account ?
                      DontHaveAnAccountWidget(size: size),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
