import 'package:flutter/material.dart';
import 'package:musga/models/playlist.dart';
import 'package:musga/services/api/playlist_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:musga/providers/player_provider.dart';

class PlaylistDetailScreen extends ConsumerStatefulWidget {
  final String playlistId;

  const PlaylistDetailScreen({super.key, required this.playlistId});

  @override
  ConsumerState<PlaylistDetailScreen> createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends ConsumerState<PlaylistDetailScreen> {
  Playlist? _playlist;
  bool _isLoading = true;
  PlaylistService? _playlistService;

  Future<void> _initPlaylistService() async {
    final prefs = await SharedPreferences.getInstance();
    _playlistService = PlaylistService(prefs);
  }

  @override
  void initState() {
    super.initState();
    _initPlaylistService().then((_) {
      _loadPlaylist();
    });
  }

  Future<void> _loadPlaylist() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final playlist = await _playlistService?.getPlaylist(widget.playlistId);
      setState(() {
        _playlist = playlist;
      });
    } catch (e) {
      print('Erro ao carregar playlist: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _playPlaylist(bool randomOrder) {
    final player = ref.read(playerProvider);
    if (_playlist != null) {
      // Tocar músicas da playlist
      player.playMusicList(_playlist!.musics.map((music) => music.id).toList(), randomOrder);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_playlist?.name ?? 'Detalhes da Playlist'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _playlist == null
              ? const Center(child: Text('Playlist não encontrada'))
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => _playPlaylist(false),
                          child: const Text('Tocar em Ordem'),
                        ),
                        ElevatedButton(
                          onPressed: () => _playPlaylist(true),
                          child: const Text('Tocar Aleatório'),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _playlist!.musics.length,
                        itemBuilder: (context, index) {
                          final music = _playlist!.musics[index];
                          return ListTile(
                            title: Text(music.title),
                            subtitle: Text(music.artist),
                            onTap: () {
                              // Tocar música individualmente se necessário
                              // player.playMusic(music.id);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
} 