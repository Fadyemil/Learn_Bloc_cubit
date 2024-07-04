import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'name_state_event.dart';
part 'name_state_state.dart';

class NameStateBloc extends Bloc<NameStateEvent, NameStateState> {
  String name = '';
  NameStateBloc() : super(NameStateInitial()) {
    on<NameStateEvent>((event, emit) {
      if (event is InitialEvent) {
        emit(NameStateLoding(name: name));
        name = '';
        emit(NameStateSucces(name: name));
      } else if (event is NameFullEvent) {
        emit(NameStateLoding(name: name));
        name = 'fady emil';
        emit(NameStateSucces(name: name));
      } else if (event is NameResetEvent) {
        emit(NameStateLoding(name: name));
        name = 'fady';
        emit(NameStateSucces(name: name));
      } else if (event is NameClearEvent) {
        emit(NameStateLoding(name: name));
        name = '';
        emit(NameStateSucces(name: name));
      }
    });
  }
}
