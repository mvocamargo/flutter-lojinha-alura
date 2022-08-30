import 'package:flutter/material.dart';

class GridProdutosElementoImagem extends StatelessWidget {
  final String imagem;

  const GridProdutosElementoImagem({Key key, this.imagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage('utilidades/assets/imagens/$imagem'),
      ),
    );
  }
}
