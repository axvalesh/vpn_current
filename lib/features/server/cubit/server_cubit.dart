import 'dart:core';
import 'package:bloc/bloc.dart';

import '../models/models.dart';

part 'server_state.dart';

List<ServerModel> servers = [
  //personal servers
  ServerModel(
    id: '0',
    region: 'Florida',
    country: 'United States',
    cost: 39.99,
    purchased: true,
    availableCount: 3,
    purchasedCount: 2,
  ),
  ServerModel(
    id: '1',
    region: 'Hauts-de-France',
    country: 'France',
    cost: 19.99,
    purchased: false,
    availableCount: 4,
    purchasedCount: 1,
  ),
  ServerModel(
    id: '2',
    region: 'California',
    country: 'United States',
    cost: 29.99,
    purchased: false,
    availableCount: 2,
    purchasedCount: 2,
  ),
  // free
  ServerModel(
    id: '3',
    region: 'Florida',
    country: 'United States',
  ),
  ServerModel(
    id: '4',
    region: 'Hauts-de-France',
    country: 'France',
  ),
  ServerModel(
    id: '5',
    region: 'California',
    country: 'United States',
  ),
  // premium
  ServerModel(
    id: '6',
    region: 'Florida',
    country: 'United States',
    cost: -1,
  ),
  ServerModel(
    id: '7',
    region: 'Hauts-de-France',
    country: 'France',
    cost: -1,
  ),
  ServerModel(
    id: '8',
    region: 'California',
    country: 'United States',
    cost: -1,
  ),
];

class ServerCubit extends Cubit<ServerState> {
  ServerCubit() : super(ServerState(servers: servers));

  void selectServer(ServerModel server) {
    emit(ServerState(servers: state.servers, selectedServer: server));
  }
}
