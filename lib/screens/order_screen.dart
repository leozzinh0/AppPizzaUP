import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mytelephone/widget/checkbox_widget.dart';

import '../model/checkbox_model.dart';

GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // final _widgetsValue = Hive.box("widgets_values");
  String _tamanhoValue = 'Pequeno';
  String _bordaValue = '';

  void checkRadio(String value) {
    setState(() {
      _bordaValue = value;
    });
  }

  final List<String> tamanhos = [
    'Pequeno',
    'Médio',
    'Grande',
  ];

  final List<CheckBoxModel> itens = [
    CheckBoxModel(texto: "Calabresa"),
    CheckBoxModel(texto: "Portuguesa"),
    CheckBoxModel(texto: "Marguerita"),
    CheckBoxModel(texto: "Muçarela"),
  ];

  void listarApenasMarcados() {
    List<CheckBoxModel> itensMarcados =
        List.from(itens.where((item) => item.checked));

    itensMarcados.forEach((item) {
      print(item.texto);
    });
  }

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
                          value: _tamanhoValue,
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
                          onChanged: (String? newValue) {
                            setState(() {
                              _tamanhoValue = newValue!;
                            });
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
                          value: "Normal",
                          groupValue: _bordaValue,
                          onChanged: (value) {
                            checkRadio(value as String);
                          }),
                      RadioListTile(
                          title: const Text('Catupiry',
                              style: TextStyle(fontFamily: 'PathwayExtreme')),
                          value: "Catupiry",
                          groupValue: _bordaValue,
                          onChanged: (value) {
                            checkRadio(value as String);
                          }),
                      RadioListTile(
                          title: const Text('Cream cheese',
                              style: TextStyle(fontFamily: 'PathwayExtreme')),
                          value: "Cream cheese",
                          groupValue: _bordaValue,
                          onChanged: (value) {
                            checkRadio(value as String);
                          }),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Escolha os sabores:',
                      style: TextStyle(
                          fontSize: 20, fontFamily: 'PathwayExtreme')),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: itens.length,
                      itemBuilder: (_, int index) {
                        return CheckboxWidget(item: itens[index]);
                      }),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20.0,
                              ),
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.only(top: 30.0, bottom: 20.0),
                          title: Text(
                            'Confirme seu pedido',
                            style: TextStyle(
                                fontFamily: 'Caprasimo', color: Colors.red),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(children: <Widget>[
                              Text(
                                'Tamanho $_tamanhoValue',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: 'PathwayExtreme'),
                              ),
                              Text(
                                'Borda $_bordaValue',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: 'PathwayExtreme'),
                              ),
                              Text(
                                'Sabores',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: 'PathwayExtreme'),
                              ),
                            ]),
                          ),
                          actions: [
                            RichText(
                              text: TextSpan(
                                  text: 'Cancelar',
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 243, 93, 33),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                    }),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Confirmar pedido',
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 243, 93, 33),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.green,
                                              duration: Duration(seconds: 2),
                                              content: Text("Pedido feito")));
                                    }),
                            ),
                          ]),
                    ),
                    // _formkey.currentState!.save();
                    child: const Text(
                      'Pedir',
                      style: TextStyle(fontFamily: 'Caprasimo'),
                    ),
                  ),
                ])))));
  }
}
