class GameInformationModel {
  final String tournament;
  final String round;
  final String venue;
  final String city;
  final String country;
  final String referee;
  final String homeTeam;
  final String status;
  final int stadiumCapacity;

  GameInformationModel({
    required this.tournament,
    required this.round,
    required this.venue,
    required this.city,
    required this.country,
    required this.referee,
    required this.homeTeam,
    required this.status,
    required this.stadiumCapacity,
  });

  factory GameInformationModel.fromJson(Map<String, dynamic> json) {
    return GameInformationModel(
      tournament: json['data']['event']['tournament']['name'],
      round: json['data']['event']['roundInfo']['name'],
      venue: json['data']['event']['venue']['name'],
      city: json['data']['event']['venue']['city']['name'],
      country: json['data']['event']['venue']['country']['name'],
      referee: json['data']['event']['referee']['name'],
      homeTeam: json['data']['event']['homeTeam']['name'],
      status: json['data']['event']['status']['description'],
      stadiumCapacity: json['data']['event']['venue']['capacity'],
    );
  }
}
