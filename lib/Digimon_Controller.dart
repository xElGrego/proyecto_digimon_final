import 'package:proyecto_digimon_final/digimon.dart';
import 'package:proyecto_digimon_final/services.dart';
import 'package:get/get.dart';

class DigimonController extends GetxController {
  var isLoading = true.obs;
  var digimonList = List<Digimon>().obs;

  @override
  void onInit() {
    fetchDigimons();
    super.onInit();
  }

  void fetchDigimons() async {
      try {
      isLoading(true);
      var digimons = await RemoteServices.fetchDigimons();
      if (digimons != null) {
        digimonList = digimons.obs;
      }
    } finally {
      isLoading(false);
    }
  }
}
