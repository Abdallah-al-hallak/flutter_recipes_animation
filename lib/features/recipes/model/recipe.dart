import 'package:flutter/material.dart';
import 'package:flutter_recipes_animation/gen/assets.gen.dart';

class Recipe {
  final int id;
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  final String image;
  final String bgImageName;
  final Color bgColor;

  const Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.image,
    required this.bgImageName,
    required this.bgColor,
  });

  String get bgImage =>
      bgImageName.isEmpty ? '' : Assets.images.desserts.lemoncheesecakebg.path;

  String get bgImageLg =>
      bgImageName.isEmpty ? '' : Assets.images.desserts.lemoncheesecakebgg.path;
}
