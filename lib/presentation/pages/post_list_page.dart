import 'package:flutter/material.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';
import 'package:iapp_flutter_interview_app/utils/dimensions.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.only(top: kMarginXXLarge),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kMarginMedium4),
                gradient: kUserCardGradient,
                border: Border.all(color: kTextSecondaryColor),
              ),
              margin: const EdgeInsets.symmetric(
                  horizontal: kMarginMedium4, vertical: kMarginSmall),
              padding: const EdgeInsets.symmetric(
                  horizontal: kMarginMedium3, vertical: kMarginMedium2),
              child: const Row(
                children: [
                  Text(
                    "user id",
                    style: TextStyle(
                        color: Colors.white, fontSize: kTextRegular2X),
                  ),
                  Spacer(),
                  Text("user name"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
