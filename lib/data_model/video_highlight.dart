class VideoHighlight {
  final String title;
  final String subtitle;
  final String url;
  final String thumbnailUrl;
  final int mediaType;
  final bool doFollow;
  final bool keyHighlight;
  final int id;
  final int createdAtTimestamp;
  final String sourceUrl;

  VideoHighlight({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.thumbnailUrl,
    required this.mediaType,
    required this.doFollow,
    required this.keyHighlight,
    required this.id,
    required this.createdAtTimestamp,
    required this.sourceUrl,
  });

  factory VideoHighlight.fromJson(Map<String, dynamic> json) {
    return VideoHighlight(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      mediaType: json['mediaType'] ?? 0,
      doFollow: json['doFollow'] ?? false,
      keyHighlight: json['keyHighlight'] ?? false,
      id: json['id'] ?? 0,
      createdAtTimestamp: json['createdAtTimestamp'] ?? 0,
      sourceUrl: json['sourceUrl'] ?? '',
    );
  }
}
