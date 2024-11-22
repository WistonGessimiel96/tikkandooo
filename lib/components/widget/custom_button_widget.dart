import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final dynamic onPress;
  final Color color;
  final Color textColor;
  final double textSize;
  final double radiusSize;
  final double hauteur;

  const CustomButton(
      {Key? key,
        required this.title,
        required this.onPress,
        this.color = AppColors.primary,
        this.textColor = AppColors.white,
        this.textSize = 15,
        this.hauteur = 45,
        this.radiusSize = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: hauteur,
          child: ElevatedButton(
            onPressed: () => onPress(),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radiusSize)),
              textStyle:  TextStyle(fontSize: textSize),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}