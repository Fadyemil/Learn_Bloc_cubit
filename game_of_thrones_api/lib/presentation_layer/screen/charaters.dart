// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/characters/characters_bloc.dart';
import 'package:game_of_thrones_api/presentation_layer/widget/character_widget/allcharacter.dart';

class AllCharatersScreen extends StatefulWidget {
  const AllCharatersScreen({super.key});

  @override
  State<AllCharatersScreen> createState() => _AllCharatersScreenState();
}

class _AllCharatersScreenState extends State<AllCharatersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CharactersBloc>().add(GetCharactersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoding) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CharactersFailer) {
          return Scaffold(
            body: Center(
              child: Text(state.errMessage),
            ),
          );
        } else if (state is CharactersSuccess) {
          return AllCharacter();
        } else {
          return Scaffold(
            body: Center(
              child: Text('error'),
            ),
          );
        }
      },
    );
  }
}

