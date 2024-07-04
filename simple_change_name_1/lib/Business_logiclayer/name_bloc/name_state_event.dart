part of 'name_state_bloc.dart';

@immutable
sealed class NameStateEvent {}

class NameFullEvent extends NameStateEvent {}

class InitialEvent extends NameStateEvent {}

class NameResetEvent extends NameStateEvent {}

class NameClearEvent extends NameStateEvent {}
