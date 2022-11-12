import 'package:flutter/material.dart';
import 'package:flutter_recipes_animation/core/enums/screen_size.dart';
import 'package:flutter_recipes_animation/core/styles/app_colors.dart';
import 'package:flutter_recipes_animation/features/recipes/model/recipe.dart';
import 'package:flutter_recipes_animation/features/recipes/recipes_layout.dart';
import 'package:flutter_recipes_animation/features/recipes/views/recipe_page.dart';
import 'package:flutter_recipes_animation/features/recipes/widget/recipe_image.dart';
import 'package:flutter_recipes_animation/features/recipes/widget/recipe_list_item_gesturedetector.dart';
import 'package:flutter_recipes_animation/features/recipes/widget/recipe_list_item_image_wrapper.dart';
import 'package:flutter_recipes_animation/features/recipes/widget/recipe_list_item_text.dart';

class RecipeListItem extends StatefulWidget {
  const RecipeListItem(this.recipe, {super.key});
  final Recipe recipe;
  @override
  State<RecipeListItem> createState() => _RecipeListItemState();
}

class _RecipeListItemState extends State<RecipeListItem> {
  double recipeImageRotationAnle = 0;
  @override
  Widget build(BuildContext context) {
    double imageSize = RecipesLayout.of(context).recipeImageSize;
    return RecipeListItemGestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => RecipePage(
                widget.recipe,
                initialImageRotationAngle: recipeImageRotationAnle),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        )
            .then((value) {
          if (value != null && value is double && mounted) {
            setState(() {
              recipeImageRotationAnle = value;
            });
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.all(ScreenSize.of(context).isLarge ? 15 : 12.5),
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: '--recipe${widget.recipe.id}',
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: widget.recipe.bgColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.orangeDark.withOpacity(
                          AppColors.getBrightness(widget.recipe.bgColor) ==
                                  Brightness.dark
                              ? 0.5
                              : 0.2,
                        ),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.bottomRight,
                child: RecipeListItemImageWrapper(
                  child: RecipeImage(
                    widget.recipe,
                    imageRotationAngle: recipeImageRotationAnle,
                    imagesize: imageSize,
                    alignmentGeometry: Alignment.bottomRight,
                    hasShadow: false,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: RecipeListItemText(widget.recipe),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
