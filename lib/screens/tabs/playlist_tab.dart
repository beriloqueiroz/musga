import 'package:flutter/material.dart';
import 'package:musga/screens/tabs/playlist_detail_screen.dart';

import 'package:musga/services/api/playlist_service.dart';
import 'package:musga/models/playlist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaylistsTab extends ConsumerStatefulWidget {
  const PlaylistsTab({super.key});

  @override
  ConsumerState<PlaylistsTab> createState() => _PlaylistsTabState();
}

class _PlaylistsTabState extends ConsumerState<PlaylistsTab> {
  List<Playlist> _playlists = [];
  bool _isLoading = true;
  PlaylistService? _playlistService;
  Playlist? _selectedPlaylist;

  Future<void> _initPlaylistService() async {
    final prefs = await SharedPreferences.getInstance();
    _playlistService = PlaylistService(prefs);
  }

  @override
  void initState() {
    super.initState();
    _initPlaylistService().then((_) {
      _loadPlaylists();
    });
  }

  Future<void> _loadPlaylists() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final playlists = await _playlistService?.getPlaylists();
      setState(() {
        _playlists = playlists ?? [];
      });
    } catch (e) {
      // Tratar erro ao carregar playlists
      print('Erro ao carregar playlists: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _createPlaylist() async {
    // Implementar lógica para criar uma nova playlist
    // Exemplo: abrir um diálogo para o usuário inserir o nome da nova playlist
    String? newPlaylistName = await _showCreatePlaylistDialog();
    if (newPlaylistName != null && newPlaylistName.isNotEmpty) {
      // Chamar o serviço para criar a nova playlist
      try {
        final newPlaylist = Playlist(id: "", name: newPlaylistName);
        await _playlistService?.createPlaylist(newPlaylist);
        _loadPlaylists(); // Recarregar playlists após a criação
      } catch (e) {
        print('Erro ao criar playlist: $e');
      }
    }
  }

  Future<void> _deletePlaylist(String id) async {
    // Implementar lógica para excluir a playlist
    try {
      await _playlistService?.deletePlaylist(id);
      _loadPlaylists(); // Recarregar playlists após a exclusão
    } catch (e) {
      print('Erro ao excluir playlist: $e');
    }
  }

  Future<String?> _showCreatePlaylistDialog() {
    final TextEditingController controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Criar Nova Playlist'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Nome da Playlist'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('Criar'),
            ),
          ],
        );
      },
    );
  }

  void _showPlaylistDetails(Playlist playlist) {
    setState(() {
      _selectedPlaylist = playlist;
    });
  }

  void _goBackToPlaylists() {
    setState(() {
      _selectedPlaylist = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _createPlaylist,
          child: const Text('Criar Playlist'),
        ),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _playlists.isEmpty
                  ? const Center(child: Text('Nenhuma playlist encontrada'))
                  : Column(
                      children: [
                        if (_selectedPlaylist == null)
                          Expanded(
                            child: ListView.builder(
                              itemCount: _playlists.length,
                              itemBuilder: (context, index) {
                                final playlist = _playlists[index];
                                return ListTile(
                                  title: Text(playlist.name),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      _deletePlaylist(playlist.id);
                                    },
                                  ),
                                  onTap: () => _showPlaylistDetails(playlist),
                                );
                              },
                            ),
                          ),
                        if (_selectedPlaylist != null)
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.arrow_back),
                                      onPressed: _goBackToPlaylists,
                                    ),
                                    Center(
                                      child: Text(
                                        _selectedPlaylist!.name,
                                        style: TextStyle(fontSize: 24),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: PlaylistDetailScreen(playlistId: _selectedPlaylist!.id),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
        ),
      ],
    );
  }
} 