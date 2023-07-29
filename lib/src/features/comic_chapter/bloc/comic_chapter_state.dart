part of 'comic_chapter_bloc.dart';

abstract class ComicChapterState extends Equatable {
  const ComicChapterState();

  @override
  List<Object> get props => [];
}

class ComicChapterInitial extends ComicChapterState {}

class ComicChapterLoading extends ComicChapterState {}

class ComicChapterSuccess extends ComicChapterState {
  final List<ImageModel> datas;

  const ComicChapterSuccess(this.datas);

  @override
  List<Object> get props => [datas];
}

class ComicChapterFailed extends ComicChapterState {
  final String e;
  const ComicChapterFailed(this.e);

  @override
  List<Object> get props => [e];
}
