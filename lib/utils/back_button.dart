import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackButtonBox extends StatelessWidget {
  const BackButtonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 30, 30, 30),
          border: Border.all(color: AppColors.backgroundColor, width: 3),
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [Colors.grey.shade800, Color.fromARGB(255, 30, 30, 30)],
            center: Alignment(-0.3, -0.3),
            radius: 0.8,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 27, 29, 32),
              blurRadius: 10,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/svg/arrow_back.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
