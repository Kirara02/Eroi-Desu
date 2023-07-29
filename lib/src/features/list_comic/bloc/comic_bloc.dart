import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/comic_model.dart';
import '../../../data/repository/comic_repository.dart';
import '../../../data/services/comic_service.dart';

part 'comic_event.dart';
part 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  int page = 1;
  int limit = 15;

  ComicBloc() : super(ComicInitial()) {
    on<ComicEvent>((event, emit) async {
      if (event is GetComicPageEvent) {
        try {
          emit(ComicLoading());
          final result = await ComicRepository.getComics(
            page: page,
            limit: limit,
          );

          bool isNext = result.length == limit;
          emit(ComicSuccess(datas: result, isNext: isNext));
        } catch (e) {
          emit(ComicFailed(e.toString()));
        }
      }
      if (event is GetNextComicPageEvent) {
        try {
          final currentState = state as ComicSuccess;
          final nextPage = currentState.page + 1;

          final result =
              await ComicService.fetchComics(page: nextPage, limit: limit);

          bool isNext = result.length == limit;

          emit(
            ComicSuccess(
              datas: [...currentState.datas, ...result],
              page: nextPage,
              isNext: isNext,
            ),
          );
        } catch (e) {
          emit(ComicFailed(e.toString()));
        }
      }
    });
  }
}
