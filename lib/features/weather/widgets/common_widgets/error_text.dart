import 'package:flutter/material.dart';

Widget showErrorText(String errorMessage) {
  return Center(
    child: Text(
      errorMessage,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
