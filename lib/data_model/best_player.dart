class BestPlayer {
  final String name;
  final String shortName;
  final String position;
  final String jerseyNumber;
  final double rating;
  final String imageUrl;

  BestPlayer({
    required this.name,
    required this.shortName,
    required this.position,
    required this.jerseyNumber,
    required this.rating,
    this.imageUrl = '',
  });

  factory BestPlayer.fromJson(Map<String, dynamic> json) {
    // Handling the nested JSON structure
    final homePlayer = json['data']['bestHomeTeamPlayer'];
    final player = homePlayer['player'];

    return BestPlayer(
      name: player['name'] ?? '',
      shortName: player['shortName'] ?? '',
      position: player['position'] ?? '',
      jerseyNumber: player['jerseyNumber'] ?? '',
      rating: double.tryParse(homePlayer['value'] ?? '0.0') ?? 0.0,
    );
  }
}
