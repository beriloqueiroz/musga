class ApiConfig {
  static const String serverIP = '192.168.18.8';  // Confirme se este é o IP correto
  static const int grpcPort = 50051;
  static const int restPort = 8080;
  
  // Adicionando um print para debug
  static String get restBaseUrl {
    final url = 'http://$serverIP:$restPort';
    print('URL Base gerada: $url');  // Debug
    return url;
  }
  static String get grpcUrl => '$serverIP:$grpcPort';
} 