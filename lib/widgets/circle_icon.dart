import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleIcon extends StatelessWidget {
  final String imageIcon;
  const CircleIcon({super.key, required this.imageIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 30, 30, 30),
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [Colors.grey.shade800, Color.fromARGB(255, 30, 30, 30)],
          center: Alignment(-0.2, -0.2),
          radius: 0.4,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.backgroundColor,
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: SizedBox(
          height: 24,
          width: 24,
          child: SvgPicture.asset(imageIcon, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
