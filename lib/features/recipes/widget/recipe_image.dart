import 'package:flutter/material.dart';
import 'package:flutter_recipes_animation/features/recipes/model/recipe.dart';

import '../../../core/styles/app_colors.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage(this.recipe,
      {super.key,
      this.imageRotationAngle = 0,
      this.imagesize,
      this.alignmentGeometry = Alignment.center,
      this.hasShadow = true,
      this.shadowOffset});
  final Recipe recipe;
  final double imageRotationAngle;
  final double? imagesize;
  final AlignmentGeometry alignmentGeometry;
  final bool hasShadow;
  final Offset? shadowOffset;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentGeometry,
      child: Hero(
        tag: '__recipe_${recipe.id}_image__',
        // Todo: MAYBE add a TweenAnimationBuilder for smoother animation??
        child: SizedBox(
          width: imagesize,
          height: imagesize,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (hasShadow) _buildShadow(),
              Positioned.fill(
                child: Transform.rotate(
                  angle: imageRotationAngle,
                  child: Image.asset(
                    recipe.image,
                    width: imagesize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShadow() {
    Widget child = Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.orangeDark.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
    );

    if (shadowOffset != null) {
      child = TweenAnimationBuilder(
        tween: Tween<Offset>(begin: Offset.zero, end: shadowOffset),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        builder: (context, Offset offset, child) => Transform.translate(
          offset: offset,
          child: child,
        ),
        child: child,
      );
    }

    return child;
  }
}
