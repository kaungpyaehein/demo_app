import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';
import 'package:iapp_flutter_interview_app/utils/dimensions.dart';



class PostDetailsCardListPage extends StatelessWidget {
  const PostDetailsCardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kMarginMedium4),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(kMarginLarge),

              /// TITLE
              Text(
                "User Details List",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: kTextRegular3X),
              ),
              Gap(kMarginLarge),

              /// USER DETAILS CARD LIST
              PostDetailsCardListView()
            ],
          ),
        ),
      ),
    );
  }
}

class PostDetailsCardListView extends StatelessWidget {
  const PostDetailsCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kMarginMedium4, vertical: kMarginMedium4),
          margin: const EdgeInsets.only(bottom: kMarginMedium2),
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(
                kMarginLarge,
              ),
              gradient: kUserCardGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Colors.black,
                    child: Text(
                      "EX",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 25),
                    ),
                  ),
                  const Gap(kMarginLarge),

                  /// ID
                  Text(
                    "ID $index",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: kTextRegular2X,
                    ),
                  ),
                ],
              ),
              const Gap(kMarginMedium4),

              /// Title
              const Text(
                "laboriosam dolor voluptates",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: kTextRegular2X,
                ),
              ),
              const Gap(kMarginMedium),

              /// Body
              Text(
                "doloremque ex facilis sit sint culpa\nsoluta assumenda eligendi non ut eius\nsequi ducimus vel quasi\nveritatis est dolores",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w500,
                  fontSize: kTextRegular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
