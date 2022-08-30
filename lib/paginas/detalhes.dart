import 'package:flutter/material.dart';
import 'package:lojinha_alura/modelos/movel.dart';
import 'package:lojinha_alura/widgets/appbar_custom.dart';
import 'package:lojinha_alura/widgets/detalhes_card.dart';

class Detalhes extends StatefulWidget {
  final Movel movel;

  const Detalhes({Key key, this.movel}) : super(key: key);

  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'utilidades/assets/imagens/${widget.movel.foto}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // Remove a cor do bg do Scaffold para exibir a imagedo de fundo do elmento pai
        backgroundColor: Colors.transparent,
        appBar: AppBarCustom(
          titulo: widget.movel.titulo,
          isCartPage: false,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.all(16),
            height: 215,
            child: DetalhesCard(
              atualizaPagina: atualiza,
              movel: widget.movel,
            ),
          ),
        ),
      ),
    );
  }

  atualiza() {
    setState(() {});
  }
}
