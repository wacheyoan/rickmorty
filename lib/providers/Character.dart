import 'dart:convert';
import 'dart:developer';
import 'package:rickmorty/providers/Location.dart';
import 'package:rickmorty/providers/api.dart';

List<Character> postFromJson(String str) =>
    List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

class Character{
    final int id;
    final String name;
    final String status;
    final String species;
    final String type;
    final String gender;
    final String image;
    final String? originName;
    final String? locationName;
    final String? originId;
    final String? locationId;


    const Character({
      required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.gender,
      required this.type,
      required this.image,
      this.originName,
      this.locationName,
      this.originId,
      this.locationId
    });

    factory Character.fromJson(Map<String, dynamic> json){

      var originName = json['origin'].entries.toList()[0].value;
      var locationName = json['location'].entries.toList()[0].value;
      var originId = json['origin'].entries.toList()[1].value.split('/').last;
      var locationId = json['location'].entries.toList()[1].value.split('/').last;


      return Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        image: json['image'],
        originName: originName,
        locationName: locationName,
        originId: originId,
        locationId: locationId
      );
    }

}