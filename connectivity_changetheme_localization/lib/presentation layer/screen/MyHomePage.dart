import 'package:connectivity_changetheme_localization/Business%20logic%20layer/language/language_bloc.dart';
import 'package:connectivity_changetheme_localization/Business%20logic%20layer/theme/theme_bloc.dart';
import 'package:connectivity_changetheme_localization/data%20layer/helper/lang/appLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.message});

  final String message;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)?.translate('home_page') ?? '',
            ),
            Text(widget.message),
            ElevatedButton(
                onPressed: () {
                  context.read<LanguageBloc>().add(ArabicLanguageEvent());
                },
                child: const Text('اللغة العربية')),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  context.read<LanguageBloc>().add(EnglishLanguageEvent());
                },
                child: const Text('english')),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(LightThemeEvent());
                },
                child: const Text('Light theme')),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(DarkThemeEvent());
                },
                child: const Text('Dark theme')),
          ],
        ),
      ),
    );
  }
}
