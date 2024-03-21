import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/primary_button_widget.dart';
import '../widgets/primary_text_form_field_widget.dart';

class AddApiPage extends StatelessWidget {
  const AddApiPage({super.key});

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
                          "Add API",
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
          const Align(
            alignment: Alignment.bottomCenter,
            child: PrimaryButton(),
          )
        ],
      ),
    );
  }
}
