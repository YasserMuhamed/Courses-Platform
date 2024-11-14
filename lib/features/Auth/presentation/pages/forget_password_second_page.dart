import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/helpers/app_regex.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/features/Auth/data/manager/forget_password_second_cubit/forget_password_otp_cubit.dart';
import 'package:courses_platform/features/Auth/data/models/forget_password_second_request.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ForgetPasswordSecondPage extends StatefulWidget {
  const ForgetPasswordSecondPage({super.key, required this.email});
  final String email;

  @override
  State<ForgetPasswordSecondPage> createState() =>
      _ForgetPasswordSecondPageState();
}

class _ForgetPasswordSecondPageState extends State<ForgetPasswordSecondPage> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController? otp1Controller = TextEditingController();
    // TextEditingController? otp2Controller = TextEditingController();
    // TextEditingController? otp3Controller = TextEditingController();
    // TextEditingController? otp4Controller = TextEditingController();
    // TextEditingController? otp5Controller = TextEditingController();
    // TextEditingController? otp6Controller = TextEditingController();

    final formKey = GlobalKey<FormState>();
    String otpCode = '';
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    PageController pageController = PageController(initialPage: 1);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 75.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      const Center(
                        child: SvgIcon(
                          path: 'assets/SVGs/mail-open.svg',
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Text(
                          'password-reset'.tr(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'we-sent-code'.tr(),
                            style: Theme.of(context).textTheme.labelSmall,
                            children: <TextSpan>[
                              TextSpan(
                                text: AppRegex.obfuscateEmail(widget.email),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
                OtpTextField(
                  numberOfFields: 6,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  borderColor: AppColors.lightGrey,
                  focusedBorderColor: AppColors.primaryColor,
                  styles: const [],
                  fieldWidth: 40.w,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  showFieldAsBox: false,
                  borderWidth: 4.0,
                  //runs when a code is typed in

                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    otpCode = verificationCode;
                  },
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      BlocConsumer<ForgetPasswordOtpCubit,
                          ForgetPasswordOtpState>(
                        listenWhen: (previous, current) =>
                            current is ForgetPasswordOTPSuccess ||
                            current is ForgetPasswordOTPFailure ||
                            current is ForgetPasswordOTPLoading,
                        listener: (context, state) {
                          if (state is ForgetPasswordOTPSuccess) {
                            if (state.status == true) {
                              ToastHelper().showSuccessToast(
                                  context, "otp-verified".tr());
                              GoRouter.of(context).push(
                                  AppRoutes.kForgetPasswordThirdPage,
                                  extra: ForgetPasswordSecondRequest(
                                      email: widget.email,
                                      code: int.parse(otpCode)));
                            } else {
                              ToastHelper().showErrorToast(
                                  context, "otp-incorrect".tr());
                            }
                          } else if (state is ForgetPasswordOTPFailure) {
                            ToastHelper()
                                .showErrorToast(context, "otp-incorrect".tr());
                          }
                        },
                        buildWhen: (previous, current) =>
                            current is ForgetPasswordOTPSuccess ||
                            current is ForgetPasswordOTPFailure ||
                            current is ForgetPasswordOTPLoading,
                        builder: (context, state) {
                          return MyButton(
                              text: (state is ForgetPasswordOTPLoading)
                                  ? "loading".tr()
                                  : "verify-otp".tr(),
                              onTap: () {
                                if (otpCode.length == 6) {
                                  ForgetPasswordSecondRequest request =
                                      ForgetPasswordSecondRequest(
                                    email: widget.email,
                                    code: int.parse(otpCode),
                                  );
                                  print(otpCode);
                                  context
                                      .read<ForgetPasswordOtpCubit>()
                                      .forgetPasswordOTP(request);
                                } else {
                                  ToastHelper().showErrorToast(
                                      context, "otp-incorrect".tr());
                                }
                              });
                        },
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go(AppRoutes.kLoginPage);
                  },
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
              ],
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
