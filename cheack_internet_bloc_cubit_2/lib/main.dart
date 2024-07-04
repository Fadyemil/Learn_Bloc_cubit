import 'package:cheack_internet_bloc_cubit_2/Business_logic_layer/interNet_check/internet_check_bloc.dart';
import 'package:cheack_internet_bloc_cubit_2/Business_logic_layer/internetCubit/inter_net_cubit_cubit.dart';
import 'package:cheack_internet_bloc_cubit_2/prestion_layer/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InternetCheckBloc(),
          ),
          BlocProvider(
            create: (context) => InterNetCubitCubit(),
          ),
        ],
        child: Homepage(),
      ),
    );
  }
}
