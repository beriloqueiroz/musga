import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import '../../providers/player_provider.dart';
import '../../utils/duration_formatter.dart';
import '../../services/player/audio_player_service.dart';

class MusicPlayerWidget extends ConsumerWidget {
  const MusicPlayerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider);
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Barra de Progresso
          StreamBuilder<PlayerProgress>(
            stream: player.progress,
            builder: (context, snapshot) {
              final progress = snapshot.data?.progress ?? 0.0;
              final position = snapshot.data?.position ?? Duration.zero;
              final duration = snapshot.data?.duration ?? Duration.zero;

              return Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: theme.colorScheme.primary,
                      thumbColor: theme.colorScheme.primary,
                    ),
                    child: Slider(
                      value: progress,
                      onChanged: (value) {
                        final newPosition = duration * value;
                        player.seek(newPosition);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatDuration(position)),
                        Text(formatDuration(duration)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Controles de Reprodução
          StreamBuilder<PlayerState>(
            stream: player.playerState,
            builder: (context, snapshot) {
              final playing = snapshot.data?.playing ?? false;

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: () {
                      // TODO: Implementar música anterior
                    },
                  ),
                  IconButton(
                    iconSize: 48,
                    icon: Icon(
                      playing ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      if (playing) {
                        player.pause();
                      } else {
                        player.resume();
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {
                      // TODO: Implementar próxima música
                    },
                  ),
                ],
              );
            },
          ),

          // Controle de Volume
          StreamBuilder<double>(
            stream: player.volume,
            builder: (context, snapshot) {
              final volume = snapshot.data ?? 1.0;

              return Row(
                children: [
                  Icon(volume == 0 
                    ? Icons.volume_off 
                    : Icons.volume_up
                  ),
                  Expanded(
                    child: Slider(
                      value: volume,
                      onChanged: player.setVolume,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
} 