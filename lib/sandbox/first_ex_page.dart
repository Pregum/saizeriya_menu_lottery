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
    ValueNotifier<double?> maxPosition,
  ) {
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
      scrollController.addListener(
          () => _onScroll(scrollController, scrollPosition, maxPosition));
      return () {
        scrollController.removeListener(
            () => _onScroll(scrollController, scrollPosition, maxPosition));
      };
    }, [scrollController]);

    double max2 = scrollController.positions.isNotEmpty
        ? scrollController.position.maxScrollExtent
        : 100;
    debugPrint(((scrollPosition.value / max2) * 2).toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('menu'),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {
            // TODO: Drawer入れる
            // scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
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
              return Container(
                color: index.isEven ? Colors.amber : Colors.teal,
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
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
