import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rickmorty/main.dart';
import 'package:rickmorty/providers/Character.dart';
import 'package:rickmorty/providers/api.dart';

class CharacterPage extends StatefulWidget {
  CharacterPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<StatefulWidget> createState() => CharacterState();
}

class CharacterState extends State<CharacterPage> {
  late Future<Character> futureCharacter;

  void initState() {
    futureCharacter = fetchCharacter(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Liste des personnages de rick & morty',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Liste des personnages de rick & morty'),
          ),
          body: Center(
              child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Revenir en arrière'),
              ),
              FutureBuilder<Character>(
                future: futureCharacter,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: const Color(0xffffFFFF),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(children: [
                            Image.network(snapshot.data!.image),
                            Text("Nom : ${snapshot.data!.name}"),
                            Text("Statut : ${snapshot.data!.status}"),
                            Text("Espèce : ${snapshot.data!.species}"),
                            Text("Type : ${snapshot.data!.type}"),
                            Text("Genre : ${snapshot.data!.gender}"),
                            ElevatedButton(
                                child: Text("${snapshot.data!.originName}"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CharacterPage(id: 1)));
                                }),
                            ElevatedButton(
                                child: Text("${snapshot.data!.locationName}"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CharacterPage(id: 1)));
                                })
                          ])),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          )),
        ));
  }
}
