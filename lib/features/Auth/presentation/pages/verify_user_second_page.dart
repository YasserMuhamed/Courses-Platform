import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/helpers/app_regex.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/features/Auth/data/models/email_and_otp_model.dart';
import 'package:courses_platform/features/Auth/presentation/manager/verify_user_otp_cubit/verify_user_otp_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
// ignore: library_prefixes
import 'dart:ui' as UI;

UI.TextDirection direction = UI.TextDirection.ltr;

class VerifyUserSecondPage extends StatefulWidget {
  const VerifyUserSecondPage({super.key, required this.email});
  final String email;

  @override
  State<VerifyUserSecondPage> createState() => _VerifyUserSecondPageState();
}

class _VerifyUserSecondPageState extends State<VerifyUserSecondPage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String otpCode = '';
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                          'verify-email'.tr(),
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
                Directionality(
                  textDirection: direction,
                  child: OtpTextField(
                    numberOfFields: 6,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
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
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      BlocConsumer<VerifyUserOtpCubit, VerifyUserOtpState>(
                        listenWhen: (previous, current) =>
                            current is VerifyUserOtpSuccess ||
                            current is VerifyUserOtpFailure ||
                            current is VerifyUserOtpLoading,
                        listener: (context, state) {
                          if (state is VerifyUserOtpSuccess) {
                            if (state.message == "لا يوجد") {
                              ToastHelper().showErrorToast(
                                  context, "already-verified".tr());
                            } else {
                              ToastHelper().showSuccessToast(
                                  context, "otp-verified".tr());
                           
                              isVerified = true;
                              GoRouter.of(context).push(AppRoutes.kHomePage);
                            }
                          } else if (state is VerifyUserOtpFailure) {
                            ToastHelper()
                                .showErrorToast(context, "otp-incorrect".tr());
                          }
                        },
                        buildWhen: (previous, current) =>
                            current is VerifyUserOtpSuccess ||
                            current is VerifyUserOtpFailure ||
                            current is VerifyUserOtpLoading,
                        builder: (context, state) {
                          return MyButton(
                              text: (state is VerifyUserOtpLoading)
                                  ? "loading".tr()
                                  : "verify-otp".tr(),
                              onTap: () {
                                if (otpCode.length == 6) {
                                  EmailAndOtpModel request = EmailAndOtpModel(
                                    email: widget.email,
                                    code: int.parse(otpCode),
                                  );

                                  context
                                      .read<VerifyUserOtpCubit>()
                                      .verifyUser(request);
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
    );
  }
}
