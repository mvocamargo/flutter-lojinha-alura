import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/widgets/carrinho_indicador_botao.dart';

class CarrinhoBotao extends StatefulWidget {
  @override
  _CarrinhoBotaoState createState() => _CarrinhoBotaoState();
}

class _CarrinhoBotaoState extends State<CarrinhoBotao> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/carrinho')
            .then((value) => setState(() {}));
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              topLeft: Radius.circular(100),
            ),
          ),
          alignment: Alignment.centerRight,
          height: 40,
          padding: EdgeInsets.only(
            right: 20,
            left: 20,
          ),
          child: _carrinhoVisibilidadeIdentificador()),
    );
  }

  _carrinhoVisibilidadeIdentificador() {
    if (Inicio.carrinhoItens.length > 0) {
      return Stack(
        children: [
          Image(
            image: AssetImage('utilidades/assets/icones/carrinho.png'),
            height: 30,
          ),
          CarrinhoIndicadorBotao()
        ],
      );
    }

    return Image(
      image: AssetImage('utilidades/assets/icones/carrinho.png'),
      height: 30,
    );
  }
}
