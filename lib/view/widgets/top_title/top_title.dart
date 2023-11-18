import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title, subtitle;

  const TopTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: kToolbarHeight,
      ),
      if (title == "Login" || title == "Create Account")
        GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).pop();
            }),
      SizedBox(
        height: 14,
      ),
      Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 12,
      ),
      Text(subtitle),
    ]);
  }
}
