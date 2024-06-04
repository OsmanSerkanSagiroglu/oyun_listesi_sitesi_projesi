import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import 'game_details.dart';

class GameListPage extends StatefulWidget {
  const GameListPage({Key? key}) : super(key: key);

  @override
  GameListPageState createState() => GameListPageState();
}

class GameListPageState extends State<GameListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<GameProvider>(context, listen: false).loadGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game List'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const NetworkImage('https://media.istockphoto.com/id/1858114279/photo/gaming-entertainment-console-controller-video-game-activity.webp?b=1&s=170667a&w=0&k=20&c=nO2ruzZhq5u48GvPcl26McCQgPgNJmOpKFwTPUrD_nc='),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Consumer<GameProvider>(
          builder: (context, gameProvider, child) {
            if (gameProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (gameProvider.games.isEmpty) {
              return const Center(child: Text('Games can t find'));
            } else {
              return ListView.builder(
                itemCount: gameProvider.games.length,
                itemBuilder: (context, index) {
                  final game = gameProvider.games[index];
                  return ListTile(
                    tileColor: Colors.transparent,
                    leading: Hero(
                      tag: game.title,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(game.imageUrl),
                        child: Text(game.title[0]),
                      ),
                    ),
                    title: Text(
                      game.title,
                      style: const TextStyle(
                        color: Colors.white, // Metin rengini beyaz olarak ayarla
                      ),
                    ),
                    subtitle: Text(
                      '${game.year} - ${game.genre}',
                      style: const TextStyle(
                        color: Colors.white, // Metin rengini beyaz olarak ayarla
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameDetailsPage(game: game),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}