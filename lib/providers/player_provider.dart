import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/player/audio_player_service.dart';
import '../services/grpc/music_service_factory.dart';

final playerProvider = Provider((ref) {
  final musicService = MusicServiceFactory.create();
  return AudioPlayerService(musicService);
}); 