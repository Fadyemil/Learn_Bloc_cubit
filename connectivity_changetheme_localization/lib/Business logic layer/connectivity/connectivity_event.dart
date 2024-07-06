part of 'connectivity_bloc.dart';

@immutable
sealed class ConnectivityEvent {}

class ConnectedEvent extends ConnectivityEvent {}

class NotConnectedEvent extends ConnectivityEvent {}
