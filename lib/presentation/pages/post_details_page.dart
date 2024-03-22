import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';

import '../../utils/dimensions.dart';

class PostDetailsPage extends StatelessWidget {
  final PostVO postVO;

  const PostDetailsPage({super.key, required this.postVO});

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: postVO.id.toString(),
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
                        "POST",
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
                    Text(
                      postVO.id.toString(),
                      style: const TextStyle(
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
                    Text(
                      postVO.title ?? "",
                      style: const TextStyle(
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
                    Text(
                      postVO.body ?? "",
                      style: const TextStyle(
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
