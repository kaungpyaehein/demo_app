import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  const PrimaryButton({
    super.key, required this.label, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kMarginMedium4),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kMarginMedium3),
              ),
              minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 55)),
          child: const Text(
            "Confirm",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: kTextRegular2X,
            ),
          ),
        ),
      ),
    );
  }
}
