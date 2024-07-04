part of 'inter_net_cubit_cubit.dart';

@immutable
sealed class InterNetCubitState {}

final class InterNetCubitInitial extends InterNetCubitState {}

final class ConnectedStateCubit extends InterNetCubitState {
  final String internetState;

  ConnectedStateCubit({required this.internetState});
}

final class NotConnectedStateCubit extends InterNetCubitState {
  final String internetState;

  NotConnectedStateCubit({required this.internetState});
}
