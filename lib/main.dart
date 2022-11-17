import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'features/joke_app/presentation/pages/home/page.dart';
import 'injection.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc clean architecture example',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}


