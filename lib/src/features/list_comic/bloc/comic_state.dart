part of 'comic_bloc.dart';

abstract class ComicState extends Equatable {
  const ComicState();

  @override
  List<Object> get props => [];
}

class ComicInitial extends ComicState {}

class ComicLoading extends ComicState {}

class ComicSuccess extends ComicState {
  final List<ComicModel> datas;
  final int page;
  final int limit;
  final bool isNext;

  const ComicSuccess({
    required this.datas,
    this.page = 1,
    this.limit = 25,
    this.isNext = false,
  });

  ComicSuccess copyWith({
    List<ComicModel>? datas,
    int? page,
    int? limit,
    bool? isNext,
  }) {
    return ComicSuccess(
      datas: datas ?? this.datas,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      isNext: isNext ?? this.isNext,
    );
  }

  @override
  List<Object> get props => [page, limit, isNext];
}

class ComicFailed extends ComicState {
  final String e;
  const ComicFailed(this.e);

  @override
  List<Object> get props => [e];
}
