import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [_PurpleBox(), _HeaderIcon(), child],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //? Instancia de tamagno de la pantalla
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      // Usamos *0.4 para usar el 40% de la pantalla
      height: size.height * 0.4,
      decoration: _buildDecoration(),
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: _Buggle()),
          Positioned(top: -40, left: -30, child: _Buggle()),
          Positioned(top: -50, right: -20, child: _Buggle()),
          Positioned(bottom: -40, left: 50, child: _Buggle()),
          Positioned(bottom: 70, right: 90, child: _Buggle()),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1)
          ],
        ),
      );
}

class _Buggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
