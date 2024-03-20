import 'package:flutter/material.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: Center(
        child: Text(
          "Confirm",
          style: TextStyle(
              color: Colors.blue, fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
