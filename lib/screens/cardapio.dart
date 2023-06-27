import 'package:flutter/material.dart';

class Cardapio extends StatefulWidget {
  const Cardapio({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black)),
          child: Column(children: [
            Text(
              'Tamanhos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Caprasimo',
                color: Colors.red,
              ),
            ),
            Text('Pequena: 25 cm de diâmetro',
                style: TextStyle(fontSize: 15, fontFamily: 'PathwayExtreme')),
            Text('Média: 30 cm de diâmetro',
                style: TextStyle(fontSize: 15, fontFamily: 'PathwayExtreme')),
            Text('Grande: 35 cm de diâmetro',
                style: TextStyle(fontSize: 15, fontFamily: 'PathwayExtreme'))
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black)),
          child: Column(children: [
            Text(
              'Bordas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Caprasimo',
                color: Colors.red,
              ),
            ),
            Text('Normal: sem recheio',
                style: TextStyle(fontSize: 15, fontFamily: 'PathwayExtreme')),
            Text('Catupiry',
                style: TextStyle(fontSize: 15, fontFamily: 'PathwayExtreme')),
            Text('Cream cheese',
                style: TextStyle(fontSize: 15, fontFamily: 'PathwayExtreme')),
          ]),
        ),
        Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black)),
            child: Column(children: [
              Text(
                'Sabores',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Caprasimo',
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  '../../assets/images/pizza_calabresa.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: const Center(
                  child: Text(
                    'Calabresa -  feita com farinha de trigo, fermento em pó, linguiça calabresa, cebola, azeitona e orégano',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontFamily: 'PathwayExtreme', fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  '../../assets/images/pizza_portuguesa.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: const Center(
                    child: Text(
                  'Portuguesa - feita com farinha de trigo, fermento em pó, queijo muçarela, presunto, cebola, ovo, azeitonas',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'PathwayExtreme', fontSize: 15),
                )),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  '../../assets/images/pizza_margherita.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: const Center(
                    child: Text(
                        'Marguerita - feita com Molho de tomate, muçarela, tomates frescos e manjericão fresco',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'PathwayExtreme', fontSize: 15))),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  '../../assets/images/pizza_mucarela.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: const Center(
                    child: Text(
                        'Muçarela - feita com farinha de trigo, fermento, óleo, sal, queijo muçarela, molho de tomate e orégano',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'PathwayExtreme', fontSize: 15))),
              ),
              const SizedBox(height: 20),
            ])),
      ],
    );
  }
}
