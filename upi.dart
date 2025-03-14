import 'package:hacka/scanner.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:hacka/success.dart';

class UPIpage extends StatefulWidget {
  const UPIpage({super.key});

  @override
  State<UPIpage> createState() => _UPIpageState();
}

class _UPIpageState extends State<UPIpage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String validPin = "1234";

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
          Text("Enter Your UPI Pin", style: TextStyle(fontWeight: FontWeight.bold),),
          Center(child: _pininputForm())
        ],
      ),
    );
  }
  Widget _pininputForm() {
    return Form(
        key: formKey,
        child: Column(children: [
          Pinput(
            validator: (value) {
              return value == validPin ? null : "Pin is incorrect";
            },
            errorBuilder: (errorText, pin) {
              return Padding(padding: EdgeInsets.symmetric(vertical: 10.0,),
                child: Center(child: Text(errorText ?? "", style: const TextStyle(color: Colors.red),
                ),
                ),
              );
            },
            onCompleted: (pin) {
              if(pin==validPin) {
                Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => success()),);
              }
            },
          ),
          TextButton(onPressed: () {
            formKey.currentState!.validate();
          },
            child: const Text("PROCEED"), )
        ],)
    );
  }
}
