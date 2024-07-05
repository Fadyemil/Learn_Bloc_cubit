class AppThemeBlocState {}

final class AppThemeBlocInitial extends AppThemeBlocState {}

final class LigthState extends AppThemeBlocState {
  final String? appTeme;

  LigthState({this.appTeme});
}

final class DarkState extends AppThemeBlocState {
  final String? appTeme;

  DarkState({this.appTeme});
}
