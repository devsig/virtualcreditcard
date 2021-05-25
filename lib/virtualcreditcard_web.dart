import 'dart:async';
// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:virtualcreditcard/cardtype.dart';

class VirtualCreditCardWeb extends StatefulWidget {
  late String cardNumber;
  late String cardHolderName;
  late String expiryMonth;
  late String expiryYear;
  late String cvv;
  bool showShadow = false;
  late Color backgroundColor = Colors.blueGrey;

  VirtualCreditCardWeb(
      {required String cardNumber,
      required String cardHolderName,
      required String expiryMonth,
      required String expiryYear,
      required String cvv,
      bool? showShadow,
      Color? backgroundColor}) {
    this.cardNumber = cardNumber;
    this.cardHolderName = cardHolderName;
    this.expiryMonth = expiryMonth;
    this.expiryYear = expiryYear;
    this.cvv = cvv;
    if (showShadow != null) {
      this.showShadow = showShadow;
    }
    if (backgroundColor != null) {
      this.backgroundColor = backgroundColor;
    }
  }

  @override
  _VirtualCreditCardWebState createState() => _VirtualCreditCardWebState();
}

class _VirtualCreditCardWebState extends State<VirtualCreditCardWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.showShadow
          ? BoxDecoration(
              color: widget.backgroundColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: widget.backgroundColor.withOpacity(0.1),
                  offset: Offset(0, 0),
                  blurRadius: 5,
                ),
              ],
            )
          : null,
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      padding:
          widget.showShadow ? EdgeInsets.only(right: 20, bottom: 20) : null,
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width - 60,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: getCardTypeIcon(widget.cardNumber)),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Card Number",
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.cardNumber,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Valid Thur",
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.expiryMonth,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "/",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.expiryYear,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "CVV",
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.cvv,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.cardHolderName,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }

  Widget getCardTypeIcon(String cardNumber) {
    Widget icon;
    switch (detectCCType(cardNumber)) {
      case CardType.visa:
        icon = Image.asset(
          'icons/visa.png',
          height: 50,
          width: 50,
          package: 'virtualcreditcard',
        );
        break;

      case CardType.americanExpress:
        icon = Image.asset(
          'icons/amex.png',
          height: 50,
          width: 50,
          package: 'virtualcreditcard',
        );
        break;

      case CardType.mastercard:
        icon = Image.asset(
          'icons/mastercard.png',
          height: 50,
          width: 50,
          package: 'virtualcreditcard',
        );
        break;

      case CardType.discover:
        icon = Image.asset(
          'icons/discover.png',
          height: 50,
          width: 50,
          package: 'virtualcreditcard',
        );
        break;

      default:
        icon = Image.asset(
          'icons/chip.png',
          height: 50,
          width: 50,
          package: 'virtualcreditcard',
        );
        break;
    }

    return icon;
  }

  Map<CardType, Set<List<String>>> cardNumPatterns =
      <CardType, Set<List<String>>>{
    CardType.visa: <List<String>>{
      <String>['4'],
    },
    CardType.americanExpress: <List<String>>{
      <String>['34'],
      <String>['37'],
    },
    CardType.discover: <List<String>>{
      <String>['6011'],
      <String>['622126', '622925'],
      <String>['644', '649'],
      <String>['65']
    },
    CardType.mastercard: <List<String>>{
      <String>['51', '55'],
      <String>['2221', '2229'],
      <String>['223', '229'],
      <String>['23', '26'],
      <String>['270', '271'],
      <String>['2720'],
    },
  };

  CardType detectCCType(String cardNumber) {
    //Default card type is other
    CardType cardType = CardType.otherBrand;

    if (cardNumber.isEmpty) {
      return cardType;
    }

    cardNumPatterns.forEach(
      (CardType type, Set<List<String>> patterns) {
        for (List<String> patternRange in patterns) {
          // Remove any spaces
          String ccPatternStr =
              cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');
          final int rangeLen = patternRange[0].length;
          // Trim the Credit Card number string to match the pattern prefix length
          if (rangeLen < cardNumber.length) {
            ccPatternStr = ccPatternStr.substring(0, rangeLen);
          }

          if (patternRange.length > 1) {
            // Convert the prefix range into numbers then make sure the
            // Credit Card num is in the pattern range.
            // Because Strings don't have '>=' type operators
            final int ccPrefixAsInt = int.parse(ccPatternStr);
            final int startPatternPrefixAsInt = int.parse(patternRange[0]);
            final int endPatternPrefixAsInt = int.parse(patternRange[1]);
            if (ccPrefixAsInt >= startPatternPrefixAsInt &&
                ccPrefixAsInt <= endPatternPrefixAsInt) {
              // Found a match
              cardType = type;
              break;
            }
          } else {
            // Just compare the single pattern prefix with the Credit Card prefix
            if (ccPatternStr == patternRange[0]) {
              // Found a match
              cardType = type;
              break;
            }
          }
        }
      },
    );

    return cardType;
  }
}
