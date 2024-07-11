import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/user/user_bloc.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/App/custom_form_button.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/App/custom_input_field.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/App/page_header.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/App/page_heading.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/Sign_UP_Widget/already_have_an_account_widget.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/Sign_UP_Widget/pick_image_widget.dart';
class SignUpFiled extends StatelessWidget {
  const SignUpFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      },
      builder: (context, state) {
        return Column(
          children: <Widget>[
            const PageHeader(),
            const PageHeading(title: 'Sign-up'),
            //! Image
            const PickImageWidget(),
            const SizedBox(height: 16),
            //! Name
            CustomInputField(
              keyboardType: TextInputType.name,
              labelText: 'Name',
              hintText: 'Your name',
              isDense: true,
              controller: context.read<UserBloc>().signUpName,
            ),
            const SizedBox(height: 16),
            //!Email
            CustomInputField(
              keyboardType: TextInputType.emailAddress,
              labelText: 'Email',
              hintText: 'Your email',
              isDense: true,
              controller: context.read<UserBloc>().signUpEmail,
            ),
            const SizedBox(height: 16),
            //! Phone Number
            CustomInputField(
              keyboardType: TextInputType.phone,
              labelText: 'Phone number',
              hintText: 'Your phone number ex:01234567890',
              isDense: true,
              controller: context.read<UserBloc>().signUpPhoneNumber,
            ),
            const SizedBox(height: 16),
            //! Password
            CustomInputField(
              keyboardType: TextInputType.visiblePassword,
              labelText: 'Password',
              hintText: 'Your password',
              isDense: true,
              obscureText: true,
              suffixIcon: true,
              controller: context.read<UserBloc>().signUpPassword,
            ),
            //! Confirm Password
            CustomInputField(
              keyboardType:TextInputType.visiblePassword,
              labelText: 'Confirm Password',
              hintText: 'Confirm Your password',
              isDense: true,
              obscureText: true,
              suffixIcon: true,
              controller: context.read<UserBloc>().confirmPassword,
            ),
            const SizedBox(height: 22),
            //!Sign Up Button
            if (state is SignUpLoading)
              const CircularProgressIndicator()
            else
              CustomFormButton(
                innerText: 'Signup',
                onPressed: () {
                  context.read<UserBloc>().add(SignUPEvent());
                },
              ),
            const SizedBox(height: 18),
            //! Already have an account widget
            const AlreadyHaveAnAccountWidget(),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
