part of 'comic_bloc.dart';

abstract class ComicEvent extends Equatable {
  const ComicEvent();

  @override
  List<Object> get props => [];
}

class GetComicPageEvent extends ComicEvent {}

class GetNextComicPageEvent extends ComicEvent {}
