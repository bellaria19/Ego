class Profile {
  Profile({
    required this.id,
    required this.username,
    required this.createdAt,
    required this.gender,
    required this.birthday,
  });

  /// User ID of the profile
  final String id;

  /// Username of the profile
  final String username;

  /// Date and time when the profile was created
  final DateTime createdAt;

  /// Gender of the profile
  final String gender;

  /// Birthday of the profile
  final DateTime birthday;

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        createdAt = DateTime.parse(map['created_at']),
        gender = map['gender'],
        birthday = DateTime.parse(map['birthday']);
}
