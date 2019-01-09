import 'package:flutter/material.dart';

class PhotoBrowser extends StatefulWidget {

  final List<String> photoAssetPaths;
  final int visiblePhotoIndex;

  PhotoBrowser({
    this.photoAssetPaths,
    this.visiblePhotoIndex
  });

  @override
  _PhotoBrowserState createState() => new _PhotoBrowserState();
}

class _PhotoBrowserState extends State<PhotoBrowser>  {
  int visiblePhotoIndex;

  @override
  void initState(){
    super.initState();
    visiblePhotoIndex = widget.visiblePhotoIndex;
  }

  @override 
  void didUpdateWidget(PhotoBrowser oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.visiblePhotoIndex != oldWidget.visiblePhotoIndex){
      setState((){
        visiblePhotoIndex = widget.visiblePhotoIndex;
      });
    }
  }

  void _prevImage() {
      setState((){
        visiblePhotoIndex = visiblePhotoIndex > 0 ? visiblePhotoIndex - 1 : 0;
      });
  }

  void _nextImage() {
      setState((){
        visiblePhotoIndex = visiblePhotoIndex < widget.photoAssetPaths.length - 1  
        ? visiblePhotoIndex + 1 
        : visiblePhotoIndex;
      });
  }

  Widget _buildImageControls() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GestureDetector(
          onTap: _prevImage,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.transparent
            )
          )
        ),
        GestureDetector(
          onTap: _nextImage,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.transparent
            )
          )
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          widget.photoAssetPaths[visiblePhotoIndex],
          fit: BoxFit.cover
        ),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: SelectedPhotoIndicator(
             photoCount: widget.photoAssetPaths.length,
             visiblePhotoIndex: visiblePhotoIndex,
          )
        ),
        _buildImageControls(),
      ],
    );
  }
}

class SelectedPhotoIndicator extends StatelessWidget {
  final int photoCount;
  final int visiblePhotoIndex;

  SelectedPhotoIndicator({
    this.photoCount,
    this.visiblePhotoIndex
  });

  Widget _buildInactiveIndicator() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        child: Container(
          height: 3.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(2.5)
          ),
        )
      ),
    );
  }

  Widget _buildActiveIndicator() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        child: Container(
          height: 3.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.5),
            boxShadow: [ 
              BoxShadow(
                color: Color(0x11000000),
                spreadRadius: 0.0,
                blurRadius: 2.0,
                offset: Offset(0.0, 0.1)
              )
            ]
          ),
        )
      ),
    ); 
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for(int i = 0; i < photoCount; ++i) {
      indicators.add(
        i == visiblePhotoIndex ? _buildActiveIndicator() : _buildInactiveIndicator()
      );
    }
    return indicators;
  }
      

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: new Row(
        children: _buildIndicators(),
        )
    );
  }

}
