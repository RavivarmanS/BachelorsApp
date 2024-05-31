class HouseRent {

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
   // Add this field

  HouseRent({

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
    // Add this field
  });
}
