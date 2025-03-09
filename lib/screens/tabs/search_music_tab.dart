import 'package:flutter/material.dart';
import '../../services/grpc/music_service_factory.dart';
import '../../proto/music.pb.dart';
import 'dart:async';
import '../../utils/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/player_provider.dart';

class SearchMusicTab extends ConsumerStatefulWidget {
  const SearchMusicTab({super.key});

  @override
  ConsumerState<SearchMusicTab> createState() => _SearchMusicTabState();
}

class _SearchMusicTabState extends ConsumerState<SearchMusicTab> {
  final _searchController = TextEditingController();
  List<Music> _searchResults = [];
  bool _isLoading = false;
  bool _hasMoreData = true;
  int _currentPage = 1;
  final _scrollController = ScrollController();
  final musicService = MusicServiceFactory.create();
  Timer? _debounce;

  @override
  void initState() {
    print('DEBUG: SearchMusicTab - initState chamado');
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8 &&
        !_isLoading &&
        _hasMoreData) {
      log.d('Scroll atingiu 80% da lista, carregando mais resultados');
      _loadMoreMusic();
    }
  }

  void _onSearchChanged(String value) {
    log.d('TextField alterado: "$value"');
    if (_debounce?.isActive ?? false) {
      log.d('Cancelando debounce anterior');
      _debounce!.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      log.d('Debounce concluído, iniciando busca');
      _searchMusic(value);
    });
  }

  Future<void> _loadMoreMusic() async {
    log.d('Carregando mais músicas: página ${_currentPage + 1}');
    if (_searchController.text.isEmpty) {
      log.d('Query vazia, ignorando carregamento');
      return;
    }
    
    _currentPage++;
    await _searchMusic(_searchController.text, loadMore: true);
  }

  Future<void> _searchMusic(String query, {bool loadMore = false}) async {
    log.d('Iniciando busca: query="$query", loadMore=$loadMore');
  
    if (query.isEmpty) {
      log.d('Query vazia, limpando resultados');
      setState(() {
        _searchResults = [];
        _hasMoreData = true;
        _currentPage = 1;
      });
      return;
    }

    if (!loadMore) {
      _currentPage = 1;
      setState(() => _isLoading = true);
      log.d('Nova busca: resetando para página 1');
    }

    try {
      log.d('Chamando serviço de busca: página $_currentPage');
      final results = await musicService.searchMusic(
        query,
        page: _currentPage,
        pageSize: 20,
      );
    
      log.i('Resultados recebidos: ${results.length}');
      setState(() {
        if (loadMore) {
          log.d('Adicionando ${results.length} resultados aos existentes');
          _searchResults.addAll(results);
        } else {
          log.d('Substituindo resultados existentes por ${results.length} novos');
          _searchResults = results;
        }
        _hasMoreData = results.length == 20;
        log.d('hasMoreData definido como: $_hasMoreData');
      });
    } catch (e, stack) {
      log.e('Erro na busca', error: e, stackTrace: stack);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro na busca: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
      log.d('Busca finalizada: _isLoading = false');
    }
  }

  void _playMusic(String musicId) {
    final player = ref.read(playerProvider);
    log.d('Tentando tocar música: $musicId');
    player.playMusic(musicId);
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG: SearchMusicTab - build chamado');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar músicas...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear,size: 20,),
                      onPressed: () {
                        _searchController.clear();
                        _searchMusic('');
                      },
                    )
                  : null,
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              print('DEBUG: TextField - onChanged: $value');
              _onSearchChanged(value);
            },
            onSubmitted: (value) {
              print('DEBUG: TextField - onSubmitted: $value');
              _searchMusic(value);
            },
          ),
        ),
        Expanded(
          child: _isLoading && _searchResults.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : _searchResults.isEmpty
                  ? const Center(
                      child: Text('Nenhuma música encontrada'),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: _searchResults.length + (_hasMoreData ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == _searchResults.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        final music = _searchResults[index];
                        return ListTile(
                          leading: const Icon(Icons.music_note),
                          title: Text(music.title),
                          subtitle: Text('${music.artist} • ${music.album}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.play_arrow),
                            onPressed: () => _playMusic(music.id),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
} 