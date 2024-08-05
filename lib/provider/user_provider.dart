import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ego/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends GetxController {
  static UserProvider get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection('Users').add(user.toJson()).whenComplete(() {
      Get.snackbar(
        'Success',
        'Your account has been created.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }).catchError((error, stackTrace) {
      Get.snackbar(
        'Error',
        'Something went wrong. Try again',
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }
}

class UserModelProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  final _db = FirebaseFirestore.instance;

  Future<UserModel> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString(_id);
    final String? username = prefs.getString(_username);
    final String? createdAt = prefs.getString(_createdAt);
    final String? gender = prefs.getString(_gender);
    final String? birthday = prefs.getString(_birthday);
    debugPrint('id: $id');
    debugPrint('username: $username');
    debugPrint('createdAt: $createdAt');
    debugPrint('gender: $gender');
    debugPrint('birthday: $birthday');
    _user = UserModel(
        id: id!,
        username: username!,
        gender: gender!,
        createdAt: createdAt as DateTime,
        birthday: birthday as DateTime);

    notifyListeners();

    return _user ??
        UserModel(
            id: '0',
            username: '',
            gender: 'other',
            createdAt: DateTime.now(),
            birthday: DateTime.now());
  }

  Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(_id, user.id);
    prefs.setString(_username, user.username);
    prefs.setString(_gender, user.gender);
    prefs.setString(_createdAt, user.createdAt as String);
    prefs.setString(_birthday, user.birthday as String);

    _user = user;
    notifyListeners();
  }

  static const String _id = 'id';
  static const String _username = 'username';
  static const String _gender = 'gender';
  static const String _createdAt = 'createdAt';
  static const String _birthday = 'birthday';
}
