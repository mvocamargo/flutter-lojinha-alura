import 'package:flutter/material.dart';
// Lib para i18n usada aqui para exibição de moeda
import 'package:intl/intl.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/modelos/carrinho_item.dart';
import 'package:lojinha_alura/modelos/movel.dart';

import 'detalhes_texto.dart';

class DetalhesCard extends StatelessWidget {
  final formatacaoReais = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  final Movel movel;
  final Function atualizaPagina;

  DetalhesCard({Key key, this.movel, this.atualizaPagina}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetalhesTexto(
            texto: movel.titulo,
            estilo: Theme.of(context).textTheme.headline1,
          ),
          DetalhesTexto(
            texto: movel.descricao,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatacaoReais.format(movel.preco),
                  style: Theme.of(context).textTheme.headline1,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    _carrinhoVerificarItemLista(
                        Inicio.carrinhoItens,
                        CarrinhoItem(
                          quantidade: 1,
                          movel: movel,
                        ));
                  },
                  child: Text(
                    'Comprar',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _adicionarItemCarrinho(CarrinhoItem item) {
    Inicio.carrinhoItens.add(item);
    atualizaPagina();
  }

  void _carrinhoVerificarItemLista(
      List<CarrinhoItem> lista, CarrinhoItem item) {
    int indexMovel = lista.indexWhere((element) => element.movel == item.movel);

    if (indexMovel >= 0) {
      lista[indexMovel].quantidade = lista[indexMovel].quantidade + 1;
    } else {
      _adicionarItemCarrinho(item);
    }
  }
}
