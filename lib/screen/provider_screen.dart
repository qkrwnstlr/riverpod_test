import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/common/layout/default_layout.dart';
import 'package:riverpod_test/riverpod/provider.dart';

import '../riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);
    return DefaultLayout(
        title: "ProviderScreen",
        actions: [
          PopupMenuButton<FilterState>(
            itemBuilder: (_) => FilterState.values
                .map((e) => PopupMenuItem(value: e, child: Text(e.name)))
                .toList(),
            onSelected: (value) =>
                ref.read(filterProvider.notifier).update((state) => value),
          )
        ],
        child: ListView(
          children: state
              .map(
                (e) => CheckboxListTile(
                  title: Text(e.name),
                  value: e.hasBought,
                  onChanged: (value) => ref
                      .read(shoppingListProvider.notifier)
                      .toggleHasBought(name: e.name),
                ),
              )
              .toList(),
        ));
  }
}
