part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class AppChangeTeme extends ThemeState {
  final String? appThmem;

  AppChangeTeme({this.appThmem});
}
