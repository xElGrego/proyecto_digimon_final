import 'package:http/http.dart' as http;
import 'package:proyecto_digimon_final/digimon.dart';

class RemoteServices {
  //http.Client La interfaz para clientes HTTP que se encargan de mantener conexiones
  // persistentes a través de varias solicitudes al mismo servidor.

  //Static quiere decir que esa variable no cambiará su valor.
  static var client = http.Client();

  static Future<List<Digimon>> fetchDigimons() async {
    //Estamos obteniendo la respuesta de la pagina web
    var response =
        await client.get('https://digimon-api.vercel.app/api/digimon');

    //statuscode == 200
    //El status code 200 es un código de estado que nos dice que la petición que
    //acabamos de hacer ha sido entendida, enviada y recibida.
    if (response.statusCode == 200) {
      var jsonstring = response.body;
      print("Conexion exitosa!!!");
      return digimonFromJson(jsonstring);
    } else {
      print('Error Ñaño está mal la dirección');
      return null;
    }
  }
}