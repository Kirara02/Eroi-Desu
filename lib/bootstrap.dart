// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDir = await path_provider.getApplicationDocumentsDirectory();
  await dotenv.load(fileName: ".env");
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  runApp(await builder());
}
