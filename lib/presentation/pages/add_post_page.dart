import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/primary_button_widget.dart';
import '../bloc/posts_bloc.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({
    super.key,
  });

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  TextEditingController titleTextController = TextEditingController();
  TextEditingController bodyTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          /// INPUT FORM VIEW
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                const Gap(kMarginLarge),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: kMarginMedium3,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: kMarginLarge,
                    vertical: kMarginLarge,
                  ),
                  decoration: BoxDecoration(
                    gradient: kUserCardGradient,
                    borderRadius: BorderRadius.circular(kMarginMedium4),
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(kMarginLarge),
                        const Padding(
                          padding: EdgeInsets.only(left: kMarginMedium2),
                          child: Text(
                            "ADD NEW POST ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: kTextHeading1X,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Gap(kMarginLarge),
                        TextFormField(
                          controller: titleTextController,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: kTextRegular2X,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(kMarginMedium2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(kMarginMedium),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: kMarginMedium4,
                              vertical: kMarginMedium4,
                            ),
                            fillColor: Colors.black,
                            filled: true,
                            labelText: "Title",
                            labelStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: kTextRegular2X,
                              fontWeight: FontWeight.w500,
                            ),
                            hintText: "Edit your title",
                            hintStyle:
                                const TextStyle(color: kTextSecondaryColor),
                          ),
                        ),
                        const Gap(kMarginLarge),
                        TextFormField(
                          controller: bodyTextController,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: kTextRegular2X,
                            fontWeight: FontWeight.w500,
                          ),
                          minLines: 5,
                          maxLines: 12,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(kMarginMedium2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(kMarginMedium),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: kMarginMedium4,
                              vertical: kMarginMedium4,
                            ),
                            fillColor: Colors.black,
                            filled: true,
                            labelText: "Body",
                            labelStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: kTextRegular2X,
                              fontWeight: FontWeight.w500,
                            ),
                            hintText: "Edit body text",
                            hintStyle:
                                const TextStyle(color: kTextSecondaryColor),
                          ),
                        ),
                        const Gap(kMarginLarge),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// CONFIRM BUTTON VIEW
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                if (state is GetPostsLoadingState) {
                  return PrimaryButton(label: "Confirm", onTap: () {
                    debugPrint("Hello");
                  });
                } else if (state is GetPostsSuccessState) {
                  return PrimaryButton(
                    onTap: () {
                      final PostVO postVO = PostVO(
                          body: bodyTextController.text.toString(),
                          title: titleTextController.text.toString(),
                          id: state.postVOList.last.id! + 1,
                          userId: state.postVOList.last.userId);


                      context
                          .read<PostsBloc>()
                          .add(OnAddPostConfirmedEvent(postVO: postVO));
                      context.read<PostsBloc>().add(GetAllPostsEvent());
                      Navigator.pop(context);
                    },
                    label: "Confirm",
                  );
                } else if (state is GetPostsFailureState) {
                  return PrimaryButton(label: "Confirm", onTap: () {});
                }
                return PrimaryButton(label: "Confirm", onTap: () {});
              },
            ),
          )
        ],
      ),
    );
  }
}
