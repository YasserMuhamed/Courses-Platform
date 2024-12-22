import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/core/constants/assets.dart';
import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:courses_platform/features/Auth/presentation/manager/verify_user_email_cubit/verify_user_email_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerifyUserFirstPage extends StatefulWidget {
  const VerifyUserFirstPage({super.key});

  @override
  State<VerifyUserFirstPage> createState() => _VerifyUserFirstPageState();
}

class _VerifyUserFirstPageState extends State<VerifyUserFirstPage> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> verifyUserKey = GlobalKey<FormState>();
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
            key: verifyUserKey,
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
                        path: Assets.assetsSVGsFingerprintSolid,
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
                      child: Text(
                        "no-worries-verify".tr(),
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
                    BlocConsumer<VerifyUserEmailCubit, VerifyUserEmailState>(
                      listenWhen: (previous, current) =>
                          current is VerifyUserEmailLoading ||
                          current is VerifyUserEmailSuccess ||
                          current is VerifyUserEmailFailure,
                      listener: (context, state) {
                        if (state is VerifyUserEmailSuccess) {
                          ToastHelper().showSuccessToast(
                              context, "verify-email-sent".tr());
                          GoRouter.of(context)
                              .push(AppRoutes.kVerifySecondPage, extra: email);
                        } else if (state is VerifyUserEmailFailure) {
                          ToastHelper().showErrorToast(context, state.error);
                        }
                      },
                      builder: (context, state) {
                        return MyButton(
                            text: (state is VerifyUserEmailLoading)
                                ? "loading".tr()
                                : "verify".tr(),
                            onTap: () {
                              if (verifyUserKey.currentState!.validate()) {
                                BlocProvider.of<VerifyUserEmailCubit>(context)
                                    .verifyUser(email);
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
    );
  }
}
