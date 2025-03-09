import '../../proto/music.pbgrpc.dart';

abstract class BaseMusicService {
  Future<List<Music>> searchMusic(String query, {int page = 1, int pageSize = 20});
  Stream<AudioChunk> streamMusic(String musicId);
} 