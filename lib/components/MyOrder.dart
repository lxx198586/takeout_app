import 'package:flutter/material.dart';
import 'CheckOut.dart';
import 'menu_list.dart';

class MyOrder extends StatefulWidget {
  double sum;
  List<String> orderNames;
  List<String> orderCounts;

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    double sum = 0.00;
    String sumTitle = '';
    List<String> orderNames = [];
    List<String> orderCounts = [];
    List<Menu> _cartList_nonZero = menus.where((i) => (i.count != 0)).toList();
    setState(() {
      _cartList_nonZero
          .forEach((cartItem) => sum += cartItem.price * cartItem.count);
      sumTitle = sum.toStringAsFixed(2);
      _cartList_nonZero.forEach((element) {
        var _temp = '"'+element.name+'"';
        orderNames.add(_temp);
      });
      _cartList_nonZero.forEach((element) {
        var _temp = '"'+element.count.toString()+'"';
        orderCounts.add(_temp);
      });
      // print(orderNames);
      // print(orderCounts);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Total: \$$sumTitle'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckOut(
                            sum: sum,
                            orderNames: orderNames,
                            orderCounts: orderCounts,
                          )),
                );
                print(sum);
              },
              child: Text('CHECK OUT'),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Menu cart = _cartList_nonZero[index];
                return Container(
                  key: UniqueKey(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            width: 180.0,
                            height: 180.0,
                            image: AssetImage(
                              cart.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(cart.name),
                          SizedBox(
                            width: 10,
                          ),
                          Text('x ${cart.count}'),
                        ],
                      ),
                      Text('\$${cart.price * cart.count}'),
                    ],
                  ),
                );
              },
              childCount: _cartList_nonZero.length,
            ),
          ),
        ],
      ),
    );
  }
}
