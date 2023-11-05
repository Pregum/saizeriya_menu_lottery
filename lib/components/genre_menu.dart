import 'package:flutter/material.dart';

class GenreMenu extends StatelessWidget {
  const GenreMenu({
    super.key,
    this.onTapShowAll,
    this.child,
  });
  final VoidCallback? onTapShowAll;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final c = child;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 8,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'サラダ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextButton(
                  child: Text(
                    '全て表示',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    // TODO: サラダの表示する画面へ遷移する処理を実装
                    onTapShowAll?.call();
                  },
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 8,
          ),
        ),
        if (c != null) c,
      ],
    );
  }
}

List<Widget> buildGenreMenu({
  required BuildContext context,
  String? title,
  VoidCallback? onTapShowAll,
  Widget? child,
}) {
  final c = child;
  return [
    const SliverToBoxAdapter(
      child: SizedBox(
        height: 8,
      ),
    ),
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? 'サラダ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              child: Text(
                '全て表示',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onPressed: () {
                // TODO: サラダの表示する画面へ遷移する処理を実装
                onTapShowAll?.call();
              },
            ),
          ],
        ),
      ),
    ),
    const SliverToBoxAdapter(
      child: SizedBox(
        height: 8,
      ),
    ),
    if (c != null) c,
  ];
}
