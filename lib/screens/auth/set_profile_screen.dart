import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ego/models/user_model.dart';
import 'package:ego/provider/user_provider.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:ego/utils/constants_data.dart';
import 'package:ego/widget/explain_text.dart';
import 'package:ego/widget/profile_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  final UserModelProvider _provider = UserModelProvider();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  void setGender() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CupertinoPicker(
          itemExtent: 32,
          scrollController: FixedExtentScrollController(
            initialItem: 0,
          ),
          onSelectedItemChanged: (int selectedGender) {
            setState(() {
              _genderController.text = gender[selectedGender];
            });
          },
          children: List.generate(gender.length, (int index) {
            return Center(child: Text(gender[index]));
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const ExplainText(
            text: '닉네임',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ProfileInputField(
              controller: _nameController,
              hintText: '최대 10자',
              readOnly: false,
              suffix: IconButton(
                onPressed: _nameController.clear,
                icon: const Icon(FontAwesomeIcons.xmark),
              ),
            ),
          ),
          formSpacer,
          const ExplainText(
            text: '생년월일',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ProfileInputField(
                controller: _dateController,
                hintText: '생년월일',
                readOnly: true,
                onTap: () {
                  _selectDate();
                }),
          ),
          formSpacer,
          const ExplainText(
            text: '성별',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ProfileInputField(
              controller: _genderController,
              hintText: '성별',
              readOnly: true,
              onTap: () {
                setGender();
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  UserModel user = UserModel(
                    id: firebase.currentUser!.uid,
                    username: _nameController.text,
                    gender: _genderController.text,
                    createdAt: firebase.currentUser!.metadata.creationTime!,
                    birthday: DateTime.parse(_dateController.text),
                  );
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('Users');
                  collRef
                      .add(
                    user.toJson(),
                  )
                      .then((documentSnapshot) {
                    debugPrint('Added Data: ${documentSnapshot.toString()}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data saved successfully!')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  }).catchError((error) {
                    debugPrint('Error adding data: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to save data: $error')),
                    );
                  });
                  _provider.saveUser(user);
                },
                child: const Text(
                  '확인',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = pickedDate.toString().split(' ')[0];
      });
    }
  }
}
