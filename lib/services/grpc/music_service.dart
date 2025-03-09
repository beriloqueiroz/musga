import '../../proto/music.pbgrpc.dart';

abstract class MusicService {
  Future<List<Music>> searchMusic(String query, {int page = 1, int pageSize = 20});
  Stream<AudioChunk> streamMusic(String musicId);
  void dispose();
} 