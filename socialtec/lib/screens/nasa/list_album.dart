import 'package:flutter/material.dart';
import 'package:socialtec/models/nasa_model.dart';
import 'package:socialtec/network/api_nasa.dart';
import 'package:socialtec/screens/nasa/detail_nasa_screen.dart';

class ListNasa extends StatefulWidget {
  const ListNasa({super.key, required this.tipo});

  final String tipo;

  @override
  State<ListNasa> createState() => _ListNasaState();
}

class _ListNasaState extends State<ListNasa> {
  ApiNasa? apiNasa;

  @override
  void initState() {
    apiNasa = ApiNasa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album ${widget.tipo}"),
      ),
      body: FutureBuilder(
          future: apiNasa!.getAll(widget.tipo),
          builder: (context, AsyncSnapshot<List<NasaModel>?> snapshot) {
            if (snapshot.hasData) {
              final Size size = MediaQuery.of(context).size;
              double radio = .46;
              double x = 10;
              double y = 10;
              int count = 2;
              if (size.width > 992) {
                radio = .9;
                count = 4;
                x = 100;
              } else {
                radio = .46;
                count = 2;
                x = 10;             
              }
              return GridView.builder(
                padding: EdgeInsets.fromLTRB(x,y,x,y),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  childAspectRatio: radio, // es el height :u
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  String fecha = snapshot.data![index].date!.split(" ")[0];
                  String anio = fecha.split("-")[0];
                  String mes = fecha.split("-")[1];
                  String dia = fecha.split("-")[2];
                  print("fecha => $fecha");
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [
                            0.1,
                            0.9,
                          ],
                          colors: [Colors.black, Colors.black.withOpacity(.4)],
                        )),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                      child: Column(
                        children: [
                          Text(snapshot.data![index].identifier!,
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                          FadeInImage(
                              //fit: BoxFit.fill,
                              placeholder: const AssetImage(
                                  'assets/customs/loading.gif'),
                              height: 170,
                              image: NetworkImage(
                                  'https://api.nasa.gov/EPIC/archive/${widget.tipo}/$anio/$mes/$dia/png/${snapshot.data![index].image!}.png?api_key=ut9N5GCDqEZI6KTzNkCdFIOtD1hev0cCN1xp2AYs')),
                          Text(snapshot.data![index].date!,
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                            child: Text(
                              "\n${snapshot.data![index].caption!}",
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(2, 2),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.image_search_rounded),
                            onPressed: () {
                              double scale;
                              if (widget.tipo == "aerosol") {
                                scale = 0.15;
                              } else if (widget.tipo == "cloud") {
                                scale = 0.75;
                              } else {
                                scale = 0.2;
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailNasaScreen(
                                    nasaModel: snapshot.data![index],
                                    tipo: widget.tipo,
                                    scale: scale,
                                  ),
                                ),
                              );
                            },
                            label: const Text("Details"),
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size(double.infinity, 40),
                              minimumSize: const Size(double.minPositive, 40),
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                              shadowColor: Colors.white,
                              elevation: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Ocurrio un error :('),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
