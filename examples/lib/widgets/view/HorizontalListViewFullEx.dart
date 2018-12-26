import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

final imageFeatured = 'assets/images/dog.jpeg';

void main() => runApp(new HorizontalListViewFullEx());

class HorizontalListViewFullEx extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<HorizontalListViewFullEx> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HorizontalListView Example',
      home: new Container(
        child: new Column(
          children: <Widget>[
            new HomeScreen(),
          ],
        ),
      )
    );
  }
 
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new SizedBox(height: MediaQuery
              .of(context)
              .padding
              .top),
            new HorizontalFeaturedItems(
              viewportFraction: (1.0 / 2.6),
              aspectRatio: 2.0,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              itemCount: 6,
              itemBuilder: this._buildFeaturedItems,
            ),
          ],
        ),
      )
    );
  }

  Widget _buildFeaturedItems(BuildContext context, int index) {
    switch (index) {
      case 0 :
        return new FeaturedItem(title: 'Business Management', price: '\$19.99',
          child: new Image.asset(imageFeatured, fit: BoxFit.cover),
          onTap: () => _featureCallback(index),
        );
      case 1:
        return new FeaturedItem(title: 'Learn How To Play Guitar', price: '\$16.99',
          child: new Image.asset(imageFeatured, fit: BoxFit.cover),
          onTap: () => _featureCallback(index),
        );
      case 2:
        return new FeaturedItem(title: 'Medicine & Biology Basics', price: '\$10.98',
          child: new Image.asset(imageFeatured, fit: BoxFit.cover),
          onTap: () => _featureCallback(index),
        );
      default:
        return new FeaturedItem(title: 'Item\n#$index', price: '\$99.00',
          child: new Container(color: Colors.teal[400]),
          onTap: () => _featureCallback(index),
        );
    }
  }

  _featureCallback(int featureIndex) {
    print("Feature #$featureIndex selected.");
  }
  
}


class FeaturedItem extends StatelessWidget {
  final String title;
  final String price;
  final VoidCallback onTap;
  final Widget child;

  FeaturedItem({
    @required this.title,
    @required this.price,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new Material(
              elevation: 12.0,
              borderRadius: new BorderRadius.circular(10.0),
              child: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  this.child,
                  new Material(
                    type: MaterialType.transparency,
                    child: new InkWell(onTap: this.onTap),
                  ),
                ],
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: new Text(this.title),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: new Text(this.price, style: new TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class HorizontalFeaturedItems extends StatelessWidget {
  final int initialPage;
  final double aspectRatio;
  final double viewportFraction;
  final EdgeInsetsGeometry padding;
  final SliverChildDelegate childrenDelegate;

  HorizontalFeaturedItems({
    Key key,
    this.initialPage: 0,
    this.aspectRatio: 1.0,
    this.viewportFraction: 1.0,
    this.padding,
    @required IndexedWidgetBuilder itemBuilder,
    int itemCount,
    bool addAutomaticKeepAlives: true,
    bool addRepaintBoundaries: true,
  })
    : childrenDelegate = new SliverChildBuilderDelegate(
    itemBuilder,
    childCount: itemCount,
    addAutomaticKeepAlives: addAutomaticKeepAlives,
    addRepaintBoundaries: addRepaintBoundaries,
  ),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final double itemWidth = (constraints.maxWidth - padding.horizontal) * this.viewportFraction;
      final double itemHeight = (itemWidth * this.aspectRatio);
      return new Container(
        height: itemHeight,
        child: new ListView.custom(
          scrollDirection: Axis.horizontal,
          controller: new PageController(
            initialPage: this.initialPage,
            viewportFraction: this.viewportFraction,
          ),
          physics: const PageScrollPhysics(),
          padding: this.padding,
          itemExtent: itemWidth,
          childrenDelegate: this.childrenDelegate,
        ),
      );
    });
  }
}
