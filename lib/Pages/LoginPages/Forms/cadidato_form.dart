import 'package:flutter/material.dart';

class CandidatoForm extends StatefulWidget {
  const CandidatoForm({super.key});

  @override
  State<CandidatoForm> createState() => _CandidatoFormState();
}

class _CandidatoFormState extends State<CandidatoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de cadastro de Candidatos'),
      ),
    );
  }
}
