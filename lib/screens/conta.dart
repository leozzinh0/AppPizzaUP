import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var fsi = FirebaseFirestore.instance;

class Conta extends StatefulWidget {
  const Conta({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Conta> createState() => _ContaState();
}

class _ContaState extends State<Conta> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.network(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Olá, ' + user.email!,
              style: TextStyle(fontFamily: 'PathwayExtreme', fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.logout),
              onPressed: signUserOut,
              label: Text('Sair'),
            )
          ],
        ),
      ),
    );
  }
}
