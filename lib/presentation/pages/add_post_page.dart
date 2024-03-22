import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../utils/toasts.dart';
import '../../widgets/primary_button_widget.dart';
import '../bloc/posts_bloc.dart';

final _addPostFormKey = GlobalKey<FormState>();

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
                    key: _addPostFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(kMarginLarge),
                        const Padding(
                          padding: EdgeInsets.only(left: kMarginMedium2),

                          /// TITLE
                          child: Text(
                            "ADD NEW POST ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: kTextHeading1X,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        /// Spacer
                        const Gap(kMarginLarge),

                        /// TITLE INPUT FIELD
                        AddPostTitleInputField(
                            titleTextController: titleTextController),

                        const Gap(kMarginLarge),

                        /// BODY INPUT FIELD
                        AddPostBodyInputField(
                            bodyTextController: bodyTextController),
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
                  return PrimaryButton(
                      label: "Confirm",
                      onTap: () {
                        debugPrint("Hello");
                      });
                } else if (state is GetPostsSuccessState) {
                  return PrimaryButton(
                    onTap: () {
                      if (_addPostFormKey.currentState!.validate()) {
                        /// Create postVO object here
                        final PostVO postVO = PostVO(
                            body: bodyTextController.text.toString(),
                            title: titleTextController.text.toString(),
                            id: state.postVOList.last.id! + 1,
                            userId: state.postVOList.last.userId);

                        /// Call bloc here
                        context
                            .read<PostsBloc>()
                            .add(OnAddPostConfirmedEvent(postVO: postVO));
                        context.read<PostsBloc>().add(GetAllPostsEvent());
                        Navigator.pop(context);
                      }

                      ShowToastMessage()
                          .showErrorToast("Please enter title and password");
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

class AddPostBodyInputField extends StatelessWidget {
  const AddPostBodyInputField({
    super.key,
    required this.bodyTextController,
  });

  final TextEditingController bodyTextController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: bodyTextController,
      style: const TextStyle(
        color: Colors.white,
        fontSize: kTextRegular2X,
        fontWeight: FontWeight.w500,
      ),
      validator: (body) {
        if (body == null || body.isEmpty) {
          return "Body cannot be empty";
        }
        return null;
      },
      minLines: 5,
      maxLines: 12,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kMarginMedium2),
        ),
        errorBorder: OutlineInputBorder(
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
        hintStyle: const TextStyle(color: kTextSecondaryColor),
      ),
    );
  }
}

class AddPostTitleInputField extends StatelessWidget {
  const AddPostTitleInputField({
    super.key,
    required this.titleTextController,
  });

  final TextEditingController titleTextController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (title) {
        if (title == null || title.isEmpty) {
          return "Title cannot be empty";
        }
        return null;
      },
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kMarginMedium),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kMarginMedium4,
          vertical: kMarginMedium4,
        ),
        errorStyle: const TextStyle(color: Colors.red),
        fillColor: Colors.black,
        filled: true,
        labelText: "Title",
        labelStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: kTextRegular2X,
          fontWeight: FontWeight.w500,
        ),
        hintText: "Edit your title",
        hintStyle: const TextStyle(color: kTextSecondaryColor),
      ),
    );
  }
}
