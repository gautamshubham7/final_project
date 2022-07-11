import 'package:flutter/material.dart';
import 'package:final_last/pages/order.dart';

import '../models/apiModel.dart';

class ProductDetail extends StatefulWidget {
  final index;

  ProductDetail({required this.index});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Detail",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 21, 19, 19),
        leading: GestureDetector(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.black,
            padding: EdgeInsets.all(20),
            // width: double.infinity,
            child: Center(
              child: Image.network(
                'http://mark.bslmeiyu.com/uploads/' +
                    widget.index.img.toString(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  widget.index.name.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  textAlign: TextAlign.left,
                  widget.index.location.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.left,
                  'Rs. ' + widget.index.price.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.index.stars,
                          itemBuilder: ((context, index) {
                            return Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 255, 217, 0),
                            );
                          })),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.index.stars.toString() + '/5',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  widget.index.description.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Order()));
                        },
                        child: Text('GET TICKET',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.blue)))),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextButton(
                          child: Text("Add to cart".toUpperCase(),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: Colors.blue)))),
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Order()))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
