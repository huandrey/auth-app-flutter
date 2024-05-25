import 'package:auth_project/pages/home/components/home_content.dart';
import 'package:auth_project/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeContent());
  }
}
