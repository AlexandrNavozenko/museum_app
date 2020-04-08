import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingBarWidget extends StatefulWidget {
  @override
  _RatingBarWidgetState createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  double rating = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Raiting:',
            ),
          ),
          SmoothStarRating(
            allowHalfRating: false,
            onRatingChanged: (value) {
              setState(() {
                rating = value;
              });
            },
            starCount: 5,
            rating: rating,
            size: 20.0,
            color: Colors.yellow,
            borderColor: Colors.yellowAccent,
            spacing: 0.0,
          ),
        ],
      ),
    );
  }
}
