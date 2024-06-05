class Notify {
  String title;
  String text;
  String date;
  bool seen;

  Notify({
    required this.title,
    required this.text,
    required this.date,
    this.seen = false,
  });
}