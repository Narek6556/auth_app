import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'app_info.g.dart';

@JsonSerializable()
class AppInfo {
  String? id;
  final int is_user_logged_in;
  final int is_dark_mode;

  AppInfo({
    this.id,
    required this.is_user_logged_in,
    required this.is_dark_mode,
  }) {
    id = id ?? generateId();
  }

  bool get isDarkMode => is_dark_mode == 1;
  bool get isUserLoggedin => is_user_logged_in == 1;

  AppInfo copyWith({
    int? is_dark_mode,
    int? is_user_logged_in,
  }) {
    return AppInfo(
      is_user_logged_in: is_user_logged_in ?? this.is_user_logged_in,
      is_dark_mode: is_dark_mode ?? this.is_dark_mode,
    );
  }

  factory AppInfo.fromJson(Map<String, dynamic> json) =>
      _$AppInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AppInfoToJson(this);

  static String generateId() {
    return Uuid().v4();
  }
}
