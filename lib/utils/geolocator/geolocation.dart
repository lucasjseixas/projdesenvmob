import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está habilitado.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Serviço de localização não habilitado, não pode continuar.
      return Future.error('Servicos de localizacao desabilitados');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissão negada, não pode continuar.
        return Future.error('Permissao de localizacao negada');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissão negada para sempre, não pode continuar.
      return Future.error('Permissoes sempre negadas.');
    }

    // Quando a permissão está garantida, retorna a localização atual.
    return await Geolocator.getCurrentPosition();
  }
}
