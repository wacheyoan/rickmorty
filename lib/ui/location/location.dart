import 'package:flutter/material.dart';
import 'package:rickmorty/providers/Location.dart';
import 'package:rickmorty/providers/api.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<StatefulWidget> createState() => LocationState();
}

class LocationState extends State<LocationPage> {
  late Future<Location> futureLocation;

  void initState() {
    futureLocation = fetchLocation(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Liste des personnages de rick & morty',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Liste des personnages de rick & morty'),
          ),
          body: FutureBuilder<Location>(
            future: futureLocation,
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
                      child: Column(children: const [
                        Text('Résidents : '),

                      ])),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
