import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:iapp_flutter_interview_app/persistence/hive_constants.dart';
import 'package:iapp_flutter_interview_app/persistence/post_dao.dart';
import 'package:iapp_flutter_interview_app/presentation/pages/app_navigation.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';

void main() async {
  /// Initialize hive
  await Hive.initFlutter();

  /// Register adapters
  Hive.registerAdapter(PostVOAdapter());

  /// Open Hive Box
  await Hive.openBox<PostVO>(kBoxNamePostVO);

  RetrofitDataAgentImpl().getPosts().then((value) {
    PostsDao().savePosts(value);
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
          appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.transparent,
              backgroundColor: kScaffoldBackgroundColor),
          colorScheme: ColorScheme.fromSeed(
              seedColor: kPrimaryColor, brightness: Brightness.dark)),
      home: const AppNavigation(),
    );
  }
}
