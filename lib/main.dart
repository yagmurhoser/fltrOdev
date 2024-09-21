import 'package:bitirmeprojesi/screens/fourth_screen.dart';
import 'package:bitirmeprojesi/screens/home_screen.dart';
import 'package:bitirmeprojesi/screens/second_screen.dart';
import 'package:bitirmeprojesi/screens/oyun_screen.dart';
import 'package:bitirmeprojesi/screens/sorucevap_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Başlangıç rotası
      routes: {
        '/': (context) => const HomeScreen(), // Ana sayfa
        '/second': (context) =>
            const SecondScreen(), // İkinci sayfa (Kompost Nedir)
        '/game': (context) => const MatchingGame(), // Oyun sayfası
        '/gubre': (context) => CompostApp(),
        '/soru': (context) => SoruCevap(),
      },
    );
  }
}
