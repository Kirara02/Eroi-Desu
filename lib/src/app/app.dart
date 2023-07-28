import 'package:eroi_desu/src/features/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eroi Desu',
      theme: ThemeData(
        useMaterial3: true,
        textTheme:
            GoogleFonts.interTextTheme(Theme.of(context).primaryTextTheme),
      ),
      home: const SplashPage(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
