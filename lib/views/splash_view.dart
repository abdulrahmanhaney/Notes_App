import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/views/notes_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static String id = 'SplashView';

  @override
  Widget build(BuildContext context) {
    Future.delayed(
    const Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, NotesView.id);
      },
    );
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie/lottie_note.json',
          repeat: false,
        ),
      ),
    );
  }
}
