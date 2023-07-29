import 'package:cached_network_image/cached_network_image.dart';
import 'package:eroi_desu/src/config/constant.dart';
import 'package:eroi_desu/src/config/theme/colors.dart';
import 'package:eroi_desu/src/features/comic_chapter/bloc/comic_chapter_bloc.dart';
import 'package:eroi_desu/src/features/comic_detail/bloc/comic_detail_bloc.dart';
import 'package:eroi_desu/src/features/home/bloc/home_bloc.dart';
import 'package:eroi_desu/src/features/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../features/list_comic/bloc/comic_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => ComicBloc(),
        ),
        BlocProvider(
          create: (context) => ComicDetailBloc(),
        ),BlocProvider(
          create: (context) => ComicChapterBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eroi Desu',
        theme: ThemeData(
          useMaterial3: true,
          textTheme:
              GoogleFonts.interTextTheme(Theme.of(context).primaryTextTheme),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: UIColors.white,
              fontWeight: FontWeight.w500,
              fontSize: AppConstants.kFontSizeL,
            ),
            centerTitle: true,
            backgroundColor: AppColors.primary,
            actionsIconTheme: IconThemeData(
              color: UIColors.white,
            ),
            iconTheme: IconThemeData(
              color: UIColors.white,
            ),
          ),
          scaffoldBackgroundColor: AppColors.primary,
        ),
        home: const SplashPage(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
