import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:week3project/style/input-border.dart';

class Product {
  final String? name;
  final String? image;

  Product({this.name, this.image});
}

const List<String> imgList = [
  'https://cafebiz.cafebizcdn.vn/zoom/700_438/162123310254002176/2020/5/19/photo1589881431815-1589881431950978522890.jpg',
  'https://yummyday.vn/uploads/images/banh-hamburger-ga.jpg',
  'https://stockdep.net/files/images/35895009.jpg',
  'https://chianui.vn/wp-content/uploads/2019/08/hamburger-ga-2-tang-compressed.jpg',
  'https://file.hstatic.net/200000291375/article/blog-10_394cfba0980e42d094c52c356b8bff38_cef97adcebcc41ac809c18709619df4e_1024x1024.jpg',
];

final product = List.generate(10, (index) => index)
    .map((e) => Product(
        name: 'Hamburger ${e + 1}',
        image:
            'https://chianui.vn/wp-content/uploads/2019/06/B%C3%92-2-T%E1%BA%A6NG_resize_min.jpg'))
    .toList();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
            child: new TextField(
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(197, 231, 231, 231),
                  filled: true,
                  enabledBorder: InputFieldBorder(),
                  contentPadding: EdgeInsets.only(left: 10, right: 5),
                  border: InputFieldBorder(),
                  hintText: 'Search...'),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 10),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 35,
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: imgList
                .map((item) => Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Hamburger',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffdf4f11)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: product
                  .map(
                    (e) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffE3E3E3),
                      ),
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Image.network(
                            e.image ?? '',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  e.name ?? '',
                                  style: TextStyle(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.add_shopping_cart_rounded,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
