import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TourInfoMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).cardColor,
      fontSize: 22.0,
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            child: Image.asset(
              'assets/images/museum_3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Text('Info', style: textStyle),
                  children: <Widget>[
                    Html(
                      data:
                          '"<b>Museum 1</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. <b>Lorem ipsum dolor sit amet, consectetur adipiscing elit</b>. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Curabitur sodales ligula in libero. <b>Lorem ipsum dolor sit amet, consectetur adipiscing elit</b>. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. <b>Mauris massa</b>. Maecenas mattis. <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit</i>. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit</i>. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ip. "',
                      padding: EdgeInsets.all(10.0),
                      defaultTextStyle: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('Work time', style: textStyle),
                  children: <Widget>[
                    Html(
                      data:
                          '"<b>Museum 1</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. <b>Lorem ipsum dolor sit amet, consectetur adipiscing elit</b>. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Curabitur sodales ligula in libero. <b>Lorem ipsum dolor sit amet, consectetur adipiscing elit</b>. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. <b>Mauris massa</b>. Maecenas mattis. <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit</i>. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit</i>. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ip. "',
                      padding: EdgeInsets.all(10.0),
                      defaultTextStyle: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('Ticket price', style: textStyle),
                  children: <Widget>[
                    Html(
                      data:
                          '"<b>Museum 1</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. <b>Lorem ipsum dolor sit amet, consectetur adipiscing elit</b>. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Curabitur sodales ligula in libero. <b>Lorem ipsum dolor sit amet, consectetur adipiscing elit</b>. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. <b>Mauris massa</b>. Maecenas mattis. <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit</i>. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit</i>. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ip. "',
                      padding: EdgeInsets.all(10.0),
                      defaultTextStyle: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
