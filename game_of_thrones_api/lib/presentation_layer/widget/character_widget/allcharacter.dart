// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/characters/characters_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/language/language_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/theme/theme_bloc.dart';
import 'package:game_of_thrones_api/data_layer/helper/lang/app_localizations.dart';
import 'package:game_of_thrones_api/presentation_layer/screen/character_details.dart';

class AllCharacter extends StatefulWidget {
  const AllCharacter({super.key});

  @override
  State<AllCharacter> createState() => _AllCharacterState();
}

class _AllCharacterState extends State<AllCharacter> {
  @override
  Widget build(BuildContext context) {
    var data = context.read<CharactersBloc>().charactersModels;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)?.translate('home_page') ?? '',
            ),
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
      body: Container(
        color: Color.fromARGB(255, 52, 58, 64),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return CharacterItem(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    var data = context.read<CharactersBloc>().charactersModels;
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(index: index),
          ),
        ),
        child: GridTile(
          footer: Hero(
            tag: data[index].id!,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                data[index].fullName!,
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: Colors.grey,
            child: data[index].imageUrl != null
                ? FadeInImage.assetNetwork(
                    width: MediaQuery.of(context).size.width * 0.01,
                    height: MediaQuery.of(context).size.height * 0.1,
                    placeholder: 'assets/images/Loading1.gif',
                    image: data[index].imageUrl!,
                    fit: BoxFit.fill,
                  )
                : Image.asset('assets/images/No_Found.gif'),
          ),
        ),
      ),
    );
  }
}
