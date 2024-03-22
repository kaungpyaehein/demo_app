import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/data/vos/post_vo.dart';
import 'package:iapp_flutter_interview_app/presentation/bloc/posts_bloc.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';
import 'package:iapp_flutter_interview_app/utils/dimensions.dart';

import '../../widgets/primary_button_widget.dart';

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
          Column(
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

          /// CONFIRM BUTTON VIEW
          Align(
            alignment: Alignment.bottomCenter,
            child: PrimaryButton(
              onTap: () {
                final PostVO postVO = widget.postVO.copyWith(
                  title: titleTextController.text.toString(),
                  body: bodyTextController.text.toString(),
                );
                print(postVO.title);
                context
                    .read<PostsBloc>()
                    .add(OnEditPostConfirmEvent(postVO: postVO));
                context.read<PostsBloc>().add(GetAllPostsEvent());
                Navigator.pop(context);
              },
              label: "Confirm",
            ),
          )
        ],
      ),
    );
  }
}
