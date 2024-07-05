part of 'app_theme_cubit.dart';

@immutable
sealed class AppThemeState {}

final class AppThemeInitial extends AppThemeState {}

final class LightCubit extends AppThemeState {
  // final String 
}

final class DarkCubit extends AppThemeState {}
