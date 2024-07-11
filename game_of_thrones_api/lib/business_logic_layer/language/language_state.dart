part of 'language_bloc.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}

final class AppChangeLanguage extends LanguageState {
  final String? languageCode;

  AppChangeLanguage({this.languageCode});
}
