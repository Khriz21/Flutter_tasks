import 'package:flutter/material.dart';

import '../ui/input_decoration.dart';
import 'package:my_tasks/screens/screens.dart';
import 'package:my_tasks/widgets/widtgets.dart';

class SigupScreen extends StatelessWidget {
  const SigupScreen({super.key});

  static const String routerName = 'sigup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('sigup')),
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
                        'Crear cuenta',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 30),
                      _SigupForm()
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

class _SigupForm extends StatefulWidget {
  @override
  State<_SigupForm> createState() => _SigupFormState();
}

class _SigupFormState extends State<_SigupForm> {
  final emaiCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final verifyPasswordCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final birthdateCtrt = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final loginForm = Provider.of<LoginProvider>(context);
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          // Name
          TextFormField(
            controller: nameCtrl,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.inputDecoration(
              icon: Icons.person_outline,
              hinText: 'Oscar',
              label: 'Nombre',
            ),
            validator: (value) {
              return (value != null && value.length >= 3)
                ? null
              : 'Debe escribir un nombre valideo';
            },
          ),

          // Last name
          TextFormField(
            controller: lastNameCtrl,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.inputDecoration(
              icon: Icons.person_outline,
              hinText: 'Herrera',
              label: 'Apellido/s',
            ),
            validator: (value) {
              return (value != null && value.length >= 3)
                ? null
              : 'Este campo es hobligatorio';
            },
          ),

          // Birthdate
          TextFormField(
            controller: birthdateCtrt,
            autocorrect: false,
            keyboardType: TextInputType.datetime,
            decoration: InputDecorations.inputDecoration(
              icon: Icons.calendar_month_outlined,
              hinText: '14/06/1999',
              label: 'Fecha de nacimiento',
            ),
            validator: (value) {
              String pattern = r'^(?:3[01]|[12][0-9]|0?[1-9])([\-/.])(0?[1-9]|1[1-2])\1\d{4}$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'Fecha no valida';
            },
          ),

          //? Email
          TextFormField(
            controller: emaiCtrl,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.inputDecoration(
              icon: Icons.mail_outline,
              hinText: 'pablito@gmail.com',
              label: 'Correo electrónico',
            ),
            validator: (value) {
              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'Correo no valido';
            },
          ),

          //? Password
          TextFormField(
            controller: passwordCtrl,
            obscureText: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.inputDecoration(
              icon: Icons.lock_outline,
              hinText: '****',
              label: 'Contraseña',
            ),
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
              : 'La contraña debe tener almenos 6 caracteres';
            },
          ),

          //? Verifycar la contraseña
          TextFormField(
            controller: verifyPasswordCtrl,
            obscureText: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.inputDecoration(
              icon: Icons.lock_outline,
              hinText: '****',
              label: 'Repita la contraña ',
            ),
            validator: (value) {
              if (value != passwordCtrl.text.trim()) {
                return 'La contraseña no coinside';
              }
              return (value != null && value.length >= 6)
                ? null
              : 'La contraña debe tener almenos 6 caracteres';
            },
          ),

          const SizedBox(height: 30),

          SaveButton(
            submit: saveUser,
            text: 'Guardar',
          ),
          const SizedBox(height: 10),

          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, LoginScreen.routerName),
            child: const Text('Ya tienes una cuenta?'),
          ),
        ],
      ),
    );
  }

  // Funcion para guardar el nuevo usuario
  Future<void> saveUser() async {
    if (_formKey.currentState?.validate() ?? false) {
      late String birthdate = birthdateCtrt.text.trim();
      birthdate = '${birthdate.substring(6, 10)}/${birthdate.substring(3, 6)}${birthdate.substring(0, 2)}';
      if (mounted) Navigator.pushReplacementNamed(context, HomeScreen.routerName);
    }
  }
}
