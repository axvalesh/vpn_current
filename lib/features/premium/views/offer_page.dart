import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/common_widgets/accent_button.dart';
import 'package:sebek_vpn/constants/colors.dart';
import 'package:sebek_vpn/constants/locale_keys.g.dart';
import 'package:sebek_vpn/features/server/server.dart';
import 'package:sebek_vpn/features/vpn/views/connect_page.dart';
import 'package:sebek_vpn/subscriptions.dart';

import '../widgets/widgets.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  static const String route = '/vpn/offer';

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('update page offer ${SUBSCRIPTION_CUBIT.state.isSubscribe} ${SUBSCRIPTION_CUBIT.isSubscribed()}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 56,
        leading: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            LocaleKeys.offer_page_skip,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: SebekColors.tertiary,
            ),
          ).tr(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 344,
              child: Stack(
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    top: -100,
                    bottom: -100,
                    child: Image.asset('assets/images/premium_picture.png'),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              SUBSCRIPTION_CUBIT.isSubscribed()
                  ? Column(
                      children: [
                        for (Subscription subscription
                            in SUBSCRIPTION_CUBIT.state.subscriptions)
                          OfferCard(
                            onTap: () {},
                            name: subscription.title,
                            description: subscription.description,
                            price: SUBSCRIPTION_CUBIT.state.currentSub!.endTime,
                            margin: const EdgeInsets.only(
                                bottom: 16, left: 16, right: 16),
                          ),
                      ],
                    )
                  : Column(
                      children: [
                        for (Subscription subscription
                            in SUBSCRIPTION_CUBIT.state.subscriptions)
                          OfferCard(
                            onTap: () async {
                              debugPrint('trying to buy ${subscription.id} .${subscription.price}. ${subscription.title}');
                              try {
                                
                                 await subscription.onPurchase(context);
                                
                              } catch(e) {
                                debugPrint('error is $e');
                               
                              }
                            },
                            name: subscription.title,
                            description: subscription.description,
                            price: subscription.price,
                            renewalFrequency:
                                LocaleKeys.offer_page_offers_premium_per.tr(),
                            margin: const EdgeInsets.only(
                                bottom: 16, left: 16, right: 16),
                          ),
                      ],
                    ),
              OfferCard(
                onTap: () =>
                    Navigator.pushNamed(context, BuyPersonalServerPage.route),
                name: LocaleKeys.offer_page_offers_personal_title.tr(),
                description:
                    LocaleKeys.offer_page_offers_personal_description.tr(),
                //TODO: get price from revenuecat
                price:
                    '${LocaleKeys.offer_page_offers_personal_from.tr()} \$14.00',
                renewalFrequency:
                    LocaleKeys.offer_page_offers_personal_per.tr(),
                margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              ),
              SUBSCRIPTION_CUBIT.isSubscribed()
                  ? SizedBox()
                  : AccentButton(
                      onTap: () async {
                        if(Platform.isIOS) {
                          debugPrint('buy free trial accessvpn_5_1m_free_trial');
                         
                          await Purchases.purchaseProduct('accessvpn_5_1m_free_trial'); 
                          await SUBSCRIPTION_CUBIT.setSubsctibeTrue();
                           Navigator.popAndPushNamed(context, ConnectPage.route);
                          return;
                        }
                        await SUBSCRIPTION_CUBIT.state.subscriptions[0]
                            .onPurchase();
                      },
                      borderRadius: BorderRadius.circular(24),
                      expanded: true,
                      margin: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 26),
                      text: SUBSCRIPTION_CUBIT.state.currentSub == null ||
                              !SUBSCRIPTION_CUBIT
                                  .state.currentSub!.isFreeTrialUsed
                          ? LocaleKeys.offer_page_offers_trial.tr()
                          : LocaleKeys.connect_page_offer_title.tr(),
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Text(
                  LocaleKeys.offer_page_footer,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: SebekColors.tertiary,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ).tr(),
              )
            ],
          )
        ],
      ),
    );
  }
}
