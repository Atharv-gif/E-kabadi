import 'package:flutter/material.dart';

class RedeemPage extends StatefulWidget {
  const RedeemPage({super.key});

  @override
  State<RedeemPage> createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 150, top: 40), // Adjusted for better layout
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0,top: 90),
                  child: Text(
                    "Redeem Rewards!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 40),
                child: Text(
                  "Points: 70",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildKabadiwalaCard(
                  name: 'Free Hospital Service',
                  points: "50",
                  image: "images/1.png",
                ),
                _buildKabadiwalaCard(
                  name: 'Free Medicines',
                  points: "15",
                  image: 'images/2.png',
                ),
                _buildKabadiwalaCard(
                  name: 'Free Ration',
                  points: "25",
                  image: 'images/3.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKabadiwalaCard({
    required String name,
    required String points,
    required String image,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: image.isNotEmpty
                  ? AssetImage(image)
                  : const AssetImage('assets/images/placeholder.png'),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Points: $points",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showRedeemSuccessMessage(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.green,
              ),
              child: const Text("Redeem"),
            ),
          ],
        ),
      ),
    );
  }

  void _showRedeemSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Redeemed Successfully!", textAlign: TextAlign.center),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }
}
