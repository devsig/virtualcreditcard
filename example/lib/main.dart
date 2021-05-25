import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:virtualcreditcard/virtualcreditcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('VirtualCreditCard example app'),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("With BoxShadow"),
                  VirtualCreditCard(
                      cardNumber: "4111 1111 1111 1111",
                      cardHolderName: "Bholendra Singh",
                      expiryMonth: "06",
                      expiryYear: "2025",
                      showShadow: true,
                      backgroundColor: Colors.orange,
                      cvv: "123"),
                  Text("Without BoxShadow"),
                  VirtualCreditCard(
                      cardNumber: "5596 0100 4242 4242",
                      cardHolderName: "Bholendra Singh",
                      expiryMonth: "06",
                      expiryYear: "2025",
                      showShadow: false,
                      cvv: "123"),
                  VirtualCreditCard(
                      cardNumber: "3714 496353 98431",
                      cardHolderName: "Bholendra Singh",
                      expiryMonth: "06",
                      expiryYear: "2025",
                      showShadow: false,
                      backgroundColor: Colors.blue,
                      cvv: "123"),
                  VirtualCreditCard(
                      cardNumber: "6011 0009 9013 9424",
                      cardHolderName: "Bholendra Singh",
                      expiryMonth: "06",
                      expiryYear: "2025",
                      showShadow: false,
                      backgroundColor: Colors.red,
                      cvv: "123"),
                  VirtualCreditCard(
                      cardNumber: "3852 0000 0232 37",
                      cardHolderName: "Bholendra Singh",
                      expiryMonth: "06",
                      expiryYear: "2025",
                      showShadow: false,
                      backgroundColor: Colors.lightGreen,
                      cvv: "123"),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
