import 'package:flutter/material.dart';
import 'package:iapp_flutter_interview_app/pages/app_navigation.dart';
import 'package:iapp_flutter_interview_app/utils/fonts.dart';

void main() {
  runApp(const InterviewDemoApp());
}

class InterviewDemoApp extends StatelessWidget {
  const InterviewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kAnonymousPro,
      ),
      home: const AppNavigation(),
    );
  }
}
