import 'package:flutter/material.dart';
import 'package:flutter_recipes_animation/core/widgets/animate_in_effect.dart';
import 'package:flutter_recipes_animation/features/ingrediants/widgets/ingrediant_item.dart';
import 'package:flutter_recipes_animation/features/recipes/model/recipe.dart';

class IngrediantsSection extends StatelessWidget {
  const IngrediantsSection(this.recipe, {Key? key}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipe.ingredients.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int i) {
        return AnimateIneffect(
          keepAlive: true,
          intervalStart: i / recipe.ingredients.length,
          child: IngredientItem(
            recipe,
            ingredient: recipe.ingredients[i],
          ),
        );
      },
    );
  }
}
