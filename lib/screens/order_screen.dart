import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _widgetsValue = Hive.box("widgets_values");
  final controllerEndereco = TextEditingController();
  final controllerSabores = TextEditingController();

  final List<String> tamanhos = [
    'Pequena',
    'Média',
    'Grande',
  ];

  String? qtdsabores;
  String? borda;
  String endereco = '';

  Map<String, bool> sabores = {
    'Calabresa': false,
    'Portuguesa': false,
    'Marguerita': false,
    'Muçarela': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    sabores.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    print(tmpArray);
    tmpArray.clear();
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formkey,
            child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: SingleChildScrollView(
                    child: Column(children: [
                  const Text(
                    'Monte sua pizza',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Caprasimo',
                        color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Selecione o tamanho:',
                    style:
                        TextStyle(fontSize: 20, fontFamily: 'PathwayExtreme'),
                  ),
                  DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Text(
                            'Tamanho',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                              fontFamily: 'PathwayExtreme',
                            ),
                          ),
                          items: tamanhos
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'PathwayExtreme'),
                                    ),
                                  ))
                              .toList(),
                          value: _widgetsValue.get('tamanho'),
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                            _widgetsValue.put('tamanho', value as String);
                          })),
                  const SizedBox(height: 20),
                  const Text('Selecione a borda:',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'PathwayExtreme')),
                  Column(
                    children: [
                      RadioListTile(
                          title: const Text('Normal',
                              style: TextStyle(fontFamily: 'PathwayExtreme')),
                          value: "opcao1",
                          groupValue: _widgetsValue.get('borda'),
                          onChanged: (value) {
                            setState(() {
                              borda = value.toString();
                            });
                            _widgetsValue.put('borda', value);
                          }),
                      RadioListTile(
                          title: const Text('Catupiry',
                              style: TextStyle(fontFamily: 'PathwayExtreme')),
                          value: "opcao2",
                          groupValue: _widgetsValue.get('borda'),
                          onChanged: (value) {
                            setState(() {
                              borda = value.toString();
                            });
                            _widgetsValue.put('borda', value);
                          }),
                      RadioListTile(
                          title: const Text('Cream cheese',
                              style: TextStyle(fontFamily: 'PathwayExtreme')),
                          value: "opcao3",
                          groupValue: _widgetsValue.get('borda'),
                          onChanged: (value) {
                            setState(() {
                              borda = value.toString();
                            });
                            _widgetsValue.put('borda', value);
                          }),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Escolha os sabores:',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'PathwayExtreme')),
                  ListView(
                    shrinkWrap: true,
                    children: sabores.keys.map((String key) {
                      return CheckboxListTile(
                        title: new Text(
                          key,
                          style: TextStyle(fontFamily: 'PathwayExtreme'),
                        ),
                        value: _widgetsValue.get(key) ?? false,
                        onChanged: (value) {
                          setState(() {
                            sabores[key] = value!;
                          });
                          _widgetsValue.put(key, value!);
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _formkey.currentState!.save();

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                          content: Text("Pedido feito")));
                    },
                    child: const Text('Pedir'),
                  ),
                ])))));
  }
}
