part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class SignInEvent extends UserEvent {}

class SignUPEvent extends UserEvent {}

class GetUserProfileEvent extends UserEvent {}

class UpDataEvent extends UserEvent {}
class DeleteEvent extends UserEvent {}
class LogOutEvent extends UserEvent {}
class UploadProfilePicEvent extends UserEvent {
  final XFile image;

  UploadProfilePicEvent(this.image);
}
