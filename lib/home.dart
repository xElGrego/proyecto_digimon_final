import 'package:flutter/material.dart';
import 'package:proyecto_digimon_final/Digimon_Controller.dart';
import 'package:get/get.dart';
import 'package:proyecto_digimon_final/digimon_widget_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  final DigimonController digimonController = Get.put(DigimonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(Icons.rowing_outlined),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline_sharp),
            onPressed: () {
              //Cambiar tema de la app
              print("Estoy cambiando de tema");
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'GregoShop',
                    style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.view_quilt_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.check_box_outline_blank),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          //StaggeredGridView : Crea una matriz 2D desplazable de widgets de tamaños variables
          // con un número fijo de teselas en el eje transversal que se crean a petición.
          //Este constructor es adecuado para las vistas de cuadrícula con un número grande
          //(o infinito) de elementos secundarios porque se llama al generador solo para los
          //elementos secundarios que son realmente visible
          Expanded(
            child: Obx(
              () {
                if (digimonController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: digimonController.digimonList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return (CardDigimon(digimonController.digimonList[index]));
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
