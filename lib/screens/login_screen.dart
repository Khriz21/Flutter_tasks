import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../ui/input_decoration.dart';
import 'package:my_tasks/screens/screens.dart';
import 'package:my_tasks/screens/sigup_screen.dart';
import 'package:my_tasks/widgets/widtgets.dart';

import '../ui/show_alert.dart';

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
                        style: Theme.of(context).textTheme.headlineMedium,
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

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordlCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final autProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
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
            controller: emailCtrl,
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
            controller: passwordlCtrl,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraña debe tener almenos 6 caracteres';
            },
          ),

          const SizedBox(height: 30),

          SaveButton(
            text: autProvider.authenticating ? 'Espere' : 'Ingresar',
            submit:
                autProvider.authenticating ? null : () => submit(autProvider),
          ),

          const SizedBox(height: 10),

          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, SigupScreen.routerName),
            child: const Text('No tienes cuenta?'),
          ),
        ],
      ),
    );
  }

  Future<void> submit(AuthProvider autProvider) async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    final msg = await autProvider.login(
      emailCtrl.text.trim(),
      passwordlCtrl.text.trim(),
    );

    if (msg != null) {
      if (!mounted) return;
      showAlert(context, 'Error', msg);
      return;
    }

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, HomeScreen.routerName);
  }
}
