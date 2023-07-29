part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucces extends HomeState {
  final List<ComicModel> datas;
  final int page;
  final int limit;
  final bool isNext;

  const HomeSucces({
    required this.datas,
    this.page = 1,
    this.limit = 25,
    this.isNext = false,
  });

  HomeSucces copyWith({
    List<ComicModel>? datas,
    int? page,
    int? limit,
    bool? isNext,
  }) {
    return HomeSucces(
      datas: datas ?? this.datas,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      isNext: isNext ?? this.isNext,
    );
  }

  @override
  List<Object> get props => [page, limit, isNext];
}

class HomeFailed extends HomeState {
  final String e;
  const HomeFailed(this.e);

  @override
  List<Object> get props => [e];
}
