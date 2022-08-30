import 'package:flutter/material.dart';
import 'package:lojinha_alura/widgets/carrinho_botao.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  final String titulo;
  final bool isCartPage;

  const AppBarCustom({
    Key key,
    this.titulo,
    this.isCartPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        titulo,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      actions: <Widget>[
        _mudarPaginaCarrinho(isCartPage),
      ],
    );
  }

  _mudarPaginaCarrinho(bool isCartPage) {
    if (isCartPage) return Container();
    return CarrinhoBotao();
  }

  @override
  // TODO: implement preferredSize
  // kToolbarHeight é o valor padrão da altura da appBar que é 56
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
