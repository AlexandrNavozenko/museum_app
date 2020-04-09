import 'package:flutter/material.dart';
import 'package:museum_app/manager/TourInfoFeedbackManager.dart';
import 'package:museum_app/ui/TourInfoPage.dart';
import 'package:museum_app/utility/Provider.dart';
import 'package:museum_app/utility/RxTextField.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TourInfoFeedbackWidget extends StatefulWidget {
  @override
  _TourInfoFeedbackWidgetState createState() => _TourInfoFeedbackWidgetState();
}

class _TourInfoFeedbackWidgetState extends State<TourInfoFeedbackWidget> {
  double rating = 2;

  @override
  Widget build(BuildContext context) {
    TourInfoFeedbackManager manager =
        Provider.of(context).fetch(TourInfoFeedbackManager);

    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Your feedback is important to us! Please leave a message about your experients today.',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).cardColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            ListTile(
              title: RxTextField(
                subscribe: manager.body$,
                dispatch: manager.setBody,
                decoration: InputDecoration(
                  labelText: 'BODY',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                maxLines: 3,
              ),
            ),
            ListTile(
              title: StreamBuilder(
                stream: manager.rating$,
                builder: ((context, snapshot) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'RATING:',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                        SmoothStarRating(
                          allowHalfRating: false,
                          onRatingChanged: (value) {
                            setState(() {
                              manager.setRating(value);
                              rating = value;
                              print(value);
                            });
                          },
                          starCount: 5,
                          rating: rating,
                          size: 40.0,
                          color: Colors.yellow,
                          borderColor: Colors.yellowAccent,
                          spacing: 0.0,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Divider(),
            ListTile(
              title: StreamBuilder(
                stream: manager.isFormValid$,
                builder: ((context, snapshot) {
                  return RaisedButton(
                    child: Text(
                      'SEND',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onPressed: () {
                      if (snapshot.hasData) {
                        print(manager.submit());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => TourInfoPage(),
                          ),
                        );
                      } else {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Your message is not valid'),
                            backgroundColor: Colors.red[600],
                          ),
                        );
                      }
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
