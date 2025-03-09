import 'package:grpc/grpc.dart';
import '../../proto/music.pbgrpc.dart';
import 'music_service.dart';
import '../../config/api_config.dart';

class MobileMusicService implements MusicService {
  late MusicServiceClient stub;
  
  MobileMusicService() {
    final channel = ClientChannel(
      ApiConfig.serverIP,
      port: ApiConfig.grpcPort,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    stub = MusicServiceClient(channel);
  }

  @override
  Future<List<Music>> searchMusic(String query, {int page = 1, int pageSize = 20}) async {
    final request = SearchRequest()
      ..query = query
      ..page = page - 1
      ..pageSize = pageSize;
    final response = await stub.searchMusic(request);
    return response.musicList;
  }

  @override
  Stream<AudioChunk> streamMusic(String musicId) {
    final request = StreamRequest()..musicId = musicId;
    return stub.streamMusic(request);
  }

  @override
  void dispose() {
    // Cleanup if needed
  }
} 