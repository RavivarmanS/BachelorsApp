class House{
  String imageUrl;
  String address;
  String discription;
  double price;
  int bedrooms;
  int bathrooms;
  double sqFeet;
  int garages;
  int time;
  List<String> moreImageUrl;
  bool isFav;

  House({
    required this.imageUrl,
    required this.address,
    required this.discription,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.sqFeet,
    required this.garages,
    required this.time,
    required this.moreImageUrl,
    required this.isFav,
});
}