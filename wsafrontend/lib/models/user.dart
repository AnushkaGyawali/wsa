class User {
  String id;
  String username;
  String token;

  User({required this.id, required this.username, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      token: json['token'],
    );
  }
}
