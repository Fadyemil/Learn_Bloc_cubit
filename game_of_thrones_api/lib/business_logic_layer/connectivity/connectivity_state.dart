part of 'connectivity_bloc.dart';

@immutable
sealed class ConnectivityState {}

final class ConnectivityInitial extends ConnectivityState {}

final class IntertetConnected extends ConnectivityState {
  final String? internetMessage;

  IntertetConnected({this.internetMessage});
}

final class NotInternetConnected extends ConnectivityState {
  final String? internetMessage;

  NotInternetConnected({this.internetMessage});
}
