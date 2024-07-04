part of 'internet_check_bloc.dart';

@immutable
sealed class InternetCheckEvent {}

class ConnectedEvent extends InternetCheckEvent {}

class notConnectedEvent extends InternetCheckEvent {}
