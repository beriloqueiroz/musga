import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import '../../proto/music.pb.dart';

class GrpcAudioSource {
  final Stream<AudioChunk> _audioStream;
  late File _tempFile;
  final Completer<void> _readyCompleter = Completer<void>();

  GrpcAudioSource(this._audioStream) {
    _initialize();
  }

  Future<void> _initialize() async {
    final dir = await getTemporaryDirectory();
    _tempFile = File('${dir.path}/temp_audio.mp3');

    final raf = _tempFile.openSync(mode: FileMode.write);

    try {
      await for (final chunk in _audioStream) {
        if (chunk.data is Uint8List) {
          raf.writeFromSync(chunk.data as Uint8List);
        }

        if (!_readyCompleter.isCompleted) {
          _readyCompleter.complete();
        }
      }
    } catch (e) {
      print("Erro no stream gRPC: $e");
    } finally {
      await raf.close();
    }
  }

  Future<AudioSource> getAudioSource() async {
    await _readyCompleter.future; // Espera até que tenhamos um buffer inicial
    return AudioSource.uri(Uri.file(_tempFile.path));
  }
}
