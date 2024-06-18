import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projec1/utils/geolocator/geolocation.dart';

class TesteFormGeolocation extends StatefulWidget {
  const TesteFormGeolocation({super.key});

  @override
  State<TesteFormGeolocation> createState() => _TesteFormGeolocationState();
}

class _TesteFormGeolocationState extends State<TesteFormGeolocation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  void _fillFormWithCurrentLocation() async {
    LocationService locationService = LocationService();
    try {
      Position position = await locationService.getCurrentLocation();
      setState(() {
        _latitudeController.text = position.latitude.toString();
        _longitudeController.text = position.longitude.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste de form geo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _latitudeController,
                decoration: const InputDecoration(labelText: 'Latitude'),
                readOnly: true,
              ),
              TextFormField(
                controller: _longitudeController,
                decoration: const InputDecoration(labelText: 'Longitude'),
                readOnly: true,
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: _fillFormWithCurrentLocation,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process data.
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
