part of 'app_lan_cu_cubit.dart';

@immutable
sealed class AppLanCuState {}

final class AppLanCuInitial extends AppLanCuState {}

final class AppChangeLangCu extends AppLanCuState {
  final String? languageCode;

  AppChangeLangCu({this.languageCode});
}
