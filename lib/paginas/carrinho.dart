import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lojinha_alura/main.dart';
import 'package:lojinha_alura/widgets/appbar_custom.dart';
import 'package:lojinha_alura/widgets/carrinho_lista.dart';

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  final formatacaoReais = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  @override
  Widget build(BuildContext context) {
    int _valorTotal = _calcularTotal();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBarCustom(
        titulo: 'Carrinho',
        isCartPage: true,
      ),
      body: _construirTela(),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              formatacaoReais.format(_valorTotal),
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }

  void atualiza() {
    setState(() {});
  }

  int _calcularTotal() {
    if (Inicio.carrinhoItens.isNotEmpty) {
      return Inicio.carrinhoItens
          .map((e) => e.movel.preco * e.quantidade)
          .reduce((value, element) => value + element);
    }
    return 0;
  }

  Widget _construirTela() {
    if (Inicio.carrinhoItens.isNotEmpty) {
      return CarrinhoLista(
        atualiza: atualiza,
      );
    }
    return Container(
      child: Center(
        child: Text(
          'Carrinho vazio',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
