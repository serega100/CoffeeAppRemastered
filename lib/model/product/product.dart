import 'package:coffee_app_remastered/data/id.dart';
import 'package:coffee_app_remastered/model/product/category.dart';
import 'package:coffee_app_remastered/model/product/volume_units.dart';
import 'package:flutter/material.dart';

class Product {
  Id<Product> id;
  String title;
  Category category;
  double volume;
  VolumeUnits volumeUnits;
  double price;
  ImageProvider image;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.volume,
    required this.volumeUnits,
    required this.price,
    required this.image,
  });
}