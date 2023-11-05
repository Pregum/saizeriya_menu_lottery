import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saizeriya_menu_lottery/repository/menu_repository.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key, required BuildContext parentBuildContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menus = ref.watch(fetchAllMenusProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          debugPrint('refresh');
          return ref.refresh(fetchAllMenusProvider.future);
        },
        // child: _buildSpecificGenreMenu(menus),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              centerTitle: true,
              title: Text('ホーム画面'),
            ),
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
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 8,
            )),
            menus.when(
              data: (data) => SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.teal,
                        // height: 50,
                        width: 120,
                        margin: const EdgeInsets.all(8.0),
                      );
                    },
                    // itemCount: data.length,
                    itemCount: 10,
                  ),
                ),
              ),
              error: (Object error, StackTrace stackTrace) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('読み込みエラーが発生しました。'),
                  ),
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
