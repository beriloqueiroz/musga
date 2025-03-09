import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/auth_response.dart';
import '../../config/api_config.dart';
import '../../utils/logger.dart';

class AuthService {
  final String baseUrl = ApiConfig.restBaseUrl + '/api';
  final SharedPreferences _prefs;

  AuthService(this._prefs) {
    log.d('AuthService inicializado com baseUrl: $baseUrl');
  }

  Future<AuthResponse> login(String email, String password) async {
    try {
      final url = '$baseUrl/auth/login';
      log.d('Tentando login em: $url');

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      log.d('Status code: ${response.statusCode}');
      log.d('Resposta: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final authResponse = AuthResponse.fromJson(data);
        
        // Salvar dados na preferência
        await _prefs.setString('token', authResponse.token);
        await _prefs.setString('user_id', authResponse.id);
        await _prefs.setString('email', authResponse.email);
        await _prefs.setBool('is_admin', authResponse.isAdmin);
        return authResponse;
      }

      throw Exception('Falha no login: ${response.statusCode}');
    } catch (e) {
      print('Erro no login: $e');
      rethrow;
    }
  }

  Future<void> register(String email, String password, String inviteCode) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
        'invite_code': inviteCode,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Falha no registro');
    }
  }

  Future<void> logout() async {
    await _prefs.remove('token');
    await _prefs.remove('user_id');
    await _prefs.remove('email');
    await _prefs.remove('is_admin');
  }

  // Método para verificar se usuário está logado
  Future<bool> isAuthenticated() async {
    final token = await _prefs.getString('token');
    return token != null;
  }

  // Método para obter token
  Future<String?> getToken() async {
    return _prefs.getString('token');
  }
} 