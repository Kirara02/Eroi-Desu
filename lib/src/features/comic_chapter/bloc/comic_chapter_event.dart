part of 'comic_chapter_bloc.dart';

abstract class ComicChapterEvent extends Equatable {
  const ComicChapterEvent();

  @override
  List<Object> get props => [];
}

class GetImageChapterEvent extends ComicChapterEvent {
  final int id;

  const GetImageChapterEvent(this.id);

  @override
  List<Object> get props => [id];
}
