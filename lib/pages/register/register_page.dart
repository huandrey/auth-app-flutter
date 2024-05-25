import 'package:auth_project/pages/register/components/register_content.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  Function() onLogin;
  RegisterPage({
    super.key,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: RegisterContent(onLogin: onLogin),
    );
  }
}
