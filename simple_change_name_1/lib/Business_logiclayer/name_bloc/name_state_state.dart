part of 'name_state_bloc.dart';

@immutable
sealed class NameStateState {}

final class NameStateInitial extends NameStateState {}

final class NameStateLoding extends NameStateState {
  final String? name;

  NameStateLoding({ this.name});
}

final class NameStateSucces extends NameStateState {
  final String? name;

  NameStateSucces({ this.name});
}

final class NameStateFailer extends NameStateState {
  final String? name;

  NameStateFailer({ this.name});
}
