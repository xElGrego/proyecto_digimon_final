import 'package:flutter/material.dart';
import 'package:proyecto_digimon_final/digimon.dart';
import 'package:get/get.dart';

class CardDigimon extends StatelessWidget {
  final Digimon digimon;
  const CardDigimon(this.digimon);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      digimon.img.obs.value,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Text(
                digimon.name.obs.value,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w800,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      digimon.level.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      );
    });
  }
}
