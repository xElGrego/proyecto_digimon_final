// To parse this JSON data, do
//
//     final digimon = digimonFromJson(jsonString);

import 'dart:convert';

List<Digimon> digimonFromJson(String str) =>
    List<Digimon>.from(json.decode(str).map((x) => Digimon.fromJson(x)));

String digimonToJson(List<Digimon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Digimon {
  Digimon({
    this.name,
    this.img,
    this.level,
  });

  String name;
  String img;
  Level level;

  factory Digimon.fromJson(Map<String, dynamic> json) => Digimon(
        name: json["name"],
        img: json["img"],
        level: levelValues.map[json["level"]],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "level": levelValues.reverse[level],
      };
}

enum Level {
  IN_TRAINING,
  ROOKIE,
  CHAMPION,
  ULTIMATE,
  FRESH,
  MEGA,
  TRAINING,
  ARMOR
}

final levelValues = EnumValues({
  "Armor": Level.ARMOR,
  "Champion": Level.CHAMPION,
  "Fresh": Level.FRESH,
  "In Training": Level.IN_TRAINING,
  "Mega": Level.MEGA,
  "Rookie": Level.ROOKIE,
  "Training": Level.TRAINING,
  "Ultimate": Level.ULTIMATE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
