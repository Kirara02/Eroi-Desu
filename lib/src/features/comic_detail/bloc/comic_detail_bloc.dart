import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eroi_desu/src/data/models/chapter_model.dart';
import 'package:eroi_desu/src/data/repository/comic_repository.dart';

part 'comic_detail_event.dart';
part 'comic_detail_state.dart';

class ComicDetailBloc extends Bloc<ComicDetailEvent, ComicDetailState> {
  ComicDetailBloc() : super(ComicDetailInitial()) {
    on<ComicDetailEvent>((event, emit) async {
      if (event is GetComicChapterEvent) {
        try {
          emit(ComicDetailLoading());
          final result = await ComicRepository.getChapters(id: event.id);
          emit(ComicDetailSuccess(result));
        } catch (e) {
          emit(ComicDetailFailed(e.toString()));
        }
      }
    });
  }
}
