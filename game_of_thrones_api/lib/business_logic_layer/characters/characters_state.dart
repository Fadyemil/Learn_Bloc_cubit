part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoding extends CharactersState {
  
}

final class CharactersSuccess extends CharactersState {
  final List<CharactersModel> characters;

  CharactersSuccess({required this.characters});
}

final class CharactersFailer extends CharactersState {
   final String errMessage;

  CharactersFailer({required this.errMessage});
}
