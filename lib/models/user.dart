class User {
  final String id;
  final String email;
  final bool isAdmin;

  User({
    required this.id,
    required this.email,
    this.isAdmin = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      isAdmin: json['is_admin'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'is_admin': isAdmin,
    };
  }
} 