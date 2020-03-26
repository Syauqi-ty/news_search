import 'package:flutter/material.dart';

class Slide{
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title, 
    @required this.description
    });
}

final slideList = [
  Slide(
    imageUrl: 'assets/gambar1.png',
    title: 'Flexible News',
    description: 'Now you can read the news everytime anywhere'
  ),
  Slide(
    imageUrl: 'assets/bintang.png',
    title: '5 Star News',
    description: 'News that we show in this application is a good news with a good quality'
  ),
  Slide(
    imageUrl: 'assets/gambar2.jpg',
    title: 'Filtered News',
    description: 'We always filter our news, so there is no hoax on the news that you read'
  ),
];