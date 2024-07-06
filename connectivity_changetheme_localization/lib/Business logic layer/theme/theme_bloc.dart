import 'package:bloc/bloc.dart';
import 'package:connectivity_changetheme_localization/data%20layer/helper/contanst.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) {
      if (event is InitialThemeEvent) {
        if (sharedPreferences!.getString('theme') != null) {
          if (sharedPreferences!.getString('theme') == 'l') {
            emit(AppChangeTeme(appThmem: 'l'));
          } else {
            emit(AppChangeTeme(appThmem: 'd'));
          }
        }
      } else if (event is LightThemeEvent) {
        sharedPreferences!.setString('theme', 'l');
        emit(AppChangeTeme(appThmem: 'l'));
      } else if (event is DarkThemeEvent) {
        sharedPreferences!.setString('theme', 'd');
        emit(AppChangeTeme(appThmem: 'd'));
      }
    });
  }
}
