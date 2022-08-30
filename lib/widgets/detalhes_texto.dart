import 'package:flutter/material.dart';

class DetalhesTexto extends StatelessWidget {
  final String texto;
  final TextStyle estilo;

  const DetalhesTexto({
    Key key,
    this.texto,
    this.estilo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
      ),
      child: _setTextStyles(texto),
    );
  }

  _setTextStyles(texto) {
    if (estilo != null) {
      return Text(
        texto,
        style: estilo,
      );
    }
    return Text(texto);
  }
}
