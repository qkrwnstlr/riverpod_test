import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingViewModel, List<ShoppingItemModel>>(
  (ref) => ShoppingViewModel(),
);

class ShoppingViewModel extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingViewModel()
      : super(
          [
            ShoppingItemModel(
              name: 'name1',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: 'name2',
              quantity: 2,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: 'name3',
              quantity: 4,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: 'name4',
              quantity: 1,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );

  void toggleHasBought({required String name}) {
    state = state
        .map((e) => e.name == name ? e.copyWith(hasBought: !e.hasBought) : e)
        .toList();
  }
}
