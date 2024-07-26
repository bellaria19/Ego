import 'package:flutter/material.dart';

class ChatField extends StatelessWidget {
  const ChatField({
    super.key,
    this.focusNode,
    this.controller,
    this.isReadOnly = false,
    required this.onFieldsubmitted,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool isReadOnly;
  final void Function(String?) onFieldsubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      maxLines: null,
      autofocus: true,
      focusNode: focusNode,
      controller: controller,
      readOnly: isReadOnly,
      onFieldSubmitted: onFieldsubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        hintText: 'Write message',
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
