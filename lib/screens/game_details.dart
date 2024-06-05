import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/game.dart';

class GameDetailsPage extends StatelessWidget {
  final Game game;

  const GameDetailsPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(game.title),
          backgroundColor: Colors.white, // App bar'ın arka planı saydam olsun
          elevation: 0, // Gölge efekti kaldırılsın
        ),
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage('https://www.shutterstock.com/image-vector/arcade-game-screen-copy-space-600nw-2203448809.jpg'),
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                fit: BoxFit.cover, // Apply semi-transparent overlay
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: game.title,
                    child: Image.network(game.imageUrl),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    game.title,
                    style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white), // Removed 'const'
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '${game.year} - ${game.platform}',
                    style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic, color: Colors.white), // Removed 'const'
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'genre: ${game.genre}',
                    style: const TextStyle(fontSize: 16.0, color: Colors.white), // Removed 'const'
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    game.description,
                    style: const TextStyle(fontSize: 16.0, color: Colors.white), // Removed 'const'
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      final url = Uri.parse(game.metacriticUrl);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch Metacritic URL: $url'; // Provide a more informative error message
                      }
                    },
                    child: const Text('View on Metacritic'),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}