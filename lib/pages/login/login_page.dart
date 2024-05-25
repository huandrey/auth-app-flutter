import 'package:auth_project/pages/login/components/login_content.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Function() onRegister;

  LoginPage({
    super.key,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: LoginContent(onRegister: onRegister),
    );
  }
}
