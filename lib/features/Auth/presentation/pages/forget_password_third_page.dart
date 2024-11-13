import 'package:flutter/material.dart';

class ForgetPasswordThirdPage extends StatefulWidget {
  const ForgetPasswordThirdPage({super.key});

  @override
  State<ForgetPasswordThirdPage> createState() =>
      _ForgetPasswordThirdPageState();
}

class _ForgetPasswordThirdPageState extends State<ForgetPasswordThirdPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Forget Password Third Page'),
      ),
    );
  }
}
