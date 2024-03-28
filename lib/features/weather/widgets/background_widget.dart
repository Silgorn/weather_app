import 'package:flutter/material.dart';

BoxDecoration backgroundWidget() {
  return const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/background/background.jpg'),
      fit: BoxFit.cover,
    ),
  );
}
