import 'package:flutter/material.dart';
import 'package:final_last/pages/productDetails.dart';
import 'package:final_last/services/network_helper.dart';

class ApiPage extends StatefulWidget {
  ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  var posts;
  @override
  void initState() {
    super.initState();
    getAPiData();
  }

  getAPiData() async {
    posts = await NetworkHepler().getApiResponse();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  //background color of box
                  BoxShadow(
                    color: Color.fromARGB(255, 127, 127, 127),

                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      15.0, // Move to bottom 10 Vertically
                    ),
                  )
                ]),
                child: Image.asset('images/covidbanner.png')),
          ),
          SizedBox(
            height: 25,
          ),
          posts != null
              ? (ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: posts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 0.5),
                            borderRadius: BorderRadius.circular(10)),
                        leading: Image.network(
                          'http://mark.bslmeiyu.com/uploads/${(posts[index]?.img).toString()}',
                          width: 50,
                          height: 50,
                        ),
                        title: Text(posts[index]?.name),
                        subtitle: Text(
                          'Rs. ' + (posts[index]?.price).toString(),
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetail(
                                index: posts[index],
                              );
                            }));
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    );
                  },
                ))
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    ));
  }
}
