// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:game_of_thrones_api/data_layer/cache/cach_helper.dart';
import 'package:game_of_thrones_api/data_layer/core/Api/api_consumer.dart';
import 'package:game_of_thrones_api/data_layer/core/Api/end_point.dart';
import 'package:game_of_thrones_api/data_layer/core/Error/exceptions.dart';
import 'package:game_of_thrones_api/data_layer/core/functions/upload_image_to_api.dart';
import 'package:game_of_thrones_api/data_layer/models/delete_model.dart';
import 'package:game_of_thrones_api/data_layer/models/signin_model.dart';
import 'package:game_of_thrones_api/data_layer/models/singup_model.dart';
import 'package:game_of_thrones_api/data_layer/models/upData_model.dart';
import 'package:game_of_thrones_api/data_layer/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiConsumer api;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  XFile? profilePic;
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  SignInModel? user;
  UserBloc(this.api) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is SignInEvent) {
        await _SignIn(emit);
      } else if (event is SignUPEvent) {
        await _SignUp(emit);
      } else if (event is GetUserProfileEvent) {
        await _getUserProfile(emit);
      } else if (event is UpDataEvent) {
        await _updateUserProfile(emit);
      } else if (event is DeleteEvent) {
        await _DeleteUser(emit);
      } else if (event is LogOutEvent) {
        await _logOut(emit);
      } else if (event is UploadProfilePicEvent) {
        await uploadProFilePic(event.image, emit);
      }
    });
  }

  uploadProFilePic(XFile image, Emitter<UserState> emit) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  _SignIn(Emitter<UserState> emit) async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user?.token ?? '');
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      emit(SignInSucess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.errorMessage));
    }
  }

  _SignUp(Emitter<UserState> emit) async {
    try {
      if (profilePic == null) {
        emit(SignUpFailure(errMessage: 'Profile picture is required.'));
        return;
      }
      // emit(SignUpLoading());
      final response = await api.post(
        EndPoint.signUp,
        isFromData: true,
        data: {
          ApiKey.name: signUpName.text,
          ApiKey.email: signUpEmail.text,
          ApiKey.phone: signUpPhoneNumber.text,
          ApiKey.password: signUpPassword.text,
          ApiKey.confirmPassword: confirmPassword.text,
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
          ApiKey.profilePic: await uploadImageToAPI(profilePic!),
        },
      );
      final signUpModel = SignUpModel.fromJson(response);
      emit(SignUpSuccess(message: signUpModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }

  _getUserProfile(Emitter<UserState> emit) async {
    try {
      emit(UserLoding());
      final response = await api.get(
        EndPoint.getUserDataEndPoint(CacheHelper().getData(key: ApiKey.id)),
      );
      emit(GetUserSuccess(
        user: UserModel.fromJson(response),
      ));
    } on ServerException catch (e) {
      emit(Userfailer(errMessage: e.errModel.errorMessage));
    }
  }

  _updateUserProfile(Emitter<UserState> emit) async {
    try {
      if (profilePic == null) {
        emit(SignUpFailure(errMessage: 'Profile picture is required.'));
        return;
      }
      emit(UpDateLoading());
      final response =
          await api.patch(EndPoint.update, isFromData: true, data: {
        ApiKey.name: signUpName.text,
        ApiKey.phone: signUpPhoneNumber.text,
        ApiKey.location:
            '{"name":"cairo","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        ApiKey.profilePic: await uploadImageToAPI(profilePic!),
      });
      final updateModel = UpdateModel.fromJson(response);
      emit(UpDateSuccess(message: updateModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }

  _logOut(Emitter<UserState> emit) async {
    try {
      emit(UserlogoutLoding());
      final response = await api.get(
        EndPoint.logout,
      );
      emit(UserlogoutSuccess());
    } on ServerException catch (e) {
      emit(UserlogoutFailre(errMessage: e.errModel.errorMessage));
    }
  }

  _DeleteUser(Emitter<UserState> emit) async {
    try {
      emit(DeleteUserLoding());
      final userId = CacheHelper().getData(key: ApiKey.id);
      if (userId == null) {
        throw Exception('User ID not found');
      }

      print('User ID: $userId');

      final response = await api.delete(
        EndPoint.DeleteUserEndPoint(userId),
        queryParameters: {
          'id': '${userId.toString()}',
        },
        data: {},
        isFromData: true,
      );

      print('Response: ${response.toString()}');

      emit(DeleteUserSuccess(deldetModel: DeldetModel.fromJson(response)));
    } on ServerException catch (e) {
      emit(DeleteUserfailer(errMessage: e.errModel.errorMessage));
      print('ServerException: ${e.errModel.errorMessage}');
    } catch (e) {
      emit(DeleteUserfailer(errMessage: e.toString()));
      print('Exception: ${e.toString()}');
    }
  }
}
