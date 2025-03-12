import 'package:grpc/grpc.dart';
import '../../proto/music.pbgrpc.dart';
import '../../utils/logger.dart';
import 'base_music_service.dart';

class NativeMusicService implements BaseMusicService {
  late MusicServiceClient stub;
  
  NativeMusicService() {
    log.i('Iniciando serviço gRPC nativo...');
    try {
      final channel = ClientChannel(
        '192.168.5.150',  // Seu IP local
        port: 50051,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      );
      stub = MusicServiceClient(channel);
      log.i('Cliente gRPC nativo criado com sucesso');
    } catch (e) {
      log.e('Erro ao criar cliente gRPC nativo', error: e);
    }
  }

  @override
  Future<List<Music>> searchMusic(String query, {int page = 1, int pageSize = 20}) async {
    log.i('Native: Iniciando busca: query=$query, page=$page');
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
} 