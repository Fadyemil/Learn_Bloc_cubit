// ignore_for_file: unused_local_variable

import 'package:connectivity_changetheme_localization/Business%20logic%20layer/connectivity/connectivity_bloc.dart';
import 'package:connectivity_changetheme_localization/Business%20logic%20layer/language/language_bloc.dart';
import 'package:connectivity_changetheme_localization/Business%20logic%20layer/theme/theme_bloc.dart';
import 'package:connectivity_changetheme_localization/data%20layer/helper/lang/appLocalizations.dart';
import 'package:connectivity_changetheme_localization/presentation%20layer/screen/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class material_app extends StatelessWidget {
  const material_app();
  /* const material_app({
    super.key,
    required this.lang,
    required this.theme,
    required this.message,
  });

  final String? lang;
  final String? theme;
  final String? message;*/

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
          Locale('en'), // الإنجليزية
          Locale('ar'), // العربية
        ],
        //~ القوائم المفوضة لترجمة النصوص وعناصر الواجهة
        localizationsDelegates: [
          AppLocalizations.delegate, //^ المفوض الخاص بالترجمات المخصصة لتطبيقك
          GlobalMaterialLocalizations
              .delegate, //^ المفوض لترجمات واجهات مكتبة الـMaterial
          GlobalWidgetsLocalizations
              .delegate, //^ المفوض لترجمات الواجهات العامة
          GlobalCupertinoLocalizations
              .delegate, //^ المفوض لترجمات واجهات مكتبة الـCupertino
        ],
        //~ دالة لتحديد اللغة المفضلة بناءً على إعدادات جهاز المستخدم
        localeListResolutionCallback: (deviceLocale, supportedLocales) {
          //~ التحقق من اللغات المدعومة ومطابقتها مع لغة الجهاز
          for (var locale in supportedLocales) {
            if (deviceLocale != null) {
              Locale device =
                  deviceLocale.first; //* الحصول على أول لغة مفضلة في الجهاز
              if (device.languageCode == locale.languageCode) {
                return device; //* إعادة لغة الجهاز إذا كانت مدعومة
              }
            }
          }
          return supportedLocales
              .first; //* إذا لم تكن لغة الجهاز مدعومة، يتم استخدام اللغة الافتراضية
        },
        theme: (themeState is AppChangeTeme)
            ? (themeState.appThmem == 'l')
                ? ThemeData.light()
                : ThemeData.dark()
            : ThemeData.light(),
        home: MyHomePage(
            message: connectivityState is IntertetConnected
                ? ' internet connection '
                : ' internet not connection'),
      );
    });
    //  return MaterialApp(
    //   locale: Locale(lang!),
    //   //~ دعم اللغات المتوفرة
    //   supportedLocales: const [
    //     Locale('en'), // الإنجليزية
    //     Locale('ar'), // العربية
    //   ],

    //   //~ القوائم المفوضة لترجمة النصوص وعناصر الواجهة
    //   localizationsDelegates: [
    //     AppLocalizations
    //         .delegate, //^ المفوض الخاص بالترجمات المخصصة لتطبيقك
    //     GlobalMaterialLocalizations
    //         .delegate, //^ المفوض لترجمات واجهات مكتبة الـMaterial
    //     GlobalWidgetsLocalizations
    //         .delegate, //^ المفوض لترجمات الواجهات العامة
    //     GlobalCupertinoLocalizations
    //         .delegate, //^ المفوض لترجمات واجهات مكتبة الـCupertino
    //   ],

    //   //~ دالة لتحديد اللغة المفضلة بناءً على إعدادات جهاز المستخدم
    //   localeListResolutionCallback:
    //       (deviceLocale, supportedLocales) {
    //     //~ التحقق من اللغات المدعومة ومطابقتها مع لغة الجهاز
    //     for (var locale in supportedLocales) {
    //       if (deviceLocale != null) {
    //         Locale device = deviceLocale
    //             .first; //* الحصول على أول لغة مفضلة في الجهاز
    //         if (device.languageCode == locale.languageCode) {
    //           return device; //* إعادة لغة الجهاز إذا كانت مدعومة
    //         }
    //       }
    //     }
    //     return supportedLocales
    //         .first; //* إذا لم تكن لغة الجهاز مدعومة، يتم استخدام اللغة الافتراضية
    //   },

    //   title: 'Flutter Demo',
    //   theme: theme == 'l' ? ThemeData.light() : ThemeData.dark(),
    //   home: MyHomePage(
    //     message: message!,
    //   ),
    // );
  }
}
