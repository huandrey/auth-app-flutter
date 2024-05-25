import 'package:auth_project/pages/login/components/square_tile.dart';
import 'package:auth_project/pages/register/register_controller.dart';
import 'package:auth_project/services/auth_service.dart';
import 'package:auth_project/shared/my_button.dart';
import 'package:auth_project/shared/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterContent extends StatelessWidget {
  Function() onLogin;
  RegisterContent({
    super.key,
    required this.onLogin,
  });

  AuthService auth = AuthService();
  RegisterController controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(children: [
          // logo
          const SizedBox(height: 46),
          const Icon(
            Icons.lock,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 32),

          // welcome, where you being?
          Text(
            'Legal! Vamos criar uma conta pra você ;)',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),

          // textfield for email
          // textfield for password
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextField(
                  controller: controller.emailController,
                  onChanged: controller.setEmail,
                  hintText: 'Email',
                ),
                const SizedBox(height: 12),
                MyTextField(
                  controller: controller.passwordController,
                  onChanged: controller.setPassword,
                  hintText: 'Senha',
                ),
                const SizedBox(height: 12),
                MyTextField(
                  controller: controller.confirmPasswordController,
                  onChanged: controller.setConfirmPassword,
                  hintText: 'Confirme a senha',
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 32.0,
          ),
          // signin button
          MyButton(
            label: 'Cadastrar',
            onTap: () => controller.register(context),
          ),

          // or continue with this two options below,
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Ou continue com',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 0.5,
                  ),
                ),
              ],
            ),
          ),
          // google and apple signin button

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(
                onTap: auth.signWithGoogle(),
                imagePath: 'lib/assets/images/google.webp',
              ),
              const SizedBox(
                width: 24,
              ),
              SquareTile(
                imagePath: 'lib/assets/images/apple.png',
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          // not a member yet? register here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Já possui uma conta?',
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              InkWell(
                onTap: onLogin,
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
