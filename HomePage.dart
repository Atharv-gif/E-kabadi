import 'package:flutter/material.dart';
import 'package:hacka/ScrapPage.dart';
import 'package:hacka/Scanner.dart';
import 'package:hacka/RedeemPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScannerPage()),
      );
    }

    else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RedeemPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/interface.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 5),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/user.jpg'),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 430,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search..',
                          hintStyle: TextStyle(
                            fontFamily: 'Font1',
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(Icons.search, size: 30.0),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {},
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'NEARBY KABADI WALAS ->',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Font1",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildKabadiwalaCard(
                            name: 'Kunal Kabadiwala',
                            distance: '1.2 km away',
                            image: 'images/kunal.png',
                          ),
                          _buildKabadiwalaCard(
                            name: 'Adi Scrap Dealer',
                            distance: '2.5 km away',
                            image: 'images/Adi.jpg',
                          ),
                          _buildKabadiwalaCard(
                            name: 'Gaurav Scrap Collector',
                            distance: '3.0 km away',
                            image: 'images/oma.png',
                          ),
                          _buildKabadiwalaCard(
                            name: 'Omanshu Scrap Buyer',
                            distance: '1.8 km away',
                            image: 'images/gau.jpg',
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScrapPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 55, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Connect',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Icon(
                      Icons.menu,
                      size: 60,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'PAY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'REDEEM',
          ),
        ],
      ),
    );
  }

  Widget _buildKabadiwalaCard({
    required String name,
    required String distance,
    required String image,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    distance,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward, size: 30),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
