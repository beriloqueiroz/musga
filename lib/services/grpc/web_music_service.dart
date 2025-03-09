import 'package:grpc/grpc_web.dart';
import '../../proto/music.pbgrpc.dart';
import '../../utils/logger.dart';
import 'base_music_service.dart';
import 'music_service.dart';

class WebMusicService implements BaseMusicService, MusicService {
  late MusicServiceClient stub;
  
  WebMusicService() {
    log.i('Iniciando serviço gRPC-Web...');
    try {
      final channel = GrpcWebClientChannel.xhr(
        Uri.parse('http://localhost:50051'),
      );
      stub = MusicServiceClient(channel);
      log.i('Cliente gRPC-Web criado com sucesso');
    } catch (e) {
      log.e('Erro ao criar cliente gRPC-Web', error: e);
    }
  }

  @override
  Future<List<Music>> searchMusic(String query, {int page = 1, int pageSize = 20}) async {
    log.i('Web: Iniciando busca: query=$query, page=$page');
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
    // Limpeza de recursos web se necessário
  }
} 