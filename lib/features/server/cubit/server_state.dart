part of 'server_cubit.dart';

class ServerState {
  final List<ServerModel> servers;
  final ServerModel? selectedServer;

  ServerState({
    List<ServerModel>? servers,
    this.selectedServer,
  }) : servers = servers ?? <ServerModel>[];

  List<ServerModel> get freeServers {
    return servers.where((server) => server.cost == 0).toList();
  }

  Map<String, List<ServerModel>> get freeServersByCountry {
    Map<String, List<ServerModel>> freeServersByCountry = {};

    for (ServerModel server in freeServers) {
      if (freeServersByCountry[server.country] == null) {
        freeServersByCountry[server.country] = [];
      }
      freeServersByCountry[server.country]!.add(server);
    }

    return freeServersByCountry;
  }

  List<ServerModel> get premiumServers {
    return servers.where((server) => server.cost < 0).toList();
  }

  Map<String, List<ServerModel>> get premiumServersByCountry {
    Map<String, List<ServerModel>> premiumServersByCountry = {};

    for (ServerModel server in premiumServers) {
      if (premiumServersByCountry[server.country] == null) {
        premiumServersByCountry[server.country] = [];
      }
      premiumServersByCountry[server.country]!.add(server);
    }

    return premiumServersByCountry;
  }

  List<ServerModel> get personalServers {
    return servers.where((server) => server.cost > 0).toList();
  }
}


