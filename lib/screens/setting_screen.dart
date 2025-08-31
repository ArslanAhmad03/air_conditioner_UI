import 'package:air_conditioner_ui/data/dummy_data.dart';
import 'package:air_conditioner_ui/utils/app_button.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:air_conditioner_ui/utils/app_text.dart';
import 'package:air_conditioner_ui/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    final w = ScreenSize.width(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.01),
                //
                CustomText(
                  text: 'Settings',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                SizedBox(height: h * 0.08),

                //context
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: deviceData.length,
                  itemBuilder: (context, index) {
                    final data = deviceData[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.01,
                        vertical: 16,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.withAlpha(16)),
                        ),
                        child: Column(
                          children: [
                            // header
                            Container(
                              height: 56,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Device',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                  Center(
                                    child: SvgPicture.asset(
                                      'assets/svg/notification.svg',
                                      height: 24,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Device ID',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                  CustomText(
                                    text: data.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                            ),

                            Divider(color: Colors.grey.withAlpha(16)),

                            // status
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: 'Status',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      color: data.status == true
                                          ? Colors.green
                                          : Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  CustomText(
                                    text: data.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                            ),

                            Divider(color: Colors.grey.withAlpha(16)),

                            // connection
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Auto connect',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                  Transform.scale(
                                    scale: 0.6,
                                    child: Switch(
                                      value: data.status,
                                      activeColor: AppColors.primaryColor,
                                      inactiveTrackColor:
                                          AppColors.backgroundColor,
                                      thumbColor: WidgetStatePropertyAll(
                                        AppColors.primaryColor,
                                      ),
                                      onChanged: (_) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Divider(color: Colors.grey.withAlpha(16)),

                            //  button
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: AppButton(
                                onTap: () {},
                                title: data.status ? 'Disconnect' : 'Connect',
                                height: 42,
                                width: w * 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
