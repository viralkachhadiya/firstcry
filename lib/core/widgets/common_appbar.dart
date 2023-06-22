import 'package:flutter/material.dart';

class CommonAppBar extends StatefulWidget {
  final Widget body;

  const CommonAppBar({Key? key, required this.body}) : super(key: key);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
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
                          style: TextStyle(fontSize: 10, color: Colors.black),
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
      body: widget.body,
    );
  }
}
