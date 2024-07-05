// import 'package:chnage_theme_bloc_cubit/Business_Logic_layer/app_Theme_Bloc/app_theme_bloc_bloc.dart';
// import 'package:chnage_theme_bloc_cubit/Business_Logic_layer/app_Theme_Bloc/app_theme_bloc_event.dart';
import 'package:chnage_theme_bloc_cubit/Business_Logic_layer/cubit/app_theme_cubit.dart';
import 'package:chnage_theme_bloc_cubit/data_layer/model/Enums/themestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitching = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: Switch(
          value: isSwitching,
          onChanged: (value) {
            setState(() {
              isSwitching = value;
            });
            if (isSwitching == false) {
              context.read<AppThemeCubit>().ChangeTheme(Themestate.light);
            } else {
              context.read<AppThemeCubit>().ChangeTheme(Themestate.dark);
            }
          },
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // BlocProvider.of<AppThemeBloc>(context).add(DarkEvent());
                  context.read<AppThemeCubit>().ChangeTheme(Themestate.dark);
                },
                child: Text(
                  'Dark theme',
                  selectionColor: Colors.red,
                )),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  //~ using  Bloc
                  // BlocProvider.of<AppThemeBloc>(context).add(LightEvent());

                  //~ using cubit
                  context.read<AppThemeCubit>().ChangeTheme(Themestate.light);
                },
                child: Text('Light theme')),
          ],
        ),
      ),
    );
  }
}
