import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickmorty/providers/Episode.dart';
import 'package:rickmorty/providers/Location.dart';
import '../providers/Character.dart';

Future<List<Character>> fetchCharacters() async{
  final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body);
    return parsed.entries.toList()[1].value.map<Character>((json) => Character.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album'); 
  }
}

Future<Character> fetchCharacter(int id) async{
  final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/' + id.toString()));
  if (response.statusCode == 200) {
    return  Character.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album'); 
  }
}

Future<List<Location>> fetchLocations() async{
  final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/location'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body);
    return parsed.entries.toList()[1].value.map<Location>((json) => Location.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album'); 
  }
}

Future<Location> fetchLocation(int id) async{
  final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/location/' + id.toString()));
  if (response.statusCode == 200) {
    return Location.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album'); 
  }
}

Future<List<Episode>> fetchEpisodes() async{
  final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/episode'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body);
    return parsed.entries.toList()[1].value.map<Episode>((json) => Episode.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album'); 
  }
}

Future<Episode> fetchEpisode(int id) async{
  final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/episode/' + id.toString()));
  if (response.statusCode == 200) {
    return  Episode.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album'); 
  }
}