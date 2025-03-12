class Music {
  final String id;
  final String title;
  final String artist;
  final String album;
  final int duration;

  Music({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      id: json['music_id'],
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      album: json['album'] ?? '',
      duration: json['duration'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'duration': duration,
    };
  }
} 