import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/presentation/bloc/posts_bloc.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';
import 'package:iapp_flutter_interview_app/utils/dimensions.dart';
import 'package:iapp_flutter_interview_app/utils/toasts.dart';

import '../../widgets/primary_button_widget.dart';

final _editPostFormKey = GlobalKey<FormState>();

class EditPostPage extends StatefulWidget {
  final PostVO postVO;
  const EditPostPage({super.key, required this.postVO});

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  TextEditingController titleTextController = TextEditingController();
  TextEditingController bodyTextController = TextEditingController();
  @override
  void initState() {
    titleTextController.text = widget.postVO.title ?? "";
    bodyTextController.text = widget.postVO.body ?? "";
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
                    key: _editPostFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(kMarginLarge),
                        Padding(
                          padding: const EdgeInsets.only(left: kMarginMedium2),
                          child: Text(
                            "Edit Post ID - ${widget.postVO.id} ",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: kTextHeading1X,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Gap(kMarginLarge),

                        /// TITLE INPUT FIELD
                        EditPostTitlenputField(
                            titleTextController: titleTextController),
                        const Gap(kMarginLarge),

                        /// BODY INPUT FIELD
                        EditPostBodyInputField(
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
            child: PrimaryButton(
              onTap: () {
                if (_editPostFormKey.currentState!.validate()) {
                  final PostVO postVO = widget.postVO.copyWith(
                    title: titleTextController.text.toString(),
                    body: bodyTextController.text.toString(),
                  );
                  context
                      .read<PostsBloc>()
                      .add(OnEditPostConfirmEvent(postVO: postVO));
                  context.read<PostsBloc>().add(GetAllPostsEvent());
                  Navigator.pop(context);
                }
                ShowToastMessage()
                    .showErrorToast("Please enter title and password");
              },
              label: "Confirm",
            ),
          )
        ],
      ),
    );
  }
}

class EditPostBodyInputField extends StatelessWidget {
  const EditPostBodyInputField({
    super.key,
    required this.bodyTextController,
  });

  final TextEditingController bodyTextController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (body) {
        if (body == null || body.isEmpty) {
          return "Body cannot be empty";
        }
        return null;
      },
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kMarginMedium),
        ),
        errorStyle: TextStyle(color: Colors.red),
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

class EditPostTitlenputField extends StatelessWidget {
  const EditPostTitlenputField({
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
        errorStyle: TextStyle(color: Colors.red),
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
        hintStyle: const TextStyle(color: kTextSecondaryColor),
      ),
    );
  }
}
