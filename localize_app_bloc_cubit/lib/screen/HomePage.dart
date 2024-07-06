import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:localize_app_bloc_cubit/Business_Logic_layer/bloc/app_language_bloc.dart';
import 'package:localize_app_bloc_cubit/Business_Logic_layer/cubit/app_lan_cu_cubit.dart';
import 'package:localize_app_bloc_cubit/data_Layer/Enums/languageEnums.dart';

import '../data_Layer/helper/lang/appLocalizations.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)?.translate('home_page') ?? '',
              ),
              ElevatedButton(
                onPressed: () {
                  // context.read<AppLanguageBloc>().add(ArabicLanguageEvent());
                  context
                      .read<AppLanCuCubit>()
                      .appLanguageFunc(Languageenums.arabic);
                },
                child: const Text('اللغة العربية'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // context.read<AppLanguageBloc>().add(EnglishLanguageEvent());
                  context
                      .read<AppLanCuCubit>()
                      .appLanguageFunc(Languageenums.english);
                },
                child: const Text('English'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
