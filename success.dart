import 'package:hacka/scanner.dart';
import 'package:flutter/material.dart';


class success extends StatefulWidget {
  const success({super.key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 890),
            child: IconButton(onPressed: () {
              Navigator.push(context,  MaterialPageRoute(builder: (context) => ScannerPage()),);
            }, icon: Icon(Icons.arrow_back)
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Center(
            child: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage("images/suc.png")),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Your Payment Is Successful!", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          )
        ],
      ),
    );
  }
}
