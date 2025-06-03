import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_firebase/model/index.dart';

import 'package:task_manager_firebase/screens/mixin/index.dart';
import 'package:task_manager_firebase/screens/widgets/index.dart';
import 'package:task_manager_firebase/service/index.dart';
import 'package:task_manager_firebase/styles/index.dart';

@RoutePage()
class RegisterPage extends BasePage {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage> with BasicPage {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _auth = AuthService();

  bool isObscure = true;

  @override
  Widget body(BuildContext context) {
    final router = AutoRouter.of(context);

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 215, 155, 1),
              Color.fromRGBO(184, 222, 255, 1),
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
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
                children: [
                  Image.asset(AppImageAssets.appLogo, height: 80),
                  const SizedBox(height: AppSpacing.standardSpacing),
                  Text('Sign Up', style: AppStyles.blackTitleLargeTextStyle()),
                  const SizedBox(height: AppSpacing.standardSpacing),
                  Text(
                    'Create an account to continue!',
                    style: AppStyles.greyBodySmallTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.extraSpacing),

                  // Email Field
                  AppTextField(
                    controller: _emailController,
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: 'email',
                    hintStyle: AppStyles.greyBodySmallTextStyle(),
                    prefixIcon: Icon(Icons.email_outlined, color: AppColors.blue),
                  ),
                  const SizedBox(height: AppSpacing.largeSpacing),

                  // Password Field
                  AppTextField(
                    controller: _passwordController,
                    filled: true,
                    fillColor: AppColors.white,
                    obscureText: isObscure,
                    obscuringCharacter: '*',
                    hintText: 'password',
                    hintStyle: AppStyles.greyBodySmallTextStyle(),
                    prefixIcon: Icon(Icons.lock_outline, color: AppColors.blue),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() => isObscure = !isObscure),
                      child: Icon(
                        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.extraSpacing),

                  AppElevatedButton(
                    onPressed: () async {
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();

                      final result = await _auth.registerWithEmailAndPassword(email, password);

                      if (mounted) {
                        // Check if the widget is still part of the widget tree
                        if (result is UserModel) {
                          AppToast.showSuccess(context, "Verification email sent. Please check your inbox.");
                          router.replaceNamed('/');
                        } else if (result is String) {
                          AppToast.showError(context, result);
                        }
                      }
                    },
                    label: 'Register',
                  ),

                  const SizedBox(height: AppSpacing.largeSpacing),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Already have an account? ', style: AppStyles.greyBodySmallTextStyle()),
                        TextSpan(
                          text: 'Login',
                          style: AppStyles.blueBodySmallTextStyle(),
                          recognizer: TapGestureRecognizer()..onTap = () => router.replaceNamed('/'),
                        ),
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
    );
  }

  @override
  bool isAppBarDisabled() => true;
}
