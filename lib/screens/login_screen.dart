import 'package:flutter/material.dart';
import 'package:my_tasks/screens/sigup_screen.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../ui/input_decoration.dart';
import 'package:my_tasks/screens/screens.dart';
import 'package:my_tasks/widgets/card_container.dart';
import 'package:my_tasks/widgets/witgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routerName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Iniciar sesión',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 30),
                      _LoginForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginProvider>(context);
    return Form(
      key: key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          //? Email
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.inputDecoration(
              icon: Icons.mail_outline,
              hinText: 'pablito@gmail.com',
              label: 'Correo electrónico',
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);

              return regExp.hasMatch(value ?? '') ? null : 'Correo no valido';
            },
          ),

          //? Password
          TextFormField(
            obscureText: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.inputDecoration(
              icon: Icons.lock_outline,
              hinText: '****',
              label: 'Contraseña',
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraña debe tener almenos 6 caracteres';
            },
          ),

          const SizedBox(height: 30),

          _Button(loginForm: loginForm),

          const SizedBox(height: 10),

          TextButton(
            onPressed: ()=> Navigator.pushReplacementNamed(context, SigupScreen.routerName),
            child: const Text('No tienes cuenta?'),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.loginForm,
  }) : super(key: key);

  final LoginProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Colors.deepPurple,
      onPressed: loginForm.isLoading
          ? null
          : () async {
              FocusScope.of(context).unfocus();

              if (!loginForm.isValidForm()) return;

              loginForm.isLoading = true;

              await Future.delayed(
                const Duration(seconds: 2),
              );

              loginForm.isLoading = false;

              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(
                context,
                HomeScreen.routerName,
              );
            },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 15,
        ),
        child: Text(
          loginForm.isLoading ? 'Espere' : 'Ingresar',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
