import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/persistence/hive_constants.dart';
import 'package:iapp_flutter_interview_app/presentation/bloc/posts_bloc.dart';
import 'package:iapp_flutter_interview_app/presentation/pages/app_navigation.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';

void main() async {
  /// Initialize hive
  await Hive.initFlutter();

  /// Register adapters
  Hive.registerAdapter(PostVOAdapter());

  /// Open Hive Box
  await Hive.openBox<PostVO>(kBoxNamePostVO);

  runApp(const InterviewDemoApp());
}

class InterviewDemoApp extends StatelessWidget {
  const InterviewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (BuildContext context) => PostsBloc(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
