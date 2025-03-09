import 'package:flutter/material.dart';
import '../services/api/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tabs/search_music_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/player/music_player_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isAdmin = false;
  late AuthService _authService;

  @override
  void initState() {
    super.initState();
    print('DEBUG: HomeScreen initState');
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print('DEBUG: Tab alterada para índice ${_tabController.index}');
    });
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _authService = AuthService(prefs);
    setState(() {
      _isAdmin = prefs.getBool('is_admin') ?? false;
    });
  }

  Future<void> _generateInviteCode() async {
    // TODO: Implementar geração de código de convite
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Gerar Convite'),
        content: TextField(
          decoration: const InputDecoration(
            labelText: 'Email do convidado',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar chamada à API
              Navigator.pop(context);
            },
            child: const Text('Gerar'),
          ),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    await _authService.logout();
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG: HomeScreen - build chamado'); // Log básico
    return Scaffold(
      appBar: AppBar(
        title: const Text('MUSGA'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.playlist_play),
              text: 'Minhas Playlists',
            ),
            Tab(
              icon: Icon(Icons.search),
              text: 'Buscar Músicas',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const PlaylistsTab(),
                Builder(
                  builder: (context) {
                    print('DEBUG: Construindo SearchMusicTab no TabBarView');
                    return const SearchMusicTab();
                  },
                ),
              ],
            ),
          ),
          const MusicPlayerWidget(),
        ],
      ),
      floatingActionButton: _isAdmin
          ? FloatingActionButton(
              onPressed: _generateInviteCode,
              child: const Icon(Icons.person_add),
            )
          : null,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class PlaylistsTab extends StatelessWidget {
  const PlaylistsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Lista de Playlists virá aqui'),
      // TODO: Implementar lista de playlists
    );
  }
} 