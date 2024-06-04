import 'package:flutter/material.dart';
import 'package:oyun_listesi/providers/game_provider.dart';
import 'package:provider/provider.dart';
import 'screens/game_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()), // GameProvider ChangeNotifier'dan türemiş olmalı
      ],
      child: MaterialApp(
        title: 'Game List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GameListPage(),
      ),
    );
  }
}
