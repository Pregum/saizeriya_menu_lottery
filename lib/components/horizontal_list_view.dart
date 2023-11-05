import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    required this.snapshot,
    this.onTapAllShow,
  });
  final AsyncValue snapshot;
  final VoidCallback? onTapAllShow;

  @override
  Widget build(BuildContext context) {
    return snapshot.when(
      data: (data) => SliverToBoxAdapter(
        child: SizedBox(
          height: 120,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.amber,
                width: 120,
                margin: const EdgeInsets.all(8.0),
              );
            },
            itemCount: 10,
          ),
        ),
      ),
      error: (Object object, StackTrace stackTrace) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Text('読み込みエラーが発生しました。'),
          ),
        );
      },
      loading: () {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
