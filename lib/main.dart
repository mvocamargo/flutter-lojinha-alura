// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lojinha_alura/modelos/carrinho_item.dart';
import 'package:lojinha_alura/paleta_cores.dart';
import 'package:lojinha_alura/widgets/appbar_custom.dart';
import 'package:lojinha_alura/widgets/grid_produtos.dart';

import 'paginas/carrinho.dart';
import 'paginas/detalhes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/carrinho': (context) => Carrinho(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: PaletaCores().lilas,
        primarySwatch: Colors.purple,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            fontFamily: 'Alata',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 20,
            fontFamily: 'Alata',
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 16,
            fontFamily: 'Alata',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
        ),
      ),
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  static List<CarrinhoItem> carrinhoItens = List();

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List moveis = [
    {
      "titulo": "Mesa",
      "preco": 300,
      "foto": "movel1.jpeg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Cadeira",
      "preco": 120,
      "foto": "movel2.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Manta",
      "preco": 200,
      "foto": "movel3.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Sofá Cinza",
      "preco": 800,
      "foto": "movel4.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Mesa de cabeceira",
      "preco": 400,
      "foto": "movel5.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Jogo de Cama",
      "preco": 250,
      "foto": "movel6.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "titulo": "Sofá Branco",
      "preco": 900,
      "foto": "movel7.jpg",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustom(
        titulo: 'Lojinha Alura',
        isCartPage: false,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Divider(),
                ),
              ),
              Text(
                'Produtos',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 30,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Divider(),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridProdutos(
              atualiza: atualiza,
              moveis: moveis,
            ),
          )
        ],
      ),
    );
  }

  void atualiza() {
    setState(() {});
  }
}
