import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 30,
                    ),
                  ),
                  const Text(
                    "Order Details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.more_vert_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            flexibleSpace: Container(
                decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fashion.jpg"),
                fit: BoxFit.cover,
              ),
            )),
            expandedHeight: 350,
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                  minEx: 60,
                  maxEx: 60,
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ))),
          SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("assets/fashion.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  );
                },
                childCount: 10, // Elementlar soni
              )),
          SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                  minEx: 60,
                  maxEx: 60,
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Men's Fashion",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ))),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                                image: AssetImage('assets/fashion.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
                childCount: 10, // Elementlar soni
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxEx;
  final double minEx;
  final Widget child;

  _SliverAppBarDelegate(
      {required this.maxEx, required this.minEx, required this.child});

  @override
  Widget build(Object context, double shrinkOfset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxEx;

  @override
  double get minExtent => minEx;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
