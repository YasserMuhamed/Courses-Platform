import 'package:flutter/material.dart';

class AppColors {
  // Primary color: Main color for buttons, headers, and important highlights
  static const Color primaryColor = Color(0xFF0E64D2);

  // Bright Blue
  static const Color darkPrimaryColor =
      Color.fromARGB(255, 21, 89, 177); // Bright Blue
  static const Color darkerPrimaryColor =
      Color.fromARGB(255, 15, 61, 121); // Bright Blue

  // Secondary color: For secondary buttons, links, and other interactive elements
  static const Color secondaryColor = Color(0xFF007ACC); // Medium Blue

  // Background color: Main background color of the app in dark mode
  static const Color backgroundColor = Color(0xFF121212); // Dark Gray

  // Card background color: Background color for cards or content containers
  static const Color cardBackground =
      Color(0xFF1E1E1E); // Darker Gray for Cards

  // Light Gray: For borders, dividers, or subtle backgrounds
  static final Color lightGrey =
      Colors.grey.shade700; // Darker Gray for dark mode

  // Dark Gray: For secondary text, labels, and muted elements
  static const Color darkGrey = Color(0xFF888888);
  // Medium Dark Gray for text
  static const Color darkerGrey = Color.fromARGB(255, 71, 71, 71);
  // Accent Green: Success indicators, such as completed status or positive notifications
  static final Color accentGreen =
      Colors.green.shade400; // Lighter Green for contrast

  // Warning Color: For warnings, caution messages, or alerts
  static final Color warningColor = Colors.orange.shade400; // Lighter Orange

  // Error Color: For error messages, invalid inputs, or critical alerts
  static final Color errorColor = Colors.red.shade400; // Lighter Red

  // Disabled Color: For disabled buttons or inactive items
  static const Color disabledColor =
      Color(0xFF757575); // Dark Gray for disabled items

  // Text Color: Main color for text on dark backgrounds
  static const Color textColor =
      Color(0xFFE0E0E0); // Light Gray Text for readability

  // Alternative Text Color: For selected text or very important text highlights
  static const Color altTextColor =
      Color(0xFFFFFFFF); // White for high contrast
}
