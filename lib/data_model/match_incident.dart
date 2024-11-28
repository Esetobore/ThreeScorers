class MatchIncident {
  final String? playerName;
  final int? time;
  final String incidentType;
  final String? description;
  final bool isHome;

  MatchIncident({
    this.playerName,
    this.time,
    required this.incidentType,
    this.description,
    this.isHome = false,
  });

  factory MatchIncident.fromJson(Map<String, dynamic> json) {
    if (json['incidentType'] == 'period') {
      return MatchIncident(
        incidentType: json['text'] ?? '',
        time: json['time'],
      );
    }

    if (json['incidentType'] == 'substitution') {
      return MatchIncident(
        incidentType: 'substitution',
        playerName: json['playerIn']['name'],
        time: json['time'],
        isHome: json['isHome'] ?? false,
      );
    }

    if (json['incidentType'] == 'card') {
      return MatchIncident(
        incidentType: 'card',
        playerName: json['player']['name'],
        time: json['time'],
        description: json['incidentClass'],
        isHome: json['isHome'] ?? false,
      );
    }

    return MatchIncident(
      incidentType: json['incidentType'] ?? '',
      playerName: json.containsKey('player') ? json['player']['name'] : null,
      time: json['time'],
      description: json['description'],
      isHome: json['isHome'] ?? false,
    );
  }
}
