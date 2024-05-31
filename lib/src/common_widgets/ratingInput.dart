import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingWidget extends StatefulWidget {
  final String houseId;

  const RatingWidget({Key? key, required this.houseId}) : super(key: key);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double _rating = 0.0;
  int _totalRatings = 0;
  double _averageRating = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchRatingData();
  }

  Future<void> _fetchRatingData() async {
    final docSnapshot =
    await FirebaseFirestore.instance.collection('ratings').doc(widget.houseId).get();
    if (docSnapshot.exists) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      setState(() {
        _rating = data['rating'] ?? 0.0;
        _totalRatings = data['totalRatings'] ?? 0;
        _averageRating = data['averageRating'] ?? 0.0;
      });
    }
  }

  Future<void> _updateRating(double rating) async {
    final total = _totalRatings + 1;
    final average = ((_averageRating * _totalRatings) + rating) / total;

    await FirebaseFirestore.instance.collection('ratings').doc(widget.houseId).set({
      'rating': rating,
      'totalRatings': total,
      'averageRating': average,
    });

    setState(() {
      _rating = rating;
      _totalRatings = total;
      _averageRating = average;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: _rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            _updateRating(rating);
          },
        ),
        SizedBox(width: 8.0),
        Text(
          'Avg Rating: ${_averageRating.toStringAsFixed(1)} (${_totalRatings.toString()} ratings)',
          style: TextStyle(fontSize: 14.0), // Adjust font size as needed
        ),
      ],
    );
  }
}
