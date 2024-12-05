import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "change-language".tr(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        DropdownButton<Locale>(
          onChanged: (Locale? locale) {
            if (locale != null) {
              context.setLocale(locale);
            }
          },
          value: context.locale,
          items: [
            DropdownMenuItem(
              value: const Locale('en'),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("English",
                    style: Theme.of(context).textTheme.labelMedium),
              ),
            ),
            DropdownMenuItem(
              value: const Locale('ar'),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("العربية",
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          ],
          icon: Icon(Icons.language, color: Theme.of(context).iconTheme.color),
          underline: Container(
            height: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
