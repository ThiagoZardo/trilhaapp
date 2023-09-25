import 'package:flutter/material.dart';

class DadosCadastraisPage extends StatelessWidget {
  final String texto;
  const DadosCadastraisPage({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: const Center(
        child: Text("Dados cadastrais"),
      ),
    );
  }
}
