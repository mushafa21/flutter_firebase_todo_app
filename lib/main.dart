import 'package:base_todolist/config/locator.dart';
import 'package:base_todolist/config/shared_preference.dart';
import 'package:base_todolist/ui/theme.dart';
import 'package:base_todolist/view/home_page.dart';
import 'package:base_todolist/view/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:base_todolist/view/login_page.dart';

import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CacheStore cacheStore = locator.get();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: cacheStore.getFirst() ? OnboardingPage() : cacheStore.getLogin() ? HomePage() : LoginPage(),
    );
  }
}