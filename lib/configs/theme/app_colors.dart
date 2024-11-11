import 'package:flutter/material.dart';

class AppColors {
  // Primary color: Main color for buttons, headers, and important highlights
  static const Color primaryColor = Color(0xFF0E64D2); // Bright Blue

  // Secondary color: For secondary buttons, links, and other interactive elements
  static const Color secondaryColor = Color(0xFF007ACC); // Medium Blue

  // Background color: Main background color of the app in light mode
  static const Color backgroundColor = Color(0xFFFFFFFF); // White

  // Card background color: Background color for cards or content containers
  static const Color cardBackground = Color(0xFFF5F5F5); // Light Gray for Cards

  // Light Gray: For borders, dividers, or subtle backgrounds
  static final Color lightGrey = Colors.grey.shade300; // Light Gray for light mode

  // Dark Gray: For secondary text, labels, and muted elements
  static const Color darkGrey = Color(0xFF888888); // Medium Dark Gray for text

  // Accent Green: Success indicators, such as completed status or positive notifications
  static final Color accentGreen = Colors.green.shade600; // Darker Green for contrast

  // Warning Color: For warnings, caution messages, or alerts
  static final Color warningColor = Colors.orange.shade600; // Darker Orange

  // Error Color: For error messages, invalid inputs, or critical alerts
  static final Color errorColor = Colors.red.shade600; // Darker Red

  // Disabled Color: For disabled buttons or inactive items
  static const Color disabledColor = Color(0xFFBDBDBD); // Light Gray for disabled items

  // Text Color: Main color for text on light backgrounds
  static const Color textColor = Color(0xFF212121); // Dark Gray Text for readability

  // Alternative Text Color: For selected text or very important text highlights
  static const Color altTextColor = Color(0xFF000000); // Black for high contrast
}
