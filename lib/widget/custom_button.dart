import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback buttonTapped;

  const CustomButton({
    Key? key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Container(
        margin: const EdgeInsets.all(Dimens.spaceNormal),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: Dimens.textXLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
