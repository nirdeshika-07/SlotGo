import 'package:flutter/material.dart';

import '../../core/theme/pallete.dart';

class GradientButton extends StatelessWidget {
  final String buttonValue;
  const GradientButton({
    super.key,
    required this.buttonValue
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            SlotPallete.gradient1,
            SlotPallete.gradient2,
            SlotPallete.gradient3,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: SlotPallete.transparentColor,
          shadowColor: SlotPallete.transparentColor,
        ),
        child: Text(
          buttonValue,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}