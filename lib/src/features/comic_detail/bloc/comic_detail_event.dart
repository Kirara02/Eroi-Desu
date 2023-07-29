part of 'comic_detail_bloc.dart';

abstract class ComicDetailEvent extends Equatable {
  const ComicDetailEvent();

  @override
  List<Object> get props => [];
}

class GetComicChapterEvent extends ComicDetailEvent {
  final int id;
  const GetComicChapterEvent(this.id);

  @override
  List<Object> get props => [id];
}
