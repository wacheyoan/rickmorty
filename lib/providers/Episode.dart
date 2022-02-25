import 'dart:convert';

List<Episode> postFromJson(String str) =>
    List<Episode>.from(json.decode(str).map((x) => Episode.fromJson(x)));

class Episode{
    final int id;
    final String name;
    final String airDate;
    final String code;

    const Episode({
      required this.id,
      required this.name,
      required this.airDate,
      required this.code,
    });

    factory Episode.fromJson(Map<String, dynamic> json){
      return Episode(
        id: json['id'],
        name: json['name'],
        airDate: json['air_date'],
        code: json['episode'],
      );
    }

}