// ignore_for_file: body_might_complete_normally_nullable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/characters/characters_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/user/user_bloc.dart';
// import 'package:game_of_thrones_api/data_layer/api_server/characters_api_server.dart';
import 'package:game_of_thrones_api/data_layer/core/Api/dio_consumer.dart';
import 'package:game_of_thrones_api/data_layer/helper/route/routes.dart';
// import 'package:game_of_thrones_api/data_layer/repositories/characters_repositories.dart';
// import 'package:game_of_thrones_api/presentation_layer/screen/character_details.dart';
import 'package:game_of_thrones_api/presentation_layer/screen/charaters.dart';
import 'package:game_of_thrones_api/presentation_layer/screen/sign_in_screen.dart';
import 'package:game_of_thrones_api/presentation_layer/screen/sign_up_screen.dart';
// import 'package:game_of_thrones_api/presentation_layer/screen/login.dart';

class AppRouting {
  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case SignINScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      UserBloc(DioConsumer(is_login: true, dio: Dio())),
                  child: const SignInScreen(),
                ));
      case SignUp:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      UserBloc(DioConsumer(is_login: true, dio: Dio())),
                  child: const SignUpScreen(),
                ));
      case CharactersPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CharactersBloc(
                    api: DioConsumer(dio: Dio(), is_login: false),
                  ),
                  child: AllCharatersScreen(),
                ));
      case CharaterDetails:
        // return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(index: 1,));
      default:
    }
  }
}
