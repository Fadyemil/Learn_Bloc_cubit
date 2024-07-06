// ignore_for_file: unused_local_variable
import 'package:connectivity_changetheme_localization/Business%20logic%20layer/connectivity/connectivity_bloc.dart';
import 'package:connectivity_changetheme_localization/Business%20logic%20layer/language/language_bloc.dart';
import 'package:connectivity_changetheme_localization/Business%20logic%20layer/theme/theme_bloc.dart';
import 'package:connectivity_changetheme_localization/data%20layer/helper/contanst.dart';
import 'package:connectivity_changetheme_localization/data%20layer/helper/lang/appLocalizations.dart';
// import 'package:connectivity_changetheme_localization/data%20layer/helper/lang/materAppLocalization.dart';
import 'package:connectivity_changetheme_localization/presentation%20layer/screen/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
        var theme = themeState is AppChangeTeme ? themeState.appThmem : 'l';
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, langState) {
            var lang =
                langState is AppChangeLanguage ? langState.languageCode : 'en';

            return BlocBuilder<ConnectivityBloc, ConnectivityState>(
              builder: (context, internetState) {
                var message = internetState is IntertetConnected
                    ? internetState.internetMessage
                    : 'internet Not connected';
                return MaterialApp(
                  locale: Locale(lang!),
                  //~ دعم اللغات المتوفرة
                  supportedLocales: const [
                    Locale('en'), // الإنجليزية
                    Locale('ar'), // العربية
                  ],

                  //~ القوائم المفوضة لترجمة النصوص وعناصر الواجهة
                  localizationsDelegates: [
                    AppLocalizations
                        .delegate, //^ المفوض الخاص بالترجمات المخصصة لتطبيقك
                    GlobalMaterialLocalizations
                        .delegate, //^ المفوض لترجمات واجهات مكتبة الـMaterial
                    GlobalWidgetsLocalizations
                        .delegate, //^ المفوض لترجمات الواجهات العامة
                    GlobalCupertinoLocalizations
                        .delegate, //^ المفوض لترجمات واجهات مكتبة الـCupertino
                  ],

                  //~ دالة لتحديد اللغة المفضلة بناءً على إعدادات جهاز المستخدم
                  localeListResolutionCallback:
                      (deviceLocale, supportedLocales) {
                    //~ التحقق من اللغات المدعومة ومطابقتها مع لغة الجهاز
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null) {
                        Locale device = deviceLocale
                            .first; //* الحصول على أول لغة مفضلة في الجهاز
                        if (device.languageCode == locale.languageCode) {
                          return device; //* إعادة لغة الجهاز إذا كانت مدعومة
                        }
                      }
                    }
                    return supportedLocales
                        .first; //* إذا لم تكن لغة الجهاز مدعومة، يتم استخدام اللغة الافتراضية
                  },

                  title: 'Flutter Demo',
                  theme: theme == 'l' ? ThemeData.light() : ThemeData.dark(),
                  home: MyHomePage(
                    message: message!,
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
