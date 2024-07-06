import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_app_bloc_cubit/Business_Logic_layer/bloc/app_language_bloc.dart';
import 'package:localize_app_bloc_cubit/Business_Logic_layer/cubit/app_lan_cu_cubit.dart';
import 'package:localize_app_bloc_cubit/data_Layer/Enums/languageEnums.dart';
import 'package:localize_app_bloc_cubit/data_Layer/helper/const.dart';
import 'package:localize_app_bloc_cubit/data_Layer/helper/lang/materAppLocalization.dart';
// import 'package:localize_app_bloc_cubit/data_Layer/helper/lang/materAppLocalization.dart';
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
          create: (context) => AppLanguageBloc()..add(InitialLanguageEvent()),
        ),
        BlocProvider(
          create: (context) =>
              AppLanCuCubit()..appLanguageFunc(Languageenums.Initial),
        ),
      ],
      // ~ using Bloc
      // child: BlocBuilder<AppLanguageBloc, AppLanguageState>(
      //   builder: (context, state) {
      //     if (state is AppChangeLanguage) {
      //       String? locae = state.languageCode!;
      //       return materAppLocalization(locae: locae);
      //     } else {
      //       return MaterialApp(
      //         title: 'Flutter Demo',
      //         theme: ThemeData(
      //           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //           useMaterial3: true,
      //         ),
      //         home: const Text('data'),
      //       );
      //     }
      //   },
      // ),

      child: BlocBuilder<AppLanCuCubit, AppLanCuState>(
        builder: (context, state) {
          if (state is AppChangeLangCu) {
            String? locae = state.languageCode!;
            return materAppLocalization(locae: locae);
          } else {
            return MaterialApp(
              home: const Text('data'),
            );
          }
        },
      ),
    );
  }
}
