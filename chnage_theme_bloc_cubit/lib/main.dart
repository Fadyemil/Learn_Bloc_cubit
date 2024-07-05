// ignore_for_file: unused_local_variable

import 'package:chnage_theme_bloc_cubit/Business_Logic_layer/app_Theme_Bloc/app_theme_bloc_bloc.dart';
import 'package:chnage_theme_bloc_cubit/Business_Logic_layer/app_Theme_Bloc/app_theme_bloc_event.dart';
// import 'package:chnage_theme_bloc_cubit/Business_Logic_layer/app_Theme_Bloc/app_theme_bloc_state.dart';
import 'package:chnage_theme_bloc_cubit/Business_Logic_layer/cubit/app_theme_cubit.dart';
import 'package:chnage_theme_bloc_cubit/data_layer/helper/constant.dart';
import 'package:chnage_theme_bloc_cubit/data_layer/model/Enums/themestate.dart';
import 'package:chnage_theme_bloc_cubit/presentation_layer/Home_Page.dart';
// import 'package:chnage_theme_bloc_cubit/presentation_layer/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //^ تأكيد تهيئة بيئة Flutter قبل استخدام أي من مكونات التطبيق.
  WidgetsFlutterBinding.ensureInitialized();

//^ الحصول على مثيل من SharedPreferences لتخزين البيانات بشكل دائم.
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          /**
           * ..add(InitialEvent())
           ** 1-  إرسال الحدث لأول مرة لقراءة التفضيلات وتحديث الحالة بناءً على القيمة المخزنة
           ** 2-  إرسال الحدث مرة أخرى لضمان استقرار الحالة بعد القراءة الأولية
           * ..ChangeTheme(Themestate.initial)
           ** 1-  إرسال الحدث لأول مرة لقراءة التفضيلات وتحديث الحالة بناءً على القيمة المخزنة
           ** 2-  إرسال الحدث مرة أخرى لضمان استقرار الحالة بعد القراءة الأولية
           */
          create: (context) => AppThemeBloc()..add(InitialEvent()),
        ),
        BlocProvider(
          create: (context) => AppThemeCubit()..ChangeTheme(Themestate.initial),
        ),
      ],
      /* // ~ using the Bloc
      // child: BlocBuilder<AppThemeBloc, AppThemeBlocState>(
      //   builder: (context, state) {
      //     if (state is LigthState) {
      //       return MaterialApp(
      //         title: 'Flutter Demo',
      //         theme: ThemeData.light(useMaterial3: true),
      //         home: const MyHomePage(),
      //       );
      //     } else if (State is DarkState) {
      //       return MaterialApp(
      //         title: 'Flutter Demo',
      //         //~ or use    theme == 'Light'?ThemeData.Ligt():ThemeData.dark(),
      //         theme: ThemeData.dark(useMaterial3: true),
      //         home: const MyHomePage(),
      //       );
      //     } else {
      //       return MaterialApp(
      //         title: 'Flutter Demo',
      //         theme: ThemeData.dark(useMaterial3: true),
      //         home: const MyHomePage(),
      //       );
      //     }
      //   },
      // ),*/
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          if (state is LightCubit) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData.light(useMaterial3: true),
              home: const MyHomePage(),
            );
          } else if (state is DarkCubit) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData.dark(useMaterial3: true),
              home: const MyHomePage(),
            );
          } else {
            String? theme = sharedPreferences!.getString("theme");
            return MaterialApp(
              title: 'Flutter Demo',
              theme: Theme == 'L' ? ThemeData.light() : ThemeData.dark(),
              home: const MyHomePage(),
            );
          }
        },
      ),
    );
  }
}
