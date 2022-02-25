import 'package:flutter/material.dart';
import 'package:rickmorty/main.dart';
import 'package:rickmorty/providers/Character.dart';
import 'package:rickmorty/providers/api.dart';
import 'package:rickmorty/ui/character/character.dart';

class HomePage extends State<MyApp> {
  late Future<List<Character>> futureCharacters;

  @override
  void initState() {
    super.initState();
    futureCharacters = fetchCharacters();
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
          child: FutureBuilder<List<Character>>(
            future: futureCharacters,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffffFFFF),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48), // Image radius
                            child: Image.network(snapshot.data![index].image,
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 32),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                                child: const Text("Voir"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CharacterPage(
                                              id: snapshot.data![index].id)));
                                })
                          ],
                        )
                      ]),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
