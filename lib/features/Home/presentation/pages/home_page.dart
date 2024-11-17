import 'package:courses_platform/configs/localization/localization_service.dart';
import 'package:courses_platform/configs/router/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("info".tr()),
        actions: [
          IconButton(
            onPressed: () {
              LocalizationService().toggleLocale(context);
            },
            icon: const Icon(Icons.language),
          ),
          IconButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoutes.kLoginPage);
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}
