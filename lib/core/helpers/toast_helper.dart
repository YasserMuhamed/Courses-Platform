import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:easy_localization/easy_localization.dart';

class ToastHelper {
  void showErrorToast(BuildContext context, String error) {
    Toastification().show(
      progressBarTheme: ProgressIndicatorThemeData(
        color: AppColors.errorColor,
      ),
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 5),
      context: context,
      title: Text('error'.tr()),
      description: Text(error),
      alignment: Alignment.topCenter,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      icon: const Icon(Icons.error),
      showIcon: true,
      primaryColor: Colors.red,
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.altTextColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        // ignore: avoid_debugPrint
        onTap: (toastItem) => debugPrint('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) =>
            debugPrint('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) =>
            debugPrint('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) =>
            debugPrint('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  void showSuccessToast(BuildContext context, String message) {
    Toastification().show(
      progressBarTheme: const ProgressIndicatorThemeData(
        color: AppColors.altTextColor,
      ),
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 5),
      context: context,
      title: Text('success'.tr()),
      description: Text(message),
      alignment: Alignment.topCenter,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      icon: const Icon(Icons.check),
      showIcon: true,
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.altTextColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => debugPrint('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) =>
            debugPrint('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) =>
            debugPrint('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) =>
            debugPrint('Toast ${toastItem.id} dismissed'),
      ),
    );
  }
}
