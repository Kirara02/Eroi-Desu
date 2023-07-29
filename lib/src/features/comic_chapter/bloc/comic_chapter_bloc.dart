import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eroi_desu/src/data/models/image_model.dart';
import 'package:eroi_desu/src/data/repository/comic_repository.dart';

part 'comic_chapter_event.dart';
part 'comic_chapter_state.dart';

class ComicChapterBloc extends Bloc<ComicChapterEvent, ComicChapterState> {
  ComicChapterBloc() : super(ComicChapterInitial()) {
    on<ComicChapterEvent>((event, emit) async {
      if (event is GetImageChapterEvent) {
        try {
          emit(ComicChapterLoading());
          final result = await ComicRepository.getImages(id: event.id);
          emit(ComicChapterSuccess(result));
        } catch (e) {
          emit(ComicChapterFailed(e.toString()));
        }
      }
    });
  }
}
