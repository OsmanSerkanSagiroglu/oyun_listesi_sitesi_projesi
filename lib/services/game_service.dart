import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/game.dart';

Future<List<Game>> fetchGames() async {
  final String response = await rootBundle.loadString('games.json');
  List<dynamic> gameData = json.decode(response);
  return gameData.map((data) => Game.fromJson(data)).toList();
}