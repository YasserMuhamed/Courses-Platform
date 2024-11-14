import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:courses_platform/features/Auth/data/manager/forget_password_first_cubit/forget_password_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  String email = '';
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
                    SizedBox(height: 75.h),
                    const Center(
                      child: SvgIcon(
                        path: 'assets/SVGs/fingerprint-solid.svg',
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        'forgot-password'.tr(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        "no-worries".tr(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "email".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10.h),
                    AppTextField(
                      onChange: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: AppValidators.emailValidator,
                      controller: emailController,
                      hintText: "enter-email".tr(),
                    ),
                    SizedBox(height: 14.h),
                    BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                      listenWhen: (previous, current) =>
                          current is ForgetPasswordSuccess ||
                          current is ForgetPasswordFailure ||
                          current is ForgetPasswordLoading,
                      listener: (context, state) {
                        if (state is ForgetPasswordSuccess) {
                          ToastHelper().showSuccessToast(
                              context, "reset-password-link-sent".tr());
                          GoRouter.of(context).push(
                              AppRoutes.kForgetPasswordSecondPage,
                              extra: email);
                        } else if (state is ForgetPasswordFailure) {
                          ToastHelper().showErrorToast(context, state.error);
                        }
                      },
                      builder: (context, state) {
                        return MyButton(
                            text: (state is ForgetPasswordLoading)
                                ? "loading".tr()
                                : "reset-password".tr(),
                            onTap: () {
                              if (forgetPasswordFormKey.currentState!
                                  .validate()) {
                                // GoRouter.of(context).push(
                                //     AppRoutes.kForgetPasswordSecondPage,
                                //     extra: email);
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .forgetPassword(email);
                              } else {
                                setState(() {
                                  autovalidateMode =
                                      AutovalidateMode.onUserInteraction;
                                });
                              }
                            });
                      },
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).go(AppRoutes.kLoginPage);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_rounded,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "back-to-login".tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 65.h,
        child: Center(
          child: SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                dotColor: Theme.of(context).colorScheme.secondary,
                activeDotColor: Theme.of(context).primaryColor,
                dotHeight: 10.h,
                dotWidth: 10.w,
                spacing: 4.w,
              ),
              controller: pageController,
              count: 3),
        ),
      ),
    );
  }
}
