import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sebek_vpn/models/server.dart';


class ServerCubit extends Cubit<ServerState> {
  ServerCubit() : super(ServerState());

  changeServer(id, ping) {
    var newState = ServerState();
    List<SimpleLocation> locations = state.locations;
    for (SimpleLocation location in locations) {
      for (SimpleServer server in location.servers) {
        if (server.id == id) {
          server.ping = ping;
          break;
        }
      }
    }

    newState.locations = locations;
    newState.userPersonalServers = state.userPersonalServers;
    newState.personalLocations = state.personalLocations;
    newState.selectedBuyServer = state.selectedBuyServer;
    newState.buySearch = state.buySearch;
    newState.selectedServer = state.selectedServer;
    newState.search = state.search;
    emit(newState);
  }

  selectServer(Server server) {
    var newState = ServerState();
    newState.locations = state.locations;
    newState.userPersonalServers = state.userPersonalServers;
    newState.personalLocations = state.personalLocations;
    newState.buySearch = state.buySearch;
    newState.selectedBuyServer = state.selectedBuyServer;
    newState.selectedServer = server;
    newState.search = state.search;
    emit(newState);
  }

  searchServer(String search) {
    debugPrint('search');
    var newState = ServerState();
    newState.locations = state.locations;
    newState.userPersonalServers = state.userPersonalServers;
    newState.personalLocations = state.personalLocations;
    newState.buySearch = state.buySearch;
    newState.selectedBuyServer = state.selectedBuyServer;
    newState.selectedServer = state.selectedServer;
    newState.search = search;
    emit(newState);
  }

  selectBuyServer(PersonalServer server) {
    var newState = ServerState();
    newState.locations = state.locations;
    newState.userPersonalServers = state.userPersonalServers;
    newState.personalLocations = state.personalLocations;
    newState.buySearch = state.buySearch;
    newState.selectedBuyServer = server;
    newState.selectedServer = state.selectedServer;
    newState.search = state.search;
    emit(newState);
  }

  searchBuyServer(String search) {
    var newState = ServerState();
    newState.locations = state.locations;
    newState.userPersonalServers = state.userPersonalServers;
    newState.personalLocations = state.personalLocations;
    newState.buySearch = search;
    newState.selectedBuyServer = state.selectedBuyServer;
    newState.selectedServer = state.selectedServer;
    newState.search = state.search;
    emit(newState);
  }
}

class ServerState {
  List<SimpleLocation> locations = [];
  List<PersonalServer> userPersonalServers = [];
  List<PersonalLocation> personalLocations = [];
  Server? selectedServer;
  PersonalServer? selectedBuyServer;
  String search = '';
  String buySearch = '';

  List<SimpleLocation> getAllLocations () {
    List<SimpleLocation> foundServers = [];
    for (SimpleLocation location in locations) {
      if (location.title.toLowerCase().contains(search.toLowerCase())) {
        foundServers.add(location);
      }
    }
    return foundServers;
  }

  List<SimpleLocation> getFreeRecommendLocations() {
    List<SimpleLocation> foundServers = [];
    for (SimpleLocation location in getFreeLocations()) {
      if (location.recommend) {
        foundServers.add(location);
      }
    }
    return foundServers;
  }

  List<SimpleLocation> getFreeLocations () {
    List<SimpleLocation> foundServers = [];
    for (SimpleLocation location in getAllLocations()) {
      if (location.type == 'free') {
        foundServers.add(location);
      }
    }
    return foundServers;
  }

  List<SimpleLocation> getPremiumLocations () {
    List<SimpleLocation> foundServers = [];
    for (SimpleLocation location in getAllLocations()) {
      if (location.type != 'free') {
        foundServers.add(location);
      }
    }
    return foundServers;
  }

  List<SimpleLocation> getPremiumRecommendLocations () {
    List<SimpleLocation> foundServers = [];
    for (SimpleLocation location in getPremiumLocations()) {
      if (location.recommend) {
        foundServers.add(location);
      }
    }
    return foundServers;
  }

  List<PersonalLocation> getPersonalLocations () {
    List<PersonalLocation> foundServers = [];
    for (PersonalLocation location in personalLocations) {
      if (location.title.contains(buySearch)) {
        foundServers.add(location);
      }
    }
    return foundServers;
  }

  List<PersonalServer> getUserPersonalLocations () {
    List<PersonalServer> foundServers = [];
    for (PersonalServer location in userPersonalServers) {
      if (location.title.contains(search)) {
        foundServers.add(location);
      }
    }
    return foundServers;
  }

  ServerState();
}