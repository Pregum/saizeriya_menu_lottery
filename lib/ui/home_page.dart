import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saizeriya_menu_lottery/components/genre_menu.dart';
import 'package:saizeriya_menu_lottery/components/horizontal_list_view.dart';
import 'package:saizeriya_menu_lottery/repository/menu_repository.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key, required BuildContext parentBuildContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menus = ref.watch(fetchAllMenusProvider);
    final repository = ref.watch(menuRepositoryProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          debugPrint('refresh');
          return ref.refresh(fetchAllMenusProvider.future);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              centerTitle: true,
              title: Text(
                'グランドメニュー',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
            ...buildGenreMenu(
              title: 'サラダ',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(
              snapshot: menus,
              itemDelegate: (item, index) {
                return Container(
                  color: Colors.tealAccent,
                  width: 120,
                  margin: const EdgeInsets.all(8.0),
                  child: item.imageUrl.isNotEmpty
                      ? Image.network(
                          item.imageUrl,
                          errorBuilder: (context, error, stackTrace) =>
                              Text('error! $error'),
                        )
                      : null,
                );
              },
            ),
            ...buildGenreMenu(
              title: 'スープ',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: '焼きたてパン',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: 'ドリンクバー',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: '前菜・おつまみ',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: 'ワイン',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: 'ドリア＆グラタン',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: 'ピザ',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: 'パスタ',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: 'ハンバーグ',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: 'チキン',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: 'ステーキ',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
            ...buildGenreMenu(
              title: 'デザート',
              context: context,
              onTapShowAll: () {},
            ),
            HorizontalListView(snapshot: menus),
          ],
        ),
      ),
    );
  }
}
