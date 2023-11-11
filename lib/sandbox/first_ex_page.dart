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
      ScrollController scrollController, ValueNotifier<double> scrollPosition) {
    debugPrint('currentPosition: ${scrollController.position.pixels}');
    scrollPosition.value = scrollController.position.pixels;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final scrollPosition = useState<double>(0);
    final maxScrollExtent = useState<double>(0);

    useEffect(() {
      // final maxHeight = scrollController.position.maxScrollExtent;
      // debugPrint('maxHeight: $maxHeight');
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController
          .addListener(() => _onScroll(scrollController, scrollPosition));
      // });
      // scrollController.
      return () {
        scrollController
            .removeListener(() => _onScroll(scrollController, scrollPosition));
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
                    child: Slider(
                      value: scrollPosition.value.clamp(0, max2),
                      onChanged: null, // こちらでは動かせないようにする。 //(double value) {},
                      min: 0,
                      max: max2,
                    ),
                  ),
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
            // ListView.builder(
            // shrinkWrap: true,
            // controller: scrollController,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: index.isEven ? Colors.amber : Colors.teal,
                margin: const EdgeInsets.all(8),
                child: Center(
                  child: Text('index: $index'),
                ),
              );
            },
            itemCount: 50,
          ),
        ],
      ),
    );
  }
}
