import 'package:courses_platform/features/Auth/presentation/widgets/bottom_slider.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/bottom_text_section.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/forget_password_first_page/email_section.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/forget_password_first_page/icon_with_text_section.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/forget_password_first_page/send_otp_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordFirstPage extends StatefulWidget {
  const ForgetPasswordFirstPage({super.key});

  @override
  State<ForgetPasswordFirstPage> createState() =>
      _ForgetPasswordFirstPageState();
}

class _ForgetPasswordFirstPageState extends State<ForgetPasswordFirstPage> {
  PageController pageController = PageController(initialPage: 0);
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: forgetPasswordFormKey,
            autovalidateMode: autovalidateMode,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconWithTextSection(),
                    EmailSection(emailController: emailController),
                    SizedBox(height: 14.h),
                    SendOTPButton(
                      emailController: emailController,
                      forgetPasswordFormKey: forgetPasswordFormKey,
                      setAutovalidateMode: (mode) {
                        setState(() {
                          autovalidateMode = mode;
                        });
                      },
                    ),
                    SizedBox(height: 10.h),
                    BottomTextSection()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomSlider(pageController: pageController),
    );
  }
}
