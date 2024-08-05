class Client {
  Client({
    required this.id,
    required this.username,
    required this.createdAt,
    required this.gender,
    required this.birthday,
  });

  /// User ID of the profile
  final String id;

  /// Username of the profile
  String username;

  /// Date and time when the profile was created
  final DateTime createdAt;

  /// Gender of the profile
  String gender;

  /// Birthday of the profile
  DateTime birthday;

  /// Getter for the username
  String get getUsername => username;

  /// Setter for the username
  set setUsername(String newUsername) {
    username = newUsername;
  }

  /// Getter for the gender
  String get getGender => gender;

  /// Setter for the gender
  set setGender(String newGender) {
    gender = newGender;
  }

  /// Getter for the birthday
  DateTime get getBirthday => birthday;

  /// Setter for the birthday
  set setBirthday(DateTime newBirthday) {
    birthday = newBirthday;
  }

  Client.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        createdAt = DateTime.parse(map['createdAt']),
        gender = map['gender'],
        birthday = DateTime.parse(map['birthday']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'createdAt': createdAt.toIso8601String(),
        'gender': gender,
        'birthday': birthday.toIso8601String(),
      };
}
