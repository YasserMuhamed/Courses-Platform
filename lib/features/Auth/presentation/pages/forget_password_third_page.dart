import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:courses_platform/features/Auth/data/models/email_and_otp_model.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/bottom_slider.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/bottom_text_section.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/forget_password_third_page/icon_with_text_section.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/forget_password_third_page/password_fields.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/forget_password_third_page/reset_password_confirmation_button.dart';

class ForgetPasswordThirdPage extends StatefulWidget {
  const ForgetPasswordThirdPage({
    super.key,
    required this.request,
  });
  final EmailAndOtpModel request;
  @override
  State<ForgetPasswordThirdPage> createState() =>
      _ForgetPasswordThirdPageState();
}

class _ForgetPasswordThirdPageState extends State<ForgetPasswordThirdPage> {
  GlobalKey<FormState> confirmNewPasswordFormKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;

  PageController pageController = PageController(initialPage: 2);
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: confirmNewPasswordFormKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconWithTextSection3(),
                  SizedBox(height: 30.h),
                  PasswordFields(
                    passwordController: passwordController,
                    passwordConfirmationController:
                        passwordConfirmationController,
                    isObscure: isObscure,
                    toggleObscure: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  SizedBox(height: 30.h),
                  ResetPasswordConfirmButton(
                    confirmNewPasswordFormKey: confirmNewPasswordFormKey,
                    widget: widget,
                    passwordController: passwordController,
                    setAutoValidateMode: (value) {
                      autovalidateMode = value;
                    },
                  ),
                  SizedBox(height: 10.h),
                  BottomTextSection()
                ],
              ),
            ),
          ),
        ),
      )),
      bottomNavigationBar: BottomSlider(pageController: pageController),
    );
  }
}
