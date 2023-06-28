/*import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Pizza');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Pizza');






  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        const SizedBox(height: 20),
        Container(
          height: 50,
          color: Colors.amber[600],
          child: Center(child: Text('Pedidos: ')),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
*/



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:mytelephone/screens/update_record.dart';
import 'package:flutter/material.dart';
 
class Carrinho extends StatefulWidget {
  const Carrinho({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Carrinho> createState() => _CarrinhoState();
}
 
class _CarrinhoState extends State<Carrinho> {
  
  Query dbRef = FirebaseDatabase.instance.ref().child('Pizza');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Pizza');
  
  Widget listItem({required Map pizza}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 130,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pizza['borda'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            pizza['sabor'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            pizza['tamanho'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateRecord(pizzaKey: pizza['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(pizza['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
 
            Map pizza = snapshot.value as Map;
            pizza['key'] = snapshot.key;
 
            return listItem(pizza: pizza);
 
          },
        ),
      )
    );
  }
}
 