import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void setEmail(String value) => emailController.text = value;
  void setPassword(String value) => passwordController.text = value;
  void setConfirmPassword(String value) =>
      confirmPasswordController.text = value;

  void register(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    if (passwordController.text != confirmPasswordController.text) {
      handleLoginError(context, 'As senhas precisam ser iguais');
      Navigator.pop(context);
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        handleLoginError(context, e.code);
      }
    } finally {
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  void handleLoginError(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey.shade200,
        content: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Tente novamente',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
