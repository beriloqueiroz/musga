class AuthResponse {
  final String token;
  final String id;
  final String email;
  final bool isAdmin;

  AuthResponse({
    required this.token,
    required this.id,
    required this.email,
    required this.isAdmin,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
      isAdmin: json['is_admin'] as bool? ?? false,
    );
  }
} 