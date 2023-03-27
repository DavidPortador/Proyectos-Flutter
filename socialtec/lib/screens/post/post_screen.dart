import 'package:flutter/material.dart';
import 'package:socialtec/screens/post/list_post.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  //bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social TEC :) !'),
      ),
      //body: ListPost(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.pushNamed(context, '/add').then((value) {
            setState(() {});
          });
        },
        label: const Text('Add post!'),
        icon: const Icon(Icons.add_comment),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              // currentAccountPicture: CircleAvatar(
              //   backgroundImage: NetworkImage('https://previews.123rf.com/images/dclipart/dclipart1611/dclipart161100025/68284221-logotipo-de-la-mascota-del-lince-jefe-de-lince-aislado-ilustraci%C3%B3n-vectorial-.jpg'),
              // ),
              accountName: Text('Rubensin Torres Frias'), 
              accountEmail: Text('ruben.torres@itcelaya.edu.mx')
            ),
            ListTile(
              onTap: () {},
              title: Text('Práctica 1'),
              subtitle: Text('Descripción de la práctica'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/popular'),
              title: Text('API Videos'),
              leading: Icon(Icons.movie),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}