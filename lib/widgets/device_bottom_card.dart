import 'package:air_conditioner_ui/utils/app_text.dart';
import 'package:air_conditioner_ui/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeviceBottomCard extends StatelessWidget {
  const DeviceBottomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = ScreenSize.width(context);
    return Container(
      height: w * 0.4,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(16),
        border: Border(
          top: BorderSide(color: Colors.grey.withAlpha(32), width: 1),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      'assets/svg/off.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(Icons.arrow_back_ios_new_outlined, size: 16),
                  ),
                  CustomText(
                    text: '29°C',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(Icons.arrow_forward_ios_outlined, size: 16),
                  ),
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      'assets/svg/vent_icon.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: CustomText(
                      text: 'On',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  CustomText(
                    text: 'Vent',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
