import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menu_list.dart';


class DetailPage extends StatefulWidget {
  final Menu menu;

  DetailPage({this.menu});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.menu.name}'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Hero(
                tag: widget.menu.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image: AssetImage(widget.menu.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('\$${widget.menu.price}'),
            // Text('${widget.menu.key}'),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    setState(() {
                      (widget.menu.count == 0) ? widget.menu.count = 0 : widget.menu.count--;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('${widget.menu.count}'),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      widget.menu.count++;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  menus[menus.indexWhere(
                          (element) => element.key == widget.menu.key)]
                      .count = widget.menu.count;
                });
                Navigator.pop(context);
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
