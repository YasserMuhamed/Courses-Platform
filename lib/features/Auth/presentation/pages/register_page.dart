import 'package:courses_platform/features/Auth/presentation/widgets/email_field.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/language_toggle.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/logo.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/password_field.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/register/already_have_account.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/register/confirm_password_field.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/register/name_field.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/register/phone_field.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/register/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscureText = true;
  bool obscureText2 = true;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        NameField(
                          nameController: nameController,
                        ),
                        SizedBox(height: 16.h),
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
                            }),
                        SizedBox(height: 16.h),
                        ConfirmPasswordField(
                            passwordController: passwordController,
                            obscureText: obscureText,
                            toggleObscureText: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            confirmPasswordController:
                                confirmPasswordController),
                        SizedBox(height: 16.h),
                        PhoneField(phoneController: phoneController),
                        SizedBox(height: 20.h),
                        RegisterButton(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                          nameController: nameController,
                          phoneController: phoneController,
                          autovalidateMode: autovalidateMode,
                          setAutovalidateMode: (mode) {
                            setState(() {
                              autovalidateMode = mode;
                            });
                          },
                        ),
                        SizedBox(height: 20.h),
                        AlreadyHaveAccount(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                        )
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
