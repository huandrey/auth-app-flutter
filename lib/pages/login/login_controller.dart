import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  get email => emailController.text;
  get password => _passwordController.text;
  get confirmPassword => _confirmPasswordController.text;
  void setEmail(String value) => emailController.text = value;
  void setPassword(String value) => _passwordController.text = value;
  void setConfirmPassword(String value) => confirmPassword.text = value;
  get emailController => _emailController;
  get passwordController => _passwordController;
  get confirmPasswordController => _confirmPasswordController;
  get isPasswordValid => password == confirmPassword;

  void createAccount(BuildContext context) async {
    
  }

  void signIn(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  bool _isPasswordValid() => password == confirmPassword;
}
