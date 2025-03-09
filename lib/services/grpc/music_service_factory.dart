import 'package:flutter/foundation.dart';
import 'music_service.dart';
import 'mobile_music_service.dart';

class MusicServiceFactory {
  static MusicService create() {
    // Para Android/iOS, sempre retorna MobileMusicService
    return MobileMusicService();
  }
} 