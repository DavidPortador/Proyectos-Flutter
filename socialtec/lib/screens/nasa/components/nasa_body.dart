import 'package:flutter/material.dart';
import 'package:socialtec/screens/nasa/list_album.dart';

class NasaBody extends StatefulWidget {
  const NasaBody({
    Key? key,
  }) : super(key: key);

  @override
  State<NasaBody> createState() => _NasaBodyState();
}

class _NasaBodyState extends State<NasaBody> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            icon: Icon(Icons.nature_people_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListNasa(
                      tipo: "natural",
                ),
              )
              );
            },
            label: Text("Natural"),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 5, 149, 22),
              //onPrimary: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: Icon(Icons.brightness_7_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListNasa(
                      tipo: "enhanced",
                ),
              )
              );
            },
            label: Text("Enhanced"),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              //onPrimary: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: Icon(Icons.sunny),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListNasa(
                      tipo: "aerosol",
                ),
              )
              );
            },
            label: Text("Aerosol"),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 142, 139, 7),
              //onPrimary: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: Icon(Icons.cloud),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListNasa(
                      tipo: "cloud",
                ),
              )
              );
            },
            label: Text("Cloud"),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 5, 132, 149),
              //onPrimary: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
