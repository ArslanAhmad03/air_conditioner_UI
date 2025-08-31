import 'package:air_conditioner_ui/screens/Auth/register_screen.dart';
import 'package:air_conditioner_ui/screens/app_route_screen.dart';
import 'package:air_conditioner_ui/utils/app_button.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';
import 'package:air_conditioner_ui/utils/app_text.dart';
import 'package:air_conditioner_ui/utils/app_text_feild.dart';
import 'package:air_conditioner_ui/utils/screen_size.dart';
import 'package:air_conditioner_ui/utils/sizedbox_extension.dart';
import 'package:air_conditioner_ui/widgets/footer_text.dart';
import 'package:air_conditioner_ui/widgets/social_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = ScreenSize.height(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    text: 'Log In',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),

              // user name
              CustomTextFormField(
                hintText: 'Username',
                prefixChild: SizedBox(
                  height: 14,
                  width: 14,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/user.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // user name
              CustomTextFormField(
                hintText: 'Passwrord',
                prefixChild: SizedBox(
                  height: 14,
                  width: 14,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/lock.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(value: false, onChanged: (_) {}),
                    Expanded(
                      child: CustomText(
                        text: 'Remember me',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CustomText(
                      text: 'Forgot password',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              20.toHeight,

              // button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppButton(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AppRouteScreen()),
                    );
                  },
                  title: 'Log In',
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: CustomText(
                    text: 'Or sign in with',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),

              // social
              SocialRow(),

              // footer text
              FooterText(
                text: "Don't have an account ?",
                actiontext: 'Sign Up',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
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
