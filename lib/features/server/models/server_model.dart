
class ServerModel {
  final String id;
  final String region;
  final String country;
  final double cost;
  final bool purchased;
  final int? availableCount;
  final int? purchasedCount;

  ServerModel({
    required this.id,
    required this.region,
    required this.country,
    this.cost = 0,
    this.purchased = false,
    this.availableCount,
    this.purchasedCount,
  });
}
