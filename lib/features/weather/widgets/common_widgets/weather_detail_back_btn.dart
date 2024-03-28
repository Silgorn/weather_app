import 'package:flutter/material.dart';

class WeatherDetailBackBtn extends StatelessWidget {
  const WeatherDetailBackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
          fixedSize: const MaterialStatePropertyAll(Size.fromWidth(250)),
          backgroundColor: MaterialStateProperty.all(Colors.amber)),
      child: const Text(
        'Back',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
