import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/presentation/bloc/posts_bloc.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';
import 'package:iapp_flutter_interview_app/utils/dimensions.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is GetPostsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetPostsSuccessState) {
              return ListView.builder(
                padding: const EdgeInsets.only(top: kMarginXXLarge),
                itemCount: state.postVOList.length,
                itemBuilder: (context, index) {
                  final PostVO postVO = state.postVOList[index];

                  return PostItemView(
                    userId: postVO.userId.toString(),
                    postId: postVO.id.toString(),
                  );
                },
              );
            } else if (state is GetPostsFailureState) {
              return Center(
                child: Text("Error Fetching data ${state.errorMessage}"),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class PostItemView extends StatelessWidget {
  final String userId;
  final String postId;
  const PostItemView({super.key, required this.userId, required this.postId});

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          Text(
            "User ID - $userId",
            style:
                const TextStyle(color: Colors.white, fontSize: kTextRegular2X),
          ),
          const Spacer(),
          Text(postId),
        ],
      ),
    );
  }
}
