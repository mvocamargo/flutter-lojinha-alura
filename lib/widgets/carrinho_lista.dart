import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/modelos/carrinho_item.dart';
import 'package:lojinha_alura/modelos/movel.dart';

class CarrinhoLista extends StatefulWidget {
  final Function atualiza;

  const CarrinhoLista({Key key, this.atualiza}) : super(key: key);

  @override
  _CarrinhoListaState createState() => _CarrinhoListaState();
}

class _CarrinhoListaState extends State<CarrinhoLista> {
  final List<CarrinhoItem> carrinho = Inicio.carrinhoItens;
  final formatacaoReais = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carrinho.length,
      itemBuilder: (BuildContext context, int index) {
        CarrinhoItem item = carrinho[index];
        Movel movel = item.movel;
        return Container(
          margin: EdgeInsets.all(16),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Expanded(
                  child: Image(
                    image:
                        AssetImage('utilidades/assets/imagens/${movel.foto}'),
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movel.titulo,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatacaoReais.format(movel.preco)),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => _diminuirQuantidade(item),
                                  child: Icon(
                                    Icons.remove,
                                    size: 12,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                  ),
                                  child: Text('${item.quantidade}'),
                                ),
                                GestureDetector(
                                  onTap: () => _aumentarQuantidade(item),
                                  child: Icon(
                                    Icons.add,
                                    size: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _aumentarQuantidade(CarrinhoItem item) {
    setState(() {
      item.quantidade++;
      widget.atualiza();
    });
  }

  _diminuirQuantidade(CarrinhoItem item) {
    setState(() {
      if (item.quantidade > 1) {
        item.quantidade--;
        widget.atualiza();
      } else {
        _removerMovel(item);
      }
    });
  }

  _removerMovel(CarrinhoItem item) {
    setState(() {
      Inicio.carrinhoItens.remove(item);
      widget.atualiza();
    });
  }
}
