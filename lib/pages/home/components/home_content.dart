import 'package:auth_project/pages/home/home_controller.dart';
import 'package:auth_project/shared/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key});

  final HomeController controller = HomeController();
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Logged in! ${user!.email}'),
        const SizedBox(height: 16),
        MyButton(
          label: 'Sair do app!',
          onTap: controller.signOut,
        )
      ],
    );
  }
}
