import 'package:flutter/material.dart';
import 'package:projec1/utils/dropdownmenu.dart';

class CandidatoForm extends StatefulWidget {
  const CandidatoForm({super.key});

  @override
  State<CandidatoForm> createState() => _CandidatoFormState();
}

class _CandidatoFormState extends State<CandidatoForm> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de cadastro de Candidatos'),
      ),
      body: Column(
        children: [
          TextFormField(
            key: const Key('nomecandidato'),
            decoration: const InputDecoration(labelText: 'Nome Completo'),
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            key: const Key('enderecocandidato'),
            decoration: const InputDecoration(labelText: 'Endereco Completo'),
            keyboardType: TextInputType.streetAddress,
          ),
          TextFormField(
            controller: _dateController,
            key: const Key('datanascimentocandidato'),
            decoration: const InputDecoration(
              labelText: 'Data de Nascimento',
              prefixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            onTap: () {
              _selectDate();
            },
          ),
          TextFormField(
            key: const Key('emailcandidato'),
            decoration: const InputDecoration(labelText: 'E-mail'),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            key: const Key('confirmaremailcandidato'),
            decoration: const InputDecoration(labelText: 'Confirme o E-Mail'),
            keyboardType: TextInputType.emailAddress,
          ),
          const Text('Estado'),
          const DropDownMenu(),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2006),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(
        () {
          _dateController.text = _picked.toString().split(" ")[0];
        },
      );
    }
  }
}
