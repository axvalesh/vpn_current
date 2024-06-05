import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/features/vpn/views/connect_page.dart';

class Subscription {
  String id;
  String title;
  String description;
  String price;
  Function onPurchase;

  Subscription({
    required this.id,
    required this.price,
    required this.description,
    required this.title,
    required this.onPurchase,
  });
}

Future<List<Subscription>> getSubscriptions() async {
  bool setDefault = false;
  var offerings;
  List<Subscription> subscriptions = [];
  final _configuration = PurchasesConfiguration(Platform.isAndroid
    ? 'goog_QGaMqHuUWIQIzUSTkCHWSMRWwJJ'
    : "appl_wmyMuTRyIFXvflcaHPhLAdUBQGy");

  try {
    debugPrint('----------- before getting offers');
    await Purchases.configure(_configuration);
    offerings = await Purchases.getOfferings();
    debugPrint('-----------');
    debugPrint('offering is $offerings');
    debugPrint('-----------');
  } catch (e) {
    debugPrint('error is while gettings offerings $e');
    setDefault = true;
  }

  if (!setDefault && offerings.current != null) {
    final List<Package> packages = offerings.current!.availablePackages;

    packages.forEach((package) {
      StoreProduct product = package.storeProduct;
      subscriptions.add(Subscription(
          id: product.identifier,
          title: product.title.split(' (')[0],
          description: product.description,
          price: product.priceString,
          onPurchase: (BuildContext context) async {
            try {
             
              await Purchases.purchasePackage(package);
              await SUBSCRIPTION_CUBIT.setSubsctibeTrue(); 
              Navigator.popAndPushNamed(context, ConnectPage.route);
              return true;
            } catch (e) {
              print('CANCEL PURCHASE');
            }
            return false;
          }));
    });
  }

  if (subscriptions.isEmpty) {
    subscriptions.add(
      Subscription(
        id: 'accessvpn_5_1m',
        price: '\$4.99',
        title: "Premium",
        description: "Unlimited VPN servers",
        onPurchase: () async {
          await Purchases.purchaseProduct('accessvpn_5_1m'); 
        },
      ),
    );
  }
  return subscriptions;
}
