import 'package:courses_platform/features/Auth/presentation/widgets/email_field.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/login/forgot_password.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/language_toggle.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/login/login_button.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/login/sign_up_text.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/logo.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController emailController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailController.text = "yassoo.ommah@gmail.com";
    passwordController.text = "000123456";
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LanguageToggle(),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView(
                      children: [
                        const Logo(),
                        SizedBox(height: 26.h),
                        EmailField(
                          emailController: emailController,
                        ),
                        SizedBox(height: 16.h),
                        PasswordField(
                          passwordController: passwordController,
                          obscureText: obscureText,
                          toggleObscureText: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: ForgotPasswordText(),
                        ),
                        SizedBox(height: 20.h),
                        LoginButton(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                          autovalidateMode: autovalidateMode,
                          setAutovalidateMode: (mode) {
                            setState(() {
                              autovalidateMode = mode;
                            });
                          },
                        ),
                        SizedBox(height: 20.h),
                        const SignUpText(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
