import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/presentation/bloc/posts_bloc.dart';
import 'package:iapp_flutter_interview_app/presentation/pages/post_details_page.dart';
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
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        if (state is GetPostsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetPostsSuccessState) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.postVOList.length,
              itemBuilder: (context, index) {
                final PostVO postVO = state.postVOList[index];
                return PostDetailsCard(
                  postVO: postVO,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailsPage(
                            postVO: postVO,
                          ),
                        ));
                  },
                );
              },
            ),
          );
        } else if (state is GetPostsFailureState) {
          return Center(
            child: Text("Error fetching data ${state.errorMessage}"),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class PostDetailsCard extends StatelessWidget {
  const PostDetailsCard({
    super.key,
    required this.postVO,
    required this.onTap,
  });

  final PostVO postVO;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                  "ID ${postVO.id}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: kTextRegular2X,
                  ),
                ),
              ],
            ),
            const Gap(kMarginMedium4),

            /// Title
            Text(
              postVO.title ?? "",
              maxLines: 2,
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w800,
                fontSize: kTextRegular2X,
              ),
            ),
            const Gap(kMarginMedium),

            /// Body
            Text(
              postVO.body ?? "",
              maxLines: 4,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
                fontSize: kTextRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
