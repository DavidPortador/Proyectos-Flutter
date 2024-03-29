import 'package:flutter/material.dart';
import 'package:socialtec/database/database_helper.dart';
import 'package:socialtec/models/post_model.dart';

class ItemPostWidget extends StatelessWidget {
  ItemPostWidget({super.key, this.objPostModel});

  final PostModel? objPostModel;
  final DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {

    // final avatar = CircleAvatar(
    //   backgroundImage: AssetImage('assets/customs/bob_cholo.png'),
    // );

    final txtUser = Text('Rubensin');
    final datePost = Text('06-03-2023');
    // final imgPost = Image(image: AssetImage('assets/customs/bob_cholo.png'),height: 100,);
    final txtDesc = Text(objPostModel!.dscPost!);
    final iconRate = Icon(Icons.rate_review);

    return Container(
      margin: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            children: [
              // avatar,
              txtUser,
              datePost
            ],
          ),
          Row(
            children: [
              // imgPost,
              txtDesc
            ],
          ),
          Row(
            children: [
              iconRate,
              Expanded(child: Container()),
              IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/add', arguments: objPostModel);
                }, 
                icon: Icon(Icons.edit)
              ),
              IconButton(
                onPressed: (){

                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text('Confirmar Borrado'),
                      content: const Text('Deseas borrar el post?'),
                      actions: [
                        TextButton(
                          onPressed: (){
                            database.DELETE('tblPost',objPostModel!.idPost!);
                            Navigator.pop(context);
                          }, 
                          child: const Text('Si')
                        ),
                        TextButton(
                          onPressed: (){}, 
                          child: const Text('No')
                        )
                      ],
                    ),
                  );
                }, 
                icon: Icon(Icons.delete)
              )
            ],
          )
        ],
      ),
    );
  }
}