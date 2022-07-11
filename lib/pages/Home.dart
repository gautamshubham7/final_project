import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:final_last/models/apiModel.dart';
import 'package:final_last/pages/productDetails.dart';
import 'package:http/http.dart' as http;
import 'package:final_last/services/network_helper.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var posts;
  final List<String> imageList = [
    'https://imgs.search.brave.com/zb7r8y6nZ4Ai_xPLXP6zpkoieZURcgrLA27A8U6HG4s/rs:fit:1024:768:1/g:ce/aHR0cHM6Ly93d3cu/d2FsbHBhcGVyczEz/LmNvbS93cC1jb250/ZW50L3VwbG9hZHMv/MjAxNS8xMi9Xb25k/ZXJmdWwtdmlld3Mt/ZnJvbS1kaWZmZXJl/bnQtcGxhY2VzLW9m/LW5hdHVyYWwtYmVh/dXR5LTEwMjR4NzY4/LmpwZw',
    'https://imgs.search.brave.com/7oQacbCHgHN3pVX-MIlwrRKR9Cb60az-cRHIbG8t-6E/rs:fit:1200:1000:1/g:ce/aHR0cHM6Ly80LmJw/LmJsb2dzcG90LmNv/bS8tbzhVSlhpSEg0/Y1UvWEdKc2Rqc2Q3/NUkvQUFBQUFBQUFB/LW8vdzE3Mml3MHgz/bjRZV1UyOEl2WTU0/Mzc5NXpuV01HcE93/Q0xjQkdBcy9zMTYw/MC9uYXR1cmFsJTJC/YmVhdXR5JTJCb2Yl/MkJQYWtpc3Rhbi5q/cGVn',
    'https://imgs.search.brave.com/IyWKQ_ZrkQPhrDFWerRbGFyFAwvUuy2niEKxujkNpZE/rs:fit:1200:746:1/g:ce/aHR0cHM6Ly9ydXNz/aWF0cmVrLm9yZy9i/bG9nL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDE0LzA2L2FsdGFp/LW1vdW50YWlucy1u/YXR1cmFsLWJlYXV0/eS1ydXNzaWEtMTMu/anBn',
    'https://imgs.search.brave.com/6pz4d4SfjT8786wA8zqgjswnbwxIG5kKlnsg_9C740g/rs:fit:1178:755:1/g:ce/aHR0cHM6Ly9ydXNz/aWF0cmVrLm9yZy9i/bG9nL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDE0LzA2L2FsdGFp/LW1vdW50YWlucy1u/YXR1cmFsLWJlYXV0/eS1ydXNzaWEtMTgu/anBn'
  ];
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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 18, 18),
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Text(
            "Hello, User",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: CarouselSlider(
              items: imageList
                  .map((item) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              item,
                              width: 300,
                              height: 200,
                            )
                          ],
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true),
            ),
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
                        tileColor: Color.fromARGB(255, 255, 251, 251),
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
    );
  }
}
