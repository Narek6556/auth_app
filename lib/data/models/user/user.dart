import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String email;
  String username;
  String password;

  User({
    this.id,
    required this.email,
    required this.username,
    required this.password,
  }) {
    id = id ?? generateId();
  }

  User copyWith({
    String? email,
    String? username,
    String? password,
  }) {
    return User(
      id: id,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static String generateId() {
    return Uuid().v4();
  }
}
