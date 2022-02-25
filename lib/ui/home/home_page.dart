import 'package:flutter/material.dart';
import 'package:rickmorty/main.dart';
import 'package:rickmorty/providers/Character.dart';
import 'package:rickmorty/providers/Episode.dart';
import 'package:rickmorty/providers/Location.dart';
import 'package:rickmorty/providers/api.dart';
import 'package:rickmorty/ui/character/character.dart';
import 'package:rickmorty/ui/location/location.dart';

class HomePage extends State<MyApp> {
  late Future<List<Character>> futureCharacters;
  late Future<List<Location>> futureLocations;
  late Future<List<Episode>> futureEpisodes;

  @override
  void initState() {
    super.initState();
    futureCharacters = fetchCharacters();
    futureLocations = fetchLocations();
    futureEpisodes = fetchEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rick & morty',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.location_pin)),
                  Tab(icon: Icon(Icons.movie))
                ],
              ),
            ),
            body: TabBarView(
              children: [
                FutureBuilder<List<Character>>(
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
                                  size:
                                      const Size.fromRadius(48), // Image radius
                                  child: Image.network(
                                      snapshot.data![index].image,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(width: 32),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
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
                                                builder: (context) =>
                                                    CharacterPage(
                                                        id: snapshot
                                                            .data![index].id)));
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
                FutureBuilder<List<Location>>(
                    future: futureLocations,
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
                                  child: Column(
                                    children: [
                                      Text(snapshot.data![index].name),
                                      Text(snapshot.data![index].type),
                                      Text(snapshot.data![index].dimension),
                                      ElevatedButton(
                                          child: const Text("Voir"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LocationPage(
                                                            id: snapshot
                                                                .data![index]
                                                                .id)));
                                          })
                                    ],
                                  ),
                                )));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
                FutureBuilder<List<Episode>>(
                    future: futureEpisodes,
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
                                  child: Column(
                                    children: [
                                      Text(snapshot.data![index].code),
                                      Text(snapshot.data![index].name),
                                      Text(snapshot.data![index].airDate),
                                      ElevatedButton(
                                          child: const Text("Voir"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CharacterPage(
                                                            id: snapshot
                                                                .data![index]
                                                                .id)));
                                          })
                                    ],
                                  ),
                                )));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
