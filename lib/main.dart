import 'package:flutter/material.dart';
import 'package:iapp_flutter_interview_app/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:iapp_flutter_interview_app/presentation/pages/app_navigation.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';

void main() {
  RetrofitDataAgentImpl().getPosts().then((value) {
    print(value.toString());
  });
  runApp(const InterviewDemoApp());
}

class InterviewDemoApp extends StatelessWidget {
  const InterviewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
          // fontFamily: kRoboto,
          appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent,
          backgroundColor: kScaffoldBackgroundColor),
          colorScheme: ColorScheme.fromSeed(
              seedColor: kPrimaryColor, brightness: Brightness.dark)),
      home: const AppNavigation(),
    );
  }
}
