class HouseForRent {
  final String id;
  final String houseName;
  final String address;
  final String location;
  final String bhk;
  final bool bikeParking;
  final bool carParking;
  final bool noParking;
  final String rentAmount;
  final String advanceAmount;
  final String phoneNumber;
  final List<String> imageUrls;
  final double rating; // Add this field

  HouseForRent({
    required this.id,
    required this.houseName,
    required this.address,
    required this.location,
    required this.bhk,
    required this.bikeParking,
    required this.carParking,
    required this.noParking,
    required this.rentAmount,
    required this.advanceAmount,
    required this.phoneNumber,
    required this.imageUrls,
    required this.rating, // Add this field
  });
}
