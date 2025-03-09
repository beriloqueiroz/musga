import '../../config/api_config.dart';
import 'package:http/http.dart' as http;
import '../../utils/logger.dart';
import 'dart:convert';

class AuthService {
  Future<bool> testConnection() async {
    try {
      final url = ApiConfig.restBaseUrl;
      log.d('URL do servidor: $url');
      
      final response = await http.get(Uri.parse('$url/api/health'));
      log.d('Resposta do teste: ${response.statusCode}');
      return true;
    } catch (e) {
      log.e('Erro ao testar conexão', error: e);
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    if (!await testConnection()) {
      log.e('Servidor inacessível');
      throw Exception('Não foi possível conectar ao servidor');
    }

    final url = '${ApiConfig.restBaseUrl}/api/auth/login';
    log.i('URL de login: $url');
    
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
      
      log.d('Status code: ${response.statusCode}');
      log.d('Resposta: ${response.body}');
      
      return response.statusCode == 200;
    } catch (e) {
      log.e('Erro no login: $e');
      rethrow;
    }
  }
} 