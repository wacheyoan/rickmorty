import 'dart:convert';

List<Location> postFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

class Location{
    final int id;
    final String name;
    final String type;
    final String dimension;

    const Location({
      required this.id,
      required this.name,
      required this.type,
      required this.dimension
    });

    factory Location.fromJson(Map<String, dynamic> json){
      return Location(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        dimension: json['dimension'],
      );
    }

}