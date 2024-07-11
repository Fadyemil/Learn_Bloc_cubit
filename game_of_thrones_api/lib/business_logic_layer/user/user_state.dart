part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class SignInLoading extends UserState {}

final class SignInSucess extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class UploadProfilePic extends UserState {}

final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class UserLoding extends UserState {}

final class Userfailer extends UserState {
  final String errMessage;

  Userfailer({required this.errMessage});
}

final class GetUserSuccess extends UserState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class UpDateLoading extends UserState {}

final class UpDateFailure extends UserState {
  final String errMessage;

  UpDateFailure({required this.errMessage});
}

final class UpDateSuccess extends UserState {
  final String message;

  UpDateSuccess({required this.message});
}

final class UserlogoutFailre extends UserState {
  final String errMessage;

  UserlogoutFailre({required this.errMessage});
}

final class UserlogoutLoding extends UserState {}

final class UserlogoutSuccess extends UserState {}
final class DeleteUserLoding extends UserState {}

final class DeleteUserfailer extends UserState {
  final String errMessage;

  DeleteUserfailer({required this.errMessage});
}

final class DeleteUserSuccess extends UserState {
  final DeldetModel deldetModel;

  DeleteUserSuccess({required this.deldetModel});
}