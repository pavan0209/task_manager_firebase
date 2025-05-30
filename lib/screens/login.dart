import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:task_manager_firebase/screens/mixin/index.dart';
import 'package:task_manager_firebase/screens/widgets/button.dart';
import 'package:task_manager_firebase/screens/widgets/index.dart';
import 'package:task_manager_firebase/service/index.dart';
import 'package:task_manager_firebase/styles/index.dart';

@RoutePage()
class LoginPage extends BasePage {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> with BasicPage {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget body(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromRGBO(255, 223, 175, 1), Color.fromRGBO(184, 222, 255, 1)],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImageAssets.appLogo,
                      height: 80,
                    ),
                    const SizedBox(height: AppSpacing.standardSpacing),
                    Text('Login', style: AppStyles.blackTitleLargeTextStyle()),
                    const SizedBox(height: AppSpacing.standardSpacing),
                    Text('Enter your email and password to log in', style: AppStyles.greyBodySmallTextStyle()),
                    const SizedBox(height: AppSpacing.extraSpacing),
                    AppTextField(
                      controller: _emailController,
                      filled: true,
                      fillColor: AppColors.white,
                      hintText: 'email',
                      hintStyle: AppStyles.greyBodySmallTextStyle(),
                    ),
                    const SizedBox(height: AppSpacing.largeSpacing),
                    AppTextField(
                      controller: _passwordController,
                      filled: true,
                      fillColor: AppColors.white,
                      obscureText: isObscure,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: AppColors.grey,
                        ),
                      ),
                      hintText: 'password',
                      hintStyle: AppStyles.greyBodySmallTextStyle(),
                    ),
                    const SizedBox(height: AppSpacing.largeSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Password ?', style: AppStyles.blueBodySmallTextStyle()),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.largeSpacing),
                    AppElevatedButton(onPressed: () {}, label: 'Log In'),
                    const SizedBox(height: AppSpacing.largeSpacing),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: 'Don\'t have an account? ', style: AppStyles.greyBodySmallTextStyle()),
                          TextSpan(text: 'Sign Up', style: AppStyles.blueBodySmallTextStyle())
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.standardSpacing),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool isAppBarDisabled() => true;
}
