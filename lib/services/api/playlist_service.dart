import 'package:musga/models/playlist.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../config/api_config.dart';
import '../../services/api/auth_service.dart';

class PlaylistService {
  final String baseUrl = ApiConfig.restBaseUrl + '/api';
  final SharedPreferences _prefs;
  final AuthService _authService;

  PlaylistService(this._prefs) : _authService = AuthService(_prefs);

  Future<List<Playlist>> getPlaylists() async {
    final response = await http.get(Uri.parse('$baseUrl/playlists'), headers: {
      'Authorization': 'Bearer ${_prefs.getString('token')}',
    });
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List).map((e) => Playlist.fromJson(e)).toList();
    } else if (response.statusCode == 401) {
      await _authService.logout(); // Logout se não autorizado
      throw Exception('Failed to load playlists');
    } else {
      throw Exception('Failed to load playlists');
    }
  }

  Future<Playlist> getPlaylist(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/playlists/$id/musics'), headers: {
      'Authorization': 'Bearer ${_prefs.getString('token')}',
    });
    if (response.statusCode == 200) {
      return Playlist.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      await _authService.logout(); // Logout se não autorizado
      throw Exception('Failed to load playlist UNAUTHORIZED');
    } else {
      throw Exception('Failed to load playlist');
    }
  }

  Future<Playlist> createPlaylist(Playlist playlist) async {
    final response = await http.post(Uri.parse('$baseUrl/playlists'), headers: {
      'Authorization': 'Bearer ${_prefs.getString('token')}',
    }, body: json.encode(playlist.toJson()));
    print(response.statusCode);
    if (response.statusCode == 201) {
      return Playlist.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      await _authService.logout(); // Logout se não autorizado
      throw Exception('Failed to create playlist UNAUTHORIZED');
    } else {
      throw Exception('Failed to create playlist');
    }
  }

  Future<void> addMusicToPlaylist(int playlistId, String musicId) async {
    final response = await http.post(Uri.parse('$baseUrl/playlists/$playlistId/musics'), headers: {
      'Authorization': 'Bearer ${_prefs.getString('token')}',
    }, body: json.encode({'music_id': musicId}));
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      await _authService.logout(); // Logout se não autorizado
      throw Exception('Failed to add music to playlist UNAUTHORIZED');
    } else {
      throw Exception('Failed to add music to playlist');
    }
  }

  Future<void> deletePlaylist(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/playlists/$id'), headers: {
      'Authorization': 'Bearer ${_prefs.getString('token')}',
    });
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      await _authService.logout(); // Logout se não autorizado
      throw Exception('Failed to delete playlist UNAUTHORIZED');
    } else {
      throw Exception('Failed to delete playlist');
    }
  }
}