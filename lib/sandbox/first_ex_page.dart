import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const BaseMaterial());
}

class BaseMaterial extends StatelessWidget {
  const BaseMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const FirstExPage(),
    );
  }
}

class FirstExPage extends HookConsumerWidget {
  const FirstExPage({super.key});

  void _onScroll(
      ScrollController scrollController,
      ValueNotifier<double> scrollPosition,
      ValueNotifier<double?> maxPosition) {
    debugPrint('currentPosition: ${scrollController.position.pixels}');

    scrollPosition.value = scrollController.position.pixels;
    maxPosition.value = scrollController.position.maxScrollExtent;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final scrollPosition = useState<double>(0);
    final maxPosition = useState<double?>(null);
    const itemCount = 50;

    useEffect(() {
      // final maxHeight = scrollController.position.maxScrollExtent;
      // debugPrint('maxHeight: $maxHeight');
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(
          () => _onScroll(scrollController, scrollPosition, maxPosition));
      // });
      // scrollController.
      return () {
        scrollController.removeListener(
            () => _onScroll(scrollController, scrollPosition, maxPosition));
      };
    }, [scrollController]);

    double max2 = scrollController.positions.isNotEmpty
        ? scrollController.position.maxScrollExtent
        : 100;
    return Scaffold(
      appBar: AppBar(
          title: const Text('menu'),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {
              // TODO: Drawer入れる
            },
          )),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 30,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Pos.',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Gap(8),
                  Expanded(
                      // child: Slider(
                      //   value: scrollPosition.value.clamp(0, max2),
                      //   onChanged: null, // こちらでは動かせないようにする。 //(double value) {},
                      //   min: 0,
                      //   max: max2,
                      // ),
                      child: Stack(
                    children: [
                      Positioned(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 4,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Positioned(
                        child: Align(
                          // alignment: Alignment.center,
                          alignment: Alignment(
                              (-1.0 + (scrollPosition.value / max2) * 2)
                                  .clamp(-1.0, 1.0),
                              0.0),
                          child: Container(
                            height: 4,
                            color: Colors.grey[200],
                            width: 16,
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
            // backgroundColor: Colors.teal[200],
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 0,
            pinned: true,
          ),
          const SliverToBoxAdapter(child: Gap(8)),
          SliverList.builder(
            itemBuilder: (context, index) {
              final currentPos = scrollPosition.value;
              final maxPos = maxPosition.value;
              final double? currentIndexRatio;
              final double? estimatedHeight;
              if (maxPos != null) {
                final positionPercentage = currentPos / maxPos;
                final positionPerItem = maxPos / itemCount;
                final positionOfTheWidget = positionPerItem * index;
                debugPrint(
                  ' positionPercentage: $positionPercentage'
                  ' indexPerItem: $positionPerItem'
                  ' currentIndexPerItem: $positionOfTheWidget',
                );
                currentIndexRatio = positionOfTheWidget;
                // 現在のposと、このウィジェットのposの差の絶対値を取る
                final posDelta = (currentPos - positionOfTheWidget).abs();
                const ratioCount = 3.0;
                final baseDiffDelta = ratioCount * positionPerItem;
                // debugPrint(
                //   'posDelta: $posDelta'
                //   ' baseDiffDelta: $baseDiffDelta',
                // );
                final delta = posDelta * positionPerItem * 0.01;
                debugPrint('index: $index delta: $delta');
                // final sizeRatio = (1 + currentIndexRatio).clamp(1, 1.4);
                double baseSize = 160;
                estimatedHeight =
                    (baseSize - delta).clamp(baseSize * 0.5, baseSize * 3.0);
                // estimatedHeight = sizeRatio * baseSize;
                // サイズは1 widget 50pxとして
                // final currentIndexSize = k
              } else {
                currentIndexRatio = null;
                estimatedHeight = null;
              }
              debugPrint(
                '[index: $index]'
                ' estimatedHeight: $estimatedHeight',
              );
              // ここで、widgetの配置と自身のindexから出す
              // final currentWidgetSize =
              return AnimatedContainer(
                height: estimatedHeight ?? 50,
                color: index.isEven ? Colors.amber : Colors.teal,
                margin: const EdgeInsets.all(4),
                duration: const Duration(microseconds: 160),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      margin: const EdgeInsets.all(8),
                      child: const CircleAvatar(
                        child: ColoredBox(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('index: $index'),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: itemCount,
          ),
        ],
      ),
    );
  }
}
