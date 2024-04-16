import 'package:flutter/material.dart';

class EmpresaPerfil extends StatefulWidget {
  final String usuarioEmpresa;

  const EmpresaPerfil({super.key, required this.usuarioEmpresa});

  @override
  State<EmpresaPerfil> createState() => _EmpresaPerfilState();
}

class _EmpresaPerfilState extends State<EmpresaPerfil> {
  late String usuarioEmpresa;

  @override
  void initState() {
    usuarioEmpresa = widget.usuarioEmpresa;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil da Empresa'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 73, 105, 131),
            Color.fromARGB(255, 126, 91, 172)
          ]),
        ),
        child: Form(
            child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.asset(
                'assets/images/fotoplaceholder2.png',
                fit: BoxFit.cover,
                width: 180,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                controller: TextEditingController(
                  text: usuarioEmpresa,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nome da Empresa',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
