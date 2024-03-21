import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class PrimaryTextFormFieldWidget extends StatelessWidget {
  const PrimaryTextFormFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
              horizontal: kMarginLarge, vertical: kMarginMedium4),
          fillColor: Colors.black,
          filled: true,
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: kMarginLarge, vertical: kMarginMedium4),
            width: 100,
            child: const Text(
              "Name",
              style: TextStyle(
                color: Colors.white,
                fontSize: kTextRegular2X,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          hintText: "Find your api",
          hintStyle: const TextStyle(color: kTextSecondaryColor)),
    );
  }
}
