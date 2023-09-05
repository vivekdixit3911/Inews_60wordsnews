import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inews/firebase/token&cloud.dart';
import 'package:inews/firebase_options.dart';

import 'package:inews/pages/slideleftpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tokenstore();
    return MaterialApp(home: slideright());
  }
}
