part of 'app_language_bloc.dart';

@immutable
sealed class AppLanguageEvent {}

class InitialLanguageEvent extends AppLanguageEvent {}

class ArabicLanguageEvent extends AppLanguageEvent {}

class EnglishLanguageEvent extends AppLanguageEvent {}
