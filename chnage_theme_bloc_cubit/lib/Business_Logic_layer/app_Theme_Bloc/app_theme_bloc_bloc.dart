import 'package:chnage_theme_bloc_cubit/Business_Logic_layer/app_Theme_Bloc/app_theme_bloc_event.dart';
import 'package:chnage_theme_bloc_cubit/data_layer/helper/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme_bloc_state.dart';

class AppThemeBloc extends Bloc<AppThemeBlocEvent, AppThemeBlocState> {
  AppThemeBloc() : super(AppThemeBlocInitial()) {
    on<AppThemeBlocEvent>((event, emit) {
      if (event is InitialEvent) {
        if (sharedPreferences != null) {
          if (sharedPreferences!.getString('theme') == 'Light') {
            emit(LigthState(appTeme: 'Light'));
          } else if (sharedPreferences!.getString('theme') == 'Dark') {
            emit(DarkState(appTeme: 'Dark'));
          }
        }
      } else if (event is LightEvent) {
        sharedPreferences!.setString('theme', 'Light');
        emit(LigthState(appTeme: 'Light'));
      } else if (event is DarkEvent) {
        sharedPreferences!.setString('theme', 'Dark');
        emit(DarkState(appTeme: 'Dark'));
      }
    });
  }
}
