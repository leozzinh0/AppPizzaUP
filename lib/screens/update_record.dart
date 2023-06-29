import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
 
class UpdateRecord extends StatefulWidget {
  
  const UpdateRecord({Key? key, required this.pizzaKey}) : super(key: key);
 
  final String pizzaKey;
 
  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}
 
class _UpdateRecordState extends State<UpdateRecord> {
 
  final  bordaController = TextEditingController();
  final  saborController= TextEditingController();
  final  tamanhoController =TextEditingController();
 
  late DatabaseReference dbRef;
 
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Pizza');
    getpizzaData();
  }
 
  void getpizzaData() async {
    DataSnapshot snapshot = await dbRef.child(widget.pizzaKey).get();
 
    Map pizza = snapshot.value as Map;
 
    bordaController.text = pizza['borda'];
    saborController.text = pizza['sabor'];
    tamanhoController.text = pizza['tamanho'];
 
  }
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const SizedBox(
                height: 50,
              ),
              const Text(
                'Atualizar valores',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
             const SizedBox(
                height: 20,
              ),
              TextField(
                controller: bordaController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Borda',
                  hintText: 'Sua Borda',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: saborController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sabor',
                  hintText: 'Coloque seu sabor',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: tamanhoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tamanho',
                  hintText: 'Tamanho',
                ),
              ),
              MaterialButton(
                onPressed: () {
 
                  Map<String, String> pizzas = {
                    'borda': bordaController.text,
                    'sabor': saborController.text,
                    'tamanho': tamanhoController.text
                  };
 
                  dbRef.child(widget.pizzaKey).update(pizzas)
                  .then((value) => {
                     Navigator.pop(context) 
                  });
 
                },
                child: const Text('Atualizar'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
 