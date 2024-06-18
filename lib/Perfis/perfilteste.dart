import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projec1/pages/home_page.dart';
import 'package:projec1/providers/anuncio_provider.dart';
import 'package:projec1/utils/geolocator/testeformgeolocation.dart';
import 'package:projec1/utils/imagepicker/imagepicker.dart';
import 'package:provider/provider.dart';

class PerfilTeste extends StatefulWidget {
  const PerfilTeste({super.key});

  @override
  State<PerfilTeste> createState() => _PerfilTesteState();
}

class _PerfilTesteState extends State<PerfilTeste> {
  String? email = FirebaseAuth.instance.currentUser!.email;
  final TextEditingController _nomeanunciocontroller = TextEditingController();
  final TextEditingController _descricaoanunciocontroller =
      TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isEditing = false;
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  //File? _pickedImage;
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery); // .gallery ou .camera
    setState(() {
      _image = img;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Imagem adicionada com sucesso!',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERFIL TESTE'),
        actions: [
          IconButton(
              onPressed: () async {
                if (isEditing) {
                  await FirebaseFirestore.instance
                      .collection('Candidatos')
                      .doc(userId)
                      .update({
                    'nome': _nomeController.text,
                    'email': _emailController.text,
                  });
                }
                setState(() {
                  isEditing = !isEditing;
                });
              },
              icon: Icon(isEditing ? Icons.save : Icons.edit))
        ],
      ),
      body: Center(
        child: Column(children: [
          Stack(
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/340px-Default_pfp.svg.png'),
                    ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: () {
                    selectImage();
                  },
                  icon: const Icon(Icons.add_a_photo),
                ),
              ),
            ],
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Candidatos')
                .where('email', isEqualTo: email)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erro: ${snapshot.error}'),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('Nenhum dado encontrado para este usuário.'),
                );
              }
              var userData =
                  snapshot.data!.docs[0].data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nome:', style: TextStyle(fontSize: 18)),
                    TextField(
                      controller: TextEditingController(text: userData['nome']),
                      readOnly: !isEditing,
                    ),
                    const SizedBox(height: 16),
                    const Text('Email:', style: TextStyle(fontSize: 18)),
                    TextField(
                      controller:
                          TextEditingController(text: userData['email']),
                      readOnly: !isEditing,
                    ),
                  ],
                ),
              );
            },
          ),
          ElevatedButton.icon(
            onPressed: () async {
              _displayTextInputDialog();
            },
            label: const Text('ADICIONAR ANUNCIO'),
            icon: const Icon(Icons.save),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TesteFormGeolocation()));
              },
              child: Text('Formulario Extra'))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          // Excluir conta do Firestore
          await FirebaseFirestore.instance
              .collection('Candidatos')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .delete();

          // Excluir conta do Firebase Auth
          await FirebaseAuth.instance.currentUser!.delete();

          // Navegar de volta para a tela de login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        tooltip: 'Excluir Conta',
        child: const Icon(Icons.delete),
      ),
    );
  }

  void _displayTextInputDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Adicione um Anuncio'),
            content: SizedBox(
              width: 300,
              height: 300,
              child: Column(
                children: [
                  TextField(
                    controller: _nomeanunciocontroller,
                    decoration: const InputDecoration(hintText: "Nome"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextField(
                      controller: _descricaoanunciocontroller,
                      decoration: const InputDecoration(hintText: "Descrição"),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  final nome = _nomeanunciocontroller.text;
                  final descricao = _descricaoanunciocontroller.text;
                  if (nome.isNotEmpty && descricao.isNotEmpty) {
                    Provider.of<AnuncioProvider>(context, listen: false)
                        .adicionaAnuncio(nome, descricao);
                    Navigator.of(context).pop;
                    _nomeanunciocontroller.clear();
                    _descricaoanunciocontroller.clear();
                  }
                },
              ),
            ],
          );
        });
  }

  // Future<void> _pickImage() async {
  //   if (!kIsWeb) {
  //     final ImagePicker _picker = ImagePicker();
  //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var selected = File(image.path);
  //       setState(() {
  //         _pickedImage = selected;
  //       });
  //     } else {
  //       print('Nenhuma imagem foi selecionada');
  //     }
  //   } else if (kIsWeb) {
  //     final ImagePicker _picker = ImagePicker();
  //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       var f = await image.readAsBytes();
  //       setState(() {
  //         webImage = f;
  //         _pickedImage = File('a');
  //       });
  //     } else {
  //       print('Nenhuma imagem foi selecionada');
  //     }
  //   } else {
  //     print('retorno image errado');
  //   }
  // }
}
