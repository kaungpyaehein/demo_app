import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';
import 'package:iapp_flutter_interview_app/utils/dimensions.dart';

import '../../widgets/primary_button_widget.dart';
import '../../widgets/primary_text_form_field_widget.dart';

class EditPostPage extends StatelessWidget {
  const EditPostPage({super.key});

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
                child: const Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(kMarginLarge),
                      Padding(
                        padding: EdgeInsets.only(left: kMarginMedium2),
                        child: Text(
                          "Edit Post",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: kTextHeading1X,
                              color: Colors.white),
                        ),
                      ),
                      Gap(kMarginLarge),
                      PrimaryTextFormFieldWidget(),
                      Gap(kMarginLarge),
                      PrimaryTextFormFieldWidget(),
                      Gap(kMarginLarge),
                      PrimaryTextFormFieldWidget(),
                      Gap(kMarginLarge),
                      PrimaryTextFormFieldWidget(),
                      Gap(kMarginLarge),
                      PrimaryTextFormFieldWidget(),
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
              onTap: () {},
              label: "Confirm",
            ),
          )
        ],
      ),
    );
  }
}
