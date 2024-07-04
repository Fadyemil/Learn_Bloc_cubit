import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_change_name_1/Business_logiclayer/name_bloc/name_state_bloc.dart';
import 'package:simple_change_name_1/prestion_layer/screen/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NameStateBloc(),
        child: Homepage(),
      ),
    );
  }
}
