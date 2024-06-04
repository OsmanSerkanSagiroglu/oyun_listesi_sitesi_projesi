class Game {
  final String title;
  final String year;
  final String platform;
  final String genre;
  final String description;
  final String metacriticUrl;
  final String imageUrl;

  Game({
    required this.title,
    required this.year,
    required this.platform,
    required this.genre,
    required this.description,
    required this.metacriticUrl,
    required this.imageUrl,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      title: json['title'],
      year: json['year'],
      platform: json['platform'],
      genre: json['genre'],
      description: json['description'],
      metacriticUrl: json['metacriticUrl'],
      imageUrl: json['imageUrl'],
    );
  }
}