import 'package:bloc/bloc.dart';
import 'package:connectivity_changetheme_localization/data%20layer/helper/contanst.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) {
      if (event is InitialLanguageEvent) {
        if (sharedPreferences!.getString('lang') != null) {
          if (sharedPreferences!.getString('lang') == 'ar') {
            emit(AppChangeLanguage(languageCode: 'ar'));
          } else {
            emit(AppChangeLanguage(languageCode: 'en'));
          }
        }
      } else if (event is ArabicLanguageEvent) {
        sharedPreferences!.setString('lang', 'ar');
        emit(AppChangeLanguage(languageCode: 'ar'));
      } else if (event is EnglishLanguageEvent) {
        sharedPreferences!.setString('lang', 'en');
        emit(AppChangeLanguage(languageCode: 'en'));
      }
    });
  }
}
