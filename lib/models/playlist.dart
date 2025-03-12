
import 'package:musga/models/music.dart';

class Playlist {
  final String id;
  final String name;
  List<Music> musics = [];

  Playlist({required this.id, required this.name, this.musics = const []});

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'],
      name: json['name'],
      musics: json['musics'].isNotEmpty ? json['musics'].map((e) => Music.fromJson(e)).toList() : [],
    );
  }

Map<String, dynamic> toJson() {
  return {
      'id': id,
      'name': name,
      'musics': musics.isNotEmpty ? musics.map((e) => e.toJson()).toList() : [],
    };
  }
}
