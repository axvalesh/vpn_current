import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:jiffy/jiffy.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:sebek_vpn/api/api_handler.dart';
import 'package:sebek_vpn/subscriptions.dart';

class CurrentSubscription {
  String endTime;
  String paymentService;
  String subscribeType;
  bool isFreeTrialUsed;

  CurrentSubscription({
    required this.endTime,
    required this.paymentService,
    required this.subscribeType,
    required this.isFreeTrialUsed,
  });
}

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionState());

  isSubscribed() {
    return state.currentSub != null && state.isSubscribe;
  }

  setSubsctibeTrue() async {
    APIHandler apiHandler = APIHandler();
    await apiHandler.getSubscription();
  }
}

class SubscriptionState {
  bool isSubscribe;
  List<Subscription> subscriptions;
  CurrentSubscription? currentSub;

  SubscriptionState({
    this.isSubscribe = false,
    this.subscriptions = const [],
    this.currentSub,
  });
}
