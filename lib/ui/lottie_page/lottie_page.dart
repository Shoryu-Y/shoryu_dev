import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatelessWidget {
  const LottiePage({super.key});

  static const routePath = '/lottie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Lottie.asset('assets/lotties/chat_ind.json'),
      ),
    );
  }
}
