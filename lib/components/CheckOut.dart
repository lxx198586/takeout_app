import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator,
  }) {
    // assert(mask != null);
    // assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

class CheckOut extends StatefulWidget {
  final double sum;
  final List<int> orderCounts;
  final List<String> orderNames;

  CheckOut({this.sum, this.orderNames, this.orderCounts});

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final databaseReference = FirebaseFirestore.instance;
  String username = '';
  String cardNumber = '';
  String expiryDate = '';
  String cvv = '';
  String address = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                onChanged: (text) {
                  setState(() {
                    username = text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Credit Card Numbers',
                    ),
                    style: TextStyle(fontWeight: FontWeight.bold),
                    onChanged: (text) {
                      setState(() {
                        cardNumber = text;
                      });
                    },
                    inputFormatters: [
                      MaskedTextInputFormatter(
                        mask: 'xxxx xxxx xxxx xxxx',
                        separator: ' ',
                      ),
                    ],
                  ),
                  Text('We only accept Visa/Master'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Expiry Date MM/YY',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                onChanged: (text) {
                  setState(() {
                    expiryDate = text;
                  });
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskedTextInputFormatter(
                    mask: 'xx/xx',
                    separator: '/',
                  ),
                ],
                // maxLength: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CVV',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                onChanged: (text) {
                  setState(() {
                    cvv = text;
                  });
                },
                maxLength: 3,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Deliver Address',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                onChanged: (text) {
                  setState(() {
                    address = text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number xxx-xxx-xxxx',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  MaskedTextInputFormatter(
                    mask: 'xxx-xxx-xxxx',
                    separator: '-',
                  ),
                ],
                onChanged: (text) {
                  setState(() {
                    phoneNumber = text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SUBTOTAL:'),
                      Text('\$${widget.sum}'),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TAX:'),
                      Text('\$${(widget.sum * 0.0875).toStringAsFixed(2)}'),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TOTAL:'),
                      Text('\$${(widget.sum * 1.0875).toStringAsFixed(2)}'),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  child: Text('Cancel'),
                ),
                SizedBox(
                  width: 100,
                ),
                RaisedButton(
                  onPressed: () {
                    createRecord();
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void createRecord() async {
    var docName = DateTime.now();
    return await databaseReference.collection("orders").doc('${docName}').set({
      'name': username,
      'credit card number': cardNumber,
      'expiry date': expiryDate,
      'CVV': cvv,
      'address': address,
      'phone number': phoneNumber,
      'subtotal': '${widget.sum}',
      'timestamp': DateTime.now(),
      'order names': '${widget.orderNames}',
      'order counts': '${widget.orderCounts}',
    });
  }
}
