import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/characters/characters_bloc.dart';

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
        // onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
        //     arguments: charactersModel),
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
