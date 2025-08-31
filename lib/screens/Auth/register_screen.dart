import 'package:air_conditioner_ui/utils/app_button.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:air_conditioner_ui/utils/app_text.dart';
import 'package:air_conditioner_ui/utils/app_text_feild.dart';
import 'package:air_conditioner_ui/utils/screen_size.dart';
import 'package:air_conditioner_ui/utils/sizedbox_extension.dart';
import 'package:air_conditioner_ui/widgets/footer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //
              SizedBox(height: h * 0.1),

              // logo image
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: h * 0.1,
                  child: SvgPicture.asset(
                    'assets/svg/logo.svg',
                    fit: BoxFit.contain,
                    height: h * 0.1,
                  ),
                ),
              ),

              6.toHeight,

              CustomText(
                text: 'Ciao',
                style: Theme.of(context).textTheme.headlineSmall,
                letterSpacing: 20,
              ),

              SizedBox(height: h * 0.04),

              // content
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: CustomText(
                    text: 'Sign Up',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),

              // user name
              CustomTextFormField(hintText: 'Full Name'),

              // email
              CustomTextFormField(hintText: 'Email'),

              // password
              CustomTextFormField(
                hintText: 'Password',
                obscureText: true,
                suffixChild: SizedBox(
                  height: 14,
                  width: 14,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/eye-slash.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // password
              CustomTextFormField(
                hintText: 'Confirm Password',
                obscureText: true,
                suffixChild: SizedBox(
                  height: 14,
                  width: 14,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/eye-slash.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (_) {}),
                    SizedBox(width: 2),
                    CustomText(
                      text: 'I Agree with',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 3),
                    GestureDetector(
                      onTap: () {},
                      child: CustomText(
                        text: 'Privacy',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 3),
                    CustomText(
                      text: 'and',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 3),
                    GestureDetector(
                      onTap: () {},
                      child: CustomText(
                        text: 'policy',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              20.toHeight,

              // button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppButton(onTap: () {}, title: 'Sign Up'),
              ),

              // footer text
              FooterText(
                text: "Already have an account ?",
                actiontext: 'Sign In',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
