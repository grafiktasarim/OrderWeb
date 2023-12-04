import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Order Web",
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5, left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              "assets/asev.png",
                              height: 10,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            "AveS Kadife Dünyası",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(selectedIndex == 0 ? 30 : 0),
                              ),
                            ),
                          ),
                        ),
                        pageButton(0, "top", "Mainpage", Icons.home),
                        pageButton(1, "middle", "Products", Icons.list),
                        pageButton(2, "bottom", "How am I?", Icons.people),
                        Container(
                          color: Colors.white,
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(selectedIndex == 2 ? 30 : 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 5, left: 10),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(image: AssetImage("assets/urun (0).png"), fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'Best seller "Click for detail"',
                                style: TextStyle(color: Colors.white, fontSize: 9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: selectedIndex == 0
                    ? mainpage()
                    : selectedIndex == 1
                        ? products()
                        : about(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainpage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.person_2_outlined,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.deepOrange,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          titles("Popular Products"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mainImages(2),
              const SizedBox(width: 10),
              mainImages(4),
            ],
          ),
          titles("Other Products"),
          SizedBox(
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomImages(0),
                bottomImages(1),
                bottomImages(2),
                bottomImages(3),
                bottomImages(4),
                bottomImages(5),
                bottomImages(6),
                bottomImages(7),
                bottomImages(8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget products() {
    return GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 95,
            height: 95,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/urun ($index).png"),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      width: 1,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      details[index],
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget about() {
    return const Center(
      child: Text("An ordinary developer", style: TextStyle(color: Colors.black, fontSize: 24)),
    );
  }

  Container bottomImages(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage("assets/urun ($index).png"),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          width: 1,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  GestureDetector pageButton(int index, String sira, String text, IconData icon) {
    return GestureDetector(
      onTap: () {
        changePage(index);
      },
      child: Container(
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: index == selectedIndex ? Colors.white : Colors.deepPurple,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                sira == "top" && selectedIndex == 0
                    ? 30
                    : sira == "bottom" && selectedIndex == 1
                        ? 30
                        : sira == "middle" && selectedIndex == 1
                            ? 30
                            : sira == "middle" && selectedIndex == 0
                                ? 30
                                : 0,
              ),
              bottomRight: Radius.circular(
                sira == "top" && selectedIndex == 0
                    ? 30
                    : sira == "middle" && selectedIndex == 1
                        ? 30
                        : sira == "middle" && selectedIndex == 2
                            ? 30
                            : sira == "bottom" && selectedIndex == 2
                                ? 30
                                : sira == "top" && selectedIndex == 1
                                    ? 30
                                    : sira == "bottom" && selectedIndex == 2
                                        ? 30
                                        : 0,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Icon(
                  icon,
                  color: selectedIndex == index ? Colors.black : Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: index == selectedIndex ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container titles(String text) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Expanded mainImages(int index) {
    return Expanded(
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage("assets/urun ($index).png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  List<String> details = [
    "Product 1",
    "Product 2",
    "Product 3",
    "Product 4",
    "Product 5",
    "Product 6",
    "Product 7",
    "Product 8",
    "Product 9",
  ];
}
