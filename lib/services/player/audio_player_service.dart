import 'package:just_audio/just_audio.dart';
import '../../utils/logger.dart';
import '../grpc/music_service.dart';
import 'grpc_audio_source.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();
  final MusicService _musicService;
  String? _currentMusicId;
  
  // Streams para controle do estado
  Stream<Duration> get position => _player.positionStream;
  Stream<Duration?> get duration => _player.durationStream;
  Stream<PlayerState> get playerState => _player.playerStateStream;
  Stream<double> get volume => _player.volumeStream;
  
  // Combinação de streams para informações de progresso
  Stream<PlayerProgress> get progress => Rx.combineLatest2<Duration, Duration?, PlayerProgress>(
    position,
    duration,
    (position, duration) => PlayerProgress(
      position: position,
      duration: duration ?? Duration.zero,
    ),
  );

  AudioPlayerService(this._musicService) {
    _setupPlayerCallbacks();
  }

  void _setupPlayerCallbacks() {
    _player.playerStateStream.listen((state) {
      log.d('Estado do player alterado: $state');
    });

    _player.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        log.d('Reprodução completada');
        // TODO: Implementar lógica de próxima música se necessário
      }
    });
  }

  Future<void> playMusic(String musicId) async {
    try {
      log.d('Iniciando reprodução da música: $musicId');

      if (_currentMusicId == musicId && _player.playing) {
        log.d('Música já está tocando');
        return;
      }

      _currentMusicId = musicId;
      final stream = _musicService.streamMusic(musicId);
      log.d('Stream obtido do serviço gRPC');

      final audioSource = GrpcAudioSource(stream);
      log.d('AudioSource criado');

      final source = await audioSource.getAudioSource();
      log.d('Arquivo de áudio pronto');

      await _player.setAudioSource(source);
      log.d('Reprodução iniciada');

      await _player.play();
    } catch (e, stack) {
      log.e('Erro ao reproduzir música', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  Future<void> setVolume(double volume) async {
    await _player.setVolume(volume);
  }

  bool get isPlaying => _player.playing;
  String? get currentMusicId => _currentMusicId;

  void pause() {
    if (_player.playing) {
      _player.pause();
      log.d('Player pausado');
    }
  }

  void resume() {
    if (!_player.playing) {
      _player.play();
      log.d('Player resumido');
    }
  }

  void stop() {
    _player.stop();
    _currentMusicId = null;
    log.d('Player parado');
  }

  void dispose() {
    _player.dispose();
    _currentMusicId = null;
    log.d('Player liberado');
  }
}

class PlayerProgress {
  final Duration position;
  final Duration duration;

  PlayerProgress({
    required this.position,
    required this.duration,
  });

  double get progress => 
    duration.inMilliseconds > 0 
      ? position.inMilliseconds / duration.inMilliseconds 
      : 0;
} 