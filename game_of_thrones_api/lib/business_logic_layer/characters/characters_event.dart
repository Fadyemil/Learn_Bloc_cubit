// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class GetCharactersEvent extends CharactersEvent {
  
  GetCharactersEvent();
}
