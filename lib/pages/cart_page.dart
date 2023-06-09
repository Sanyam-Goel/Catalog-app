import 'package:flutter/material.dart';
import 'package:tutorials/models/cart.dart';
//import 'package:tutorials/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children:  [
           _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {
  //const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return  SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.theme.colorScheme.secondary).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet.".text.make(),
                ));
            },
            style: ButtonStyle(
              // ignore: deprecated_member_use
              backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
            ),
            child: "Buy".text.white.make(),
            ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  //const __CartList();

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty ?
     "Nothing to Show".text.xl3.makeCentered() : 
    ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
           icon: const Icon(Icons.remove_circle_outline),
          onPressed: (){
            _cart.remove(_cart.items[index]);
            setState(() {});
          },
          ),
          title: _cart.items[index].name.text.make(),
      ),
    );
  }
}