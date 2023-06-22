import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_task/features/home/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 4,
        backgroundColor: Colors.white,
        leadingWidth: 0,
        leading: SizedBox(),
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
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.grey,
                  ),
                  Positioned(
                    top: -2,
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
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                Icons.favorite_border,
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
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black
                          ),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      1.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child:
                          Text("Select a location to see product avaalablity"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.expand_more,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) => const ProductScreen(),
                        ),
                      );
                    },
                    child: Image.asset('assets/home_first_banner.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const CarouselWithIndicator(),
                  CarouselSlider(
                    items: [1, 2, 3, 4, 5].map((e) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (BuildContext context) => const ProductScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.pink.shade200),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              'assets/home_carousal2.jpg',
                              fit: BoxFit.cover,
                              height: 70,
                              width: MediaQuery.of(context).size.width - 30,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(height: 70, viewportFraction: 0.9),
                  ),
                  Text(
                    "Shop By Category",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  _CategoryWidget(),
                  _CategoryWidget(),
                  _CategoryWidget(),
                  _CategoryWidget(),
                  _CategoryWidget()
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Shopping"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              label: "Explore"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_outlined),
              label: "Parenting"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: "Profile"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Menu"
          ),
        ],
      ),
    );
  }
}

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({super.key});

  @override
  State<CarouselWithIndicator> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  List<String> countryList = ["1", "2", "3", "4", "5", "6"];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: countryList.map((e) {
            return Image.asset(
              'assets/home_carousal.jpg',
              fit: BoxFit.cover,
              height: 350,
              width: MediaQuery.of(context).size.width,
            );
          }).toList(),
          options: CarouselOptions(
            height: 350,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: countryList.asMap().entries.map((entry) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                      .withOpacity(_current == entry.key ? 1.0 : 0.5),
                ),
              );
            }).toList(),
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
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (BuildContext context) => const ProductScreen(),
          ),
        );
      },
      child: Row(
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
      ),
    );
  }
}
