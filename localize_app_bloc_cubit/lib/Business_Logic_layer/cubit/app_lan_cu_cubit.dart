import 'package:bloc/bloc.dart';
import 'package:localize_app_bloc_cubit/data_Layer/Enums/languageEnums.dart';
import 'package:localize_app_bloc_cubit/data_Layer/helper/const.dart';
import 'package:meta/meta.dart';

part 'app_lan_cu_state.dart';

class AppLanCuCubit extends Cubit<AppLanCuState> {
  AppLanCuCubit() : super(AppLanCuInitial());
  appLanguageFunc(Languageenums eventType) {
    switch (eventType) {
      case Languageenums.Initial:
        if (sharedPreferences!.getString('lang') != null) {
          if (sharedPreferences!.getString('lang') == 'ar') {
            emit(AppChangeLangCu(languageCode: 'ar'));
          } else {
            emit(AppChangeLangCu(languageCode: 'en'));
          }
        }

        break;
      case Languageenums.english:
        sharedPreferences!.setString('lang', 'en');
        emit(AppChangeLangCu(languageCode: 'en'));
        break;
      case Languageenums.arabic:
        sharedPreferences!.setString('lang', 'ar');
        emit(AppChangeLangCu(languageCode: 'ar'));
        break;
      default:
    }
  }
}
