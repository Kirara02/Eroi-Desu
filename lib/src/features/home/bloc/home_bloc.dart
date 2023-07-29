import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eroi_desu/src/data/models/comic_model.dart';
import 'package:eroi_desu/src/data/repository/comic_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int page = 1;
  int limit = 6;
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetComicsEvent) {
        try {
          emit(HomeLoading());
          final result = await ComicRepository.getComics(
            page: page,
            limit: limit,
          );

          bool isNext = result.length == limit;
          emit(HomeSucces(datas: result, isNext: isNext));
        } catch (e) {
          emit(HomeFailed(e.toString()));
        }
      }
      if (event is GetNextComicEvent) {}
    });
  }
}
