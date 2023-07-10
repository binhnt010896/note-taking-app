class User {
  final String id;
  final String? name;
  final String email;

  User({required this.id, this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] as String,
    name: json["name"] as String?,
    email: json["email"] as String,
  );

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}