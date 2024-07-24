import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetListTile extends StatelessWidget {
  const SetListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        // style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: const TextStyle(color: Colors.grey),
            )
          : null,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
