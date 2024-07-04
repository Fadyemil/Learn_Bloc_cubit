part of 'internet_check_bloc.dart';

@immutable
sealed class InternetCheckState {}

final class InternetCheckInitial extends InternetCheckState {}

final class ConnectedState extends InternetCheckState {
  final String isConnected;

  ConnectedState({required this.isConnected});
}

final class NotConnectedState extends InternetCheckState {
  final String isConnected;

  NotConnectedState({required this.isConnected});
}
