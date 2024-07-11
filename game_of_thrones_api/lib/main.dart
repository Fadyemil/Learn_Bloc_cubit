import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/characters/characters_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/connectivity/connectivity_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/language/language_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/theme/theme_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/user/user_bloc.dart';
import 'package:game_of_thrones_api/data_layer/cache/cach_helper.dart';
import 'package:game_of_thrones_api/data_layer/core/Api/dio_consumer.dart';
import 'package:game_of_thrones_api/data_layer/helper/contanst.dart';
// import 'package:game_of_thrones_api/data_layer/helper/contanst.dart';
import 'package:game_of_thrones_api/data_layer/helper/materApp.dart';
import 'package:game_of_thrones_api/data_layer/helper/observers/app_bloc_observer.dart';
import 'package:game_of_thrones_api/data_layer/helper/route/app_routing.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  Bloc.observer = AppBlocObserver();
  CacheHelper().init();
  runApp(MyApp(
    appRouting: AppRouting(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouting? appRouting;
  const MyApp({super.key, this.appRouting});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(InitialThemeEvent()),
        ),
        BlocProvider(
          create: (context) => LanguageBloc()..add(InitialLanguageEvent()),
        ),
        BlocProvider(
          create: (context) => ConnectivityBloc(),
        ),
        BlocProvider(
          create: (context) =>
              CharactersBloc(api: DioConsumer(dio: Dio(), is_login: false)),
        ),
        BlocProvider(
          create: (context) =>
              UserBloc(DioConsumer(dio: Dio(), is_login: true)),
        ),
      ],
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          var message = state is IntertetConnected
              ? state.internetMessage
              : 'internet Not connected';
          return material_app(
            message: message,
            appRouting: appRouting,
          );
        },
      ),
    );
  }
}
