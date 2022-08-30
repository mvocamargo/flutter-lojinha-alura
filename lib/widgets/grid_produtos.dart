import 'package:flutter/material.dart';
import 'package:lojinha_alura/modelos/movel.dart';

import 'grid_produtos_elemento.dart';

class GridProdutos extends StatelessWidget {
  final Function atualiza;
  final moveis;

  const GridProdutos({Key key, this.moveis, this.atualiza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: moveis.length,
      itemBuilder: (BuildContext context, int index) {
        final movel = Movel.fromJson(moveis[index]);

        return ElementoGridProdutos(
          movel: movel,
          atualiza: atualiza,
        );
      },
    );
  }
}
