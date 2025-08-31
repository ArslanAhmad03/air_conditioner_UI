import 'package:air_conditioner_ui/data/dummy_data.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:air_conditioner_ui/utils/app_text.dart';
import 'package:air_conditioner_ui/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  text: 'My Profile',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                SizedBox(height: h * 0.05),

                // image
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 30, 30, 30),
                      border: Border.all(
                        color: AppColors.backgroundColor,
                        width: 3,
                      ),
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.grey.shade800,
                          Color.fromARGB(255, 30, 30, 30),
                        ],
                        center: Alignment(-0.3, -0.3),
                        radius: 0.8,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor,
                          blurRadius: 16,
                          spreadRadius: 9,
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svg/user.svg',
                        height: 56,
                        color: Colors.grey.shade600,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.06),

                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: 'Dannie',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                SizedBox(height: h * 0.01),

                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: 'Dannie342@gmail.com',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                  ),
                ),

                SizedBox(height: h * 0.02),

                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = supportData[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.15,
                        vertical: 16,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 32,
                            child: Center(
                              child: SvgPicture.asset(
                                data.imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          CustomText(
                            text: data.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.15),
                    child: Divider(color: AppColors.primaryColor),
                  ),
                  itemCount: supportData.length,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.15),
                  child: Divider(color: AppColors.primaryColor),
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
