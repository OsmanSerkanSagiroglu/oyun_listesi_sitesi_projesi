import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../models/game.dart';

class GameProvider with ChangeNotifier {
  List<Game> _games = [];
  bool _isLoading = false;

  List<Game> get games => _games;
  bool get isLoading => _isLoading;

  Future<void> loadGames() async {
    _isLoading = true;

    try {
      final String response = await rootBundle.loadString('assets/games.json');
      final List<dynamic> data = json.decode(response);
      _games = data.map((gameData) => Game.fromJson(gameData)).toList();
    } catch (error) {
      if (kDebugMode) {
        print("Failed to load games: $error");
      }
    }
    _isLoading = false;
    notifyListeners(); // Yalnızca veriler yüklendikten sonra çağrılacak
  }
}
