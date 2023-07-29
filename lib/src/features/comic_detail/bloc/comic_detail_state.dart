part of 'comic_detail_bloc.dart';

abstract class ComicDetailState extends Equatable {
  const ComicDetailState();

  @override
  List<Object> get props => [];
}

class ComicDetailInitial extends ComicDetailState {}

class ComicDetailLoading extends ComicDetailState {}

class ComicDetailSuccess extends ComicDetailState {
  final List<ChapterModel> datas;
  const ComicDetailSuccess(this.datas);

  @override
  List<Object> get props => [datas];
}

class ComicDetailFailed extends ComicDetailState {
  final String e;
  const ComicDetailFailed(this.e);

  @override
  List<Object> get props => [e];
}
