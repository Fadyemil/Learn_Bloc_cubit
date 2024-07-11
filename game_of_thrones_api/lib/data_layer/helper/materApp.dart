// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game_of_thrones_api/business_logic_layer/connectivity/connectivity_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/language/language_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/theme/theme_bloc.dart';
import 'package:game_of_thrones_api/data_layer/helper/lang/app_localizations.dart';
import 'package:game_of_thrones_api/data_layer/helper/route/app_routing.dart';

class material_app extends StatelessWidget {
  final AppRouting? appRouting;
  const material_app({this.message, this.appRouting});
  /* const material_app({
    super.key,
    required this.lang,
    required this.theme,
    required this.message,
  });

  final String? lang;
  final String? theme;
  final String? message;*/
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var themeState = context.select((ThemeBloc bloc) => bloc.state);
      var langState = context.select((LanguageBloc bloc) => bloc.state);
      var connectivityState =
          context.select((ConnectivityBloc bloc) => bloc.state);
      return MaterialApp(
        locale: (langState is AppChangeLanguage)
            ? (langState.languageCode == 'en')
                ? const Locale('en')
                : const Locale('ar')
            : const Locale('en'),
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        //~ Delegates for translating texts and UI elements
        localizationsDelegates: [
          AppLocalizations
              .delegate, //^ Custom translations delegate for your app
          GlobalMaterialLocalizations
              .delegate, //^ Translations delegate for Material library
          GlobalWidgetsLocalizations
              .delegate, //^ General UI translations delegate
          GlobalCupertinoLocalizations
              .delegate, //^ Translations delegate for Cupertino library
        ],
        //~ Function to determine the preferred language based on user device settings
        localeListResolutionCallback: (deviceLocale, supportedLocales) {
          //~ Check supported languages and match them with the device language
          for (var locale in supportedLocales) {
            if (deviceLocale != null) {
              Locale device = deviceLocale
                  .first; //* Get the first preferred language on the device
              if (device.languageCode == locale.languageCode) {
                return device; //* Return device language if supported
              }
            }
          }
          return supportedLocales
              .first; //* Use default language if device language is not supported
        },
        theme: (themeState is AppChangeTeme)
            ? (themeState.appThmem == 'l')
                ? ThemeData.light()
                : ThemeData.dark()
            : ThemeData.light(),
        onGenerateRoute: appRouting!.generateRoute,
      );
    });
  }
}
