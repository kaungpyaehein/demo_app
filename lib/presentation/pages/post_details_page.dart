import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';

import '../../persistence/post_dao.dart';
import '../../utils/dimensions.dart';

class PostDetailsPage extends StatelessWidget {
  final int index;
  const PostDetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    debugPrint(PostsDao().getPostById(1)?.body.toString());

    return Hero(
      transitionOnUserGestures: true,
      tag: index,
      child: Scaffold(
        backgroundColor: kTextFieldFillColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kTextFieldFillColor,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              // pinned: true,
              // snap: true,
              flexibleSpace: const FlexibleSpaceBar(
                background: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kMarginLarge, vertical: kMarginMedium3),
                    child: CircleAvatar(
                      maxRadius: 100,
                      backgroundColor: Colors.black,
                      child: Text(
                        "EX",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 120,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kMarginLarge),
                    topRight: Radius.circular(kMarginLarge),
                  ),
                  color: Colors.black,
                ),
                padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(kMarginLarge),
                    const Padding(
                      padding: EdgeInsets.only(left: kMarginMedium2),
                      child: Text(
                        "API",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: kTextHeading1X,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Gap(kMarginLarge),
                    Text(
                      "ID",
                      style: TextStyle(
                        fontSize: kTextRegular,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const Gap(kMarginMedium),
                    const Text(
                      "2",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: kTextRegular2X,
                        color: Colors.white,
                      ),
                    ),
                    const Gap(kMarginLarge),
                    Text(
                      "Title",
                      style: TextStyle(
                        fontSize: kTextRegular,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const Gap(kMarginMedium),
                    const Text(
                      "quas fugiat ut perspiciatis vero provident",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: kTextRegular2X,
                        color: Colors.white,
                      ),
                    ),
                    const Gap(kMarginLarge),
                    Text(
                      "Body",
                      style: TextStyle(
                        fontSize: kTextRegular,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const Gap(kMarginMedium),
                    const Text(
                      "eum non blanditiis soluta porro quibusdam voluptas\nvel voluptatem qui placeat dolores qui velit aut\nvel inventore aut cumque culpa explicabo aliquid at\nperspiciatis est et voluptatem dignissimos dolor itaque sit nam",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: kTextRegular2X,
                        color: Colors.white,
                      ),
                    ),
                    Gap(MediaQuery.of(context).size.height * 0.4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
