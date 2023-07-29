import 'package:eroi_desu/src/features/home/bloc/home_bloc.dart';
import 'package:eroi_desu/src/features/home/widget/header_home.dart';
import 'package:eroi_desu/src/features/home/widget/most_popular_home.dart';
import 'package:eroi_desu/src/features/home/widget/new_release_home.dart';
import 'package:eroi_desu/src/features/home/widget/update_manga_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetComicsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 50,
          right: 20,
          left: 20,
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              HeaderHome(),
              NewReleaseHome(),
              MostPopularHome(),
              UpdateMangaHome(),
            ],
          ),
        ),
      ),
    );
  }
}
