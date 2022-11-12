import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_recipes_animation/core/enums/screen_size.dart';
import 'package:flutter_recipes_animation/features/recipes/recipes_data.dart';
import 'package:flutter_recipes_animation/features/recipes/recipes_layout.dart';
import 'package:flutter_recipes_animation/features/recipes/widget/recipe_list_item.dart';
import 'package:flutter_recipes_animation/features/recipes/widget/recipe_list_item_wrapper.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final ValueNotifier<ScrollDirection> scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (UserScrollNotification notification) {
          if (notification.direction == ScrollDirection.forward ||
              notification.direction == ScrollDirection.reverse) {
            scrollDirectionNotifier.value = notification.direction;
          }
          return true;
        },
        child: GridView.builder(
          padding: EdgeInsets.only(
            left: ScreenSize.of(context).isLarge ? 5 : 3.5,
            right: ScreenSize.of(context).isLarge ? 5 : 3.5,
            top: 10,
            bottom: MediaQuery.of(context).padding.bottom + 20,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: RecipesLayout.of(context).gridAxisCount,
            childAspectRatio: RecipesLayout.of(context).gridChildAspectRatio,
          ),
          itemCount: RecipesData.dessertMenu.length,
          itemBuilder: (context, i) {
            return ValueListenableBuilder(
              valueListenable: scrollDirectionNotifier,
              child: RecipeListItem(
                RecipesData.dessertMenu[i],
              ),
              builder: (context, value, child) {
                return RecipeListItemWrapper(
                  scrollDirection: value,
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
