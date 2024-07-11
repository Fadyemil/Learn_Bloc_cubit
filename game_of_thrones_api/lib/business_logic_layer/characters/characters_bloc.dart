import 'package:bloc/bloc.dart';
import 'package:game_of_thrones_api/data_layer/core/Api/api_consumer.dart';
import 'package:game_of_thrones_api/data_layer/core/Api/end_point.dart';
import 'package:game_of_thrones_api/data_layer/core/Error/exceptions.dart';
import 'package:game_of_thrones_api/data_layer/models/characters_model.dart';
import 'package:meta/meta.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final ApiConsumer api;
  late List<CharactersModel> charactersModels = [];

  CharactersBloc({required this.api}) : super(CharactersInitial()) {
    on<CharactersEvent>(
      (event, emit) async {
        if (event is GetCharactersEvent) {
          await _fetchCharacters(emit);
        }
      },
    );
  }
  Future<List<CharactersModel>> _fetchCharacters(
      Emitter<CharactersState> emit) async {
    try {
      emit(CharactersLoding());
      List<dynamic> response = await api.get(EndPoint.characters);
      for (var i = 0; i < response.length; i++) {
        charactersModels
            .add(CharactersModel.fromJson(response[i] as Map<String, dynamic>));
      }
      emit(CharactersSuccess(characters: charactersModels));
      return charactersModels;
    } on ServerException catch (e) {
      emit(CharactersFailer(errMessage: e.errModel.errorMessage));
      return [];
    } catch (e) {
      emit(CharactersFailer(errMessage: e.toString()));
      return [];
    }
  }
}
