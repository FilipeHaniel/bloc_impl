import 'package:bloc_impl/app/app_page.dart';
import 'package:bloc_impl/app/core/injection/injection.dart';
import 'package:bloc_impl/app/features/cubit_radio_toggle/presentation/page/radio_toggle_page.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '',
      routes: {
        '': (context) => const AppPage(),
        '/radio_toggle': (context) => const RadioTogglePage(),
      },
    );
  }
}
