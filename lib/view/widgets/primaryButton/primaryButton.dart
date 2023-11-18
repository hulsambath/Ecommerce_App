import 'dart:ffi';

import 'package:flutter/material.dart';

class Primarybutton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const Primarybutton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 350,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(title),
        ),
      ),
    );
  }
}