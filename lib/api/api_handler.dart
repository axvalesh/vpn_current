import 'package:flutter/material.dart';
import 'package:sebek_vpn/bloc/global.dart';
import 'package:sebek_vpn/bloc/settings_cubit.dart';
import 'package:sebek_vpn/bloc/subscription_cubit.dart';
import 'package:sebek_vpn/features/notifications/cubit/notifications_cubit.dart';
import 'package:sebek_vpn/models/notification.dart';
import 'package:sebek_vpn/models/server.dart';
import 'package:sebek_vpn/service/service.dart';
import 'package:sebek_vpn/service/user_shared_storage.dart';
import 'package:sebek_vpn/subscriptions.dart';

import 'api_core.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  APICore apiCore = APICore();

  firebase({firebase}) async {
    Map data = {
      "firebase_token": firebase,
    };
    await apiCore.firebase(data);
  }

  getCredentials(Server server) async {
    var serverData = await apiCore.getCredentials(server);
    if (serverData['message'] != null) {
      return;
    }

    var response = await http.get(
      Uri.parse(getFileUrl(serverData['config_tcp'])),
    );
    serverData['config_tcp'] = response.body;

    response = await http.get(
      Uri.parse(getFileUrl(serverData['config_udp'])),
    );
    serverData['config_udp'] = response.body;

    return serverData;
  }

  getServers() async {
    List serversData = await apiCore.getServers();

    serversData.forEach((element) {
      List<SimpleServer> servers = [];

      element['servers'].forEach((serverElement) {
        servers.add(SimpleServer(
          id: serverElement['id'],
          ip: serverElement['ip'],
          title: serverElement['title'],
          subTitle: element['title'],
          users: serverElement['users'],
          maxUsers: serverElement['max_users'],
          image: element['icon']['image'],
          isPremium: element['type'] == 'premium',
        ));
      });

      SimpleLocation location = SimpleLocation(
        element['id'],
        element['type'],
        element['title'],
        element['icon']['image'],
        element['recommend'],
        servers,
      );

      SERVER_CUBIT.state.locations.add(location);
      SERVER_CUBIT.state.selectedServer ??= location.servers[0];
    });

    var currentServer = UserSharedStorage.getCurrentServer();
    for (SimpleLocation location in SERVER_CUBIT.state.locations) {
      for (Server server in location.servers) {
        if (server.id == currentServer) {
          SERVER_CUBIT.state.selectedServer = server;
        }
      }
    }

    getServersPing();
  }

  getPersonalServers() async {
    List serversData = await apiCore.getPersonalServers();

    serversData.forEach((element) {
      PersonalLocation location = PersonalLocation(
        element['id'],
        element['title'],
        element['sub_title'],
        element['icon']['image'],
        [],
      );
      for (Map serverData in element['servers']) {
        PersonalServer server = PersonalServer(
          id: serverData['id'],
          ip: serverData['ip'],
          title: serverData['title'],
          subTitle: element['sub_title'],
          price: serverData['price'],
          owners: serverData['owners'].length,
          maxOwners: serverData['max_owners'],
          image: "",
        );
        location.servers.add(server);
      }
      SERVER_CUBIT.state.personalLocations.add(location);
    });
  }

  getUserPersonalServers() async {
    List serversData = await apiCore.getUserPersonalServers();

    serversData.forEach((element) {
      PersonalServer server = PersonalServer(
        id: element['id'],
        ip: element['ip'],
        title: element['title'],
        subTitle: element['location']['sub_title'],
        price: element['price'],
        owners: element['owners'].length,
        maxOwners: element['max_owners'],
        image: element['location']['icon']['image'],
      );
      SERVER_CUBIT.state.userPersonalServers.add(server);
    });
  }

  changeSettings(enable) async {
    Map data = {"enable_notifications": enable};

    await apiCore.changeSettings(data);
  }

  changePassword(password) async {
    return await apiCore.changePassword(password);
  }

  recoverPassword(password) async {
    return await apiCore.recoverPassword(
      PASSWORD_RECOVERY_CUBIT.state.email,
      PASSWORD_RECOVERY_CUBIT.state.code,
      password,
    );
  }

  // saveData(ping, serverId, isPersonal) async {
  //   await apiCore.saveData(ping, serverId, isPersonal: isPersonal);
  // }

  getNotifications(NotificationsCubit cubit) async {
    List result = await apiCore.getNotifications();

    List<Notify> notifications = [];
    for (Map notify in result.take(10)) {
      notifications.add(Notify(
        title: notify['title'],
        text: notify['text'],
        date: notify['created_at'],
      ));
    }

    cubit.loadList(notifications);
  }

  getSettings() async {
    Map result = await apiCore.settings();
    Settings settings = Settings(
      playStoreLink: result['play_store_link'],
      appleStoreLink: result['apple_store_link'],
    );
    APP_SETTINGS_CUBIT.state.settings = settings;
  }

  getSubscription() async {
    var result = await apiCore.session();
    SUBSCRIPTION_CUBIT.state.isSubscribe = result['user']['is_subscribe'];

    debugPrint('is subscribe equal to ${SUBSCRIPTION_CUBIT.state.isSubscribe}');

    List<Subscription> subscriptions = await getSubscriptions();
    SUBSCRIPTION_CUBIT.state.subscriptions = subscriptions;

    result = await apiCore.subscription();
    if (result != null) {
      CurrentSubscription currentSub = CurrentSubscription(
        endTime: result['end_time'],
        paymentService: result['payment_service'],
        subscribeType: result['subscribe_type'],
        isFreeTrialUsed: result['is_free_trial_used'],
      );
      SUBSCRIPTION_CUBIT.state.currentSub = currentSub;
    }
  }
}

APIHandler apiHandler = APIHandler();
