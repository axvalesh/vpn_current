abstract class Server {
  String id;
  String ip;
  String title;
  String subTitle;
  int? ping;
  String image;
  bool isPersonal;
  bool isPremium;

  Server(this.id, this.ip, this.title, this.subTitle, this.ping, this.image,
      {this.isPersonal = false, this.isPremium = false,});
}

abstract class Location {}

class SimpleServer extends Server {
  int users;
  int maxUsers;

  SimpleServer(
      {required this.users,
      required this.maxUsers,
      required id,
      required ip,
      required title,
      required subTitle,
      ping,
      required image,
      isPremium})
      : super(id, ip, title, subTitle, ping, image, isPremium: isPremium);
}

class SimpleLocation extends Location {
  String id;
  String type;
  String title;
  String image;
  bool recommend;
  List<SimpleServer> servers;

  SimpleLocation(
      this.id, this.type, this.title, this.image, this.recommend, this.servers);
}

class PersonalServer extends Server {
  double price;
  int owners;
  int maxOwners;
  bool isPersonal;

  PersonalServer(
      {required this.price,
      required this.owners,
      required this.maxOwners,
      required id,
      required ip,
      required title,
      required subTitle,
      ping,
      required image,
      this.isPersonal = true})
      : super(id, ip, title, subTitle, ping, image);
}

class PersonalLocation extends Location {
  String id;
  String title;
  String subTitle;
  String image;
  List<PersonalServer> servers;

  PersonalLocation(
      this.id, this.title, this.subTitle, this.image, this.servers);
}
