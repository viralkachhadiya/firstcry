import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/firstcry-logo.png',
          width: 90,
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.search_rounded,
                color: Colors.grey,
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.share,
                color: Colors.grey,
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                  ),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          "0",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children:  [
                  _CarouselWithIndicator(),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "I Bears Half Sleeves Printed Onesies Pack of 3 - Multicolour",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$ 333.90",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4),
                                  Text.rich(
                                    TextSpan(
                                      text: "MRP: ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "\$ 40.80",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "  47% OFF",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "MRP incl. all taxes; Add'l charges may apply on discounted price",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 5,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(Icons.delivery_dining,color: Colors.orange,size: 42,),
                              SizedBox(width: 8,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Get Free Shipping with Club",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 4),
                                  Text.rich(
                                    TextSpan(
                                      text: "Shipping Cost: ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "\$ 0 ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "₹ 50",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                            decoration: TextDecoration.lineThrough
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Join Now",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.orange
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.orange,
                            size: 16,
                          ),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.black45,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 8,),
                              Text(
                                '3 - 6 M',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 50,
                        color: Colors.orange,
                        child: Center(
                          child: Text(
                            "ADD TO CART",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CarouselWithIndicator extends StatefulWidget {
  const _CarouselWithIndicator({super.key});

  @override
  State<_CarouselWithIndicator> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<_CarouselWithIndicator> {
  List<String> countryList = ["1", "2", "3", "4", "5", "6"];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: countryList.map((e) {
            return Image.asset(
              'assets/product_item.jpg',
              fit: BoxFit.cover,
              height: 500,
              width: MediaQuery.of(context).size.width,
            );
          }).toList(),
          options: CarouselOptions(
            height: 500,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Text(
                    "${_current + 1} / ${countryList.length}",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 2),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Image.asset(
              'assets/home_category.jpg',
              fit: BoxFit.cover,
              height: 130,
              width: double.infinity,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Image.asset(
              'assets/home_category.jpg',
              fit: BoxFit.cover,
              height: 130,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(width: 2),
      ],
    );
  }
}
