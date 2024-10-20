// ignore_for_file: file_names

class Adminmodel {
  final String username;
  final String password;

  Adminmodel({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}

class AuthResponse {
  final String token;

  AuthResponse({required this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    // Ensure that the 'access_token' matches the key from your backend response.
    return AuthResponse(token: json['access_token']);
  }
}
