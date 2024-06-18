import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeoFormComplete extends StatefulWidget {
  const GeoFormComplete({super.key});

  @override
  State<GeoFormComplete> createState() => _GeoFormCompleteState();
}

class _GeoFormCompleteState extends State<GeoFormComplete> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  Future<void> _getCurrentLocation() async {
    try {
      // Obtém a posição atual
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Obtém o endereço a partir da posição
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      // Preenche os campos do formulário com o endereço obtido
      setState(() {
        _streetController.text = place.street ?? '';
        _cityController.text = place.locality ?? '';
        _postalCodeController.text = place.postalCode ?? '';
        _countryController.text = place.country ?? '';
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _streetController,
              decoration: InputDecoration(labelText: 'Rua'),
            ),
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'Cidade'),
            ),
            TextFormField(
              controller: _postalCodeController,
              decoration: InputDecoration(labelText: 'Código Postal'),
            ),
            TextFormField(
              controller: _countryController,
              decoration: InputDecoration(labelText: 'País'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text('Preencher com minha localização'),
            ),
          ],
        ),
      ),
    );
  }
}
