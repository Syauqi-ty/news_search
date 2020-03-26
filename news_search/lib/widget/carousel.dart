import 'package:flutter/material.dart';
import 'package:news_search/model/slide.dart';

class Carousel extends StatelessWidget {
  final int index;
  Carousel(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(slideList[index].imageUrl),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          slideList[index].title,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
