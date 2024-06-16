class Food {
  String name;
  String price;
  String imagepath;
  String rating;
  String description;

  Food(
      {required this.name,
      required this.price,
      required this.imagepath,
      required this.rating,
      required this.description});

  String get _name => name;
  String get _price => price;
  String get _imagepath => imagepath;
  String get _rating => rating;
}
