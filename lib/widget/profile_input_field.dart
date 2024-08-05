import 'package:flutter/material.dart';

class ProfileInputField extends StatelessWidget {
  const ProfileInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onTap,
    this.suffix,
    required this.readOnly,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function()? onTap;
  final bool readOnly;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xffE1E3EF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: suffix,
        ),
        onTap: onTap,
      ),
    );
  }
}
