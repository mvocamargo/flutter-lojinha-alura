import 'package:flutter/material.dart';
import 'package:lojinha_alura/modelos/movel.dart';
import 'package:lojinha_alura/paginas/detalhes.dart';
import 'package:lojinha_alura/widgets/grid_produtos_elemento_gradient.dart';
import 'package:lojinha_alura/widgets/grid_produtos_elemento_imagem.dart';
import 'package:lojinha_alura/widgets/grid_produtos_elemento_titulo.dart';

class ElementoGridProdutos extends StatefulWidget {
  final Function atualiza;
  final Movel movel;

  const ElementoGridProdutos({Key key, this.movel, this.atualiza})
      : super(key: key);

  @override
  _ElementoGridProdutosState createState() => _ElementoGridProdutosState();
}

class _ElementoGridProdutosState extends State<ElementoGridProdutos> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detalhes(
              movel: widget.movel,
            ),
          ),
        ).then((value) => atualiza());
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 8,
              color: Colors.black12,
            ),
          ],
        ),
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              GridProdutosElementoImagem(
                imagem: widget.movel.foto,
              ),
              GridProdutosElementoGradient(),
              GridProdutosElementoTitulo(
                titulo: widget.movel.titulo,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void atualiza() {
    setState(() {});
  }
}
