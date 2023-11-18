import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saizeriya_menu_lottery/gen/assets.gen.dart';
import 'package:saizeriya_menu_lottery/sandbox/dummy_data.dart';

void main() {
  runApp(const ProviderScope(child: RootPage()));
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
        textTheme:
            GoogleFonts.sawarabiMinchoTextTheme(Theme.of(context).textTheme),
        // GoogleFonts.bizUDPGothicTextTheme(
        //   Theme.of(context).textTheme
        // )
      ),
      home: const DashBoardPage(),
    );
  }
}

class DashBoardPage extends HookConsumerWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: 向き先をDBに差し替える
    final dummyMenus = ref.watch(dummyData(20));
    final selectedMenuIndex = useState<int?>(null);
    final scrollController = useScrollController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.amber,
          child: Column(
            children: [
              SizedBox(
                // height: 30,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                    child: Text('Grand Menu',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 24)),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  // color: Colors.green,
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            // color: Colors.red,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: constraints.maxWidth / 3,
                                  top: 10,
                                  height: constraints.maxHeight,
                                  child: Text('8',
                                      style: TextStyle(
                                          fontSize: constraints.maxHeight / 2)),
                                ),
                                Positioned(
                                  top: constraints.maxHeight / 9,
                                  right: constraints.maxWidth / 8,
                                  height: constraints.maxHeight,
                                  child: Text('2',
                                      style: TextStyle(
                                          fontSize: constraints.maxHeight / 3)),
                                ),
                                Positioned(
                                  top: constraints.maxHeight * 2 / 3,
                                  left: constraints.maxWidth / 6,
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight / 12),
                                  ),
                                ),
                                Positioned(
                                  top: constraints.maxHeight * 2.25 / 3,
                                  left: constraints.maxWidth / 6,
                                  child: Text(
                                    'menus',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight / 12),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: VerticalDivider(),
                      ),
                      const Gap(24),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: VerticalDivider(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.tealAccent,
                          margin: const EdgeInsets.all(8),
                          child: ListView.separated(
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              // return Container(alignment: Alignment.center, child: Text('menu $index'));
                              final menu = dummyMenus[index];
                              return Material(
                                color: selectedMenuIndex.value == index
                                    ? Colors.amber
                                    : Colors.transparent,
                                child: InkWell(
                                  onTap: () => selectedMenuIndex.value = index,
                                  // overlayColor: MaterialStatePropertyAll(
                                  //     selectedMenuIndex.value == index
                                  //         ? Colors.amber
                                  //         : Colors.transparent),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text('$menu '),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          '$index',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: dummyMenus.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              if (index % 5 == 0) {
                                return const Divider(
                                  indent: 5,
                                  thickness: 1.5,
                                  endIndent: 15,
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  // color: Colors.blue,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    // color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // color: Colors.lightBlueAccent,
                              margin: const EdgeInsets.all(8),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                              child: Assets.images.dummyImage.image(),
                            ),
                            selectedMenuIndex.value != null
                                ? Container(
                                    alignment: Alignment.centerRight,
                                    height: 25,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      '1280 yen',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  )
                                : const SizedBox(height: 25),
                          ],
                        ),
                      ),
                      Container(
                        width: 8,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const VerticalDivider(
                          // color: Colors.grey,
                          thickness: 2.5,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.tealAccent,
                          margin: const EdgeInsets.all(8),
                          child: selectedMenuIndex.value != null
                              ? Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dummyMenus[selectedMenuIndex.value!],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ),
                                    const Gap(8),
                                    Text(
                                      'ここに料理のフレーバーテキストが入ります',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    const Gap(8),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '含まれる特定原材料',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                    const Gap(8),
                                    Wrap(
                                      children: [
                                        Assets.images.buckwheatBBlk
                                            .image(width: 32),
                                        Assets.images.eggBBlk.image(width: 32),
                                        Assets.images.crabBBlk.image(width: 32),
                                        Assets.images.shrimpBBlk
                                            .image(width: 32),
                                      ],
                                    ),
                                  ],
                                )
                              : const Center(
                                  child: Text('メニューを選択すると、ここに料理の詳細が表示されます。')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  // color: Colors.purple,
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 24,
                              margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  '操作',
                                  style:
                                      Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                // color: Colors.green,
                                child: Row(children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      margin: const EdgeInsets.all(8),
                                      child: Material(
                                        // color: Colors.lightBlue,
                                        elevation: 2,
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          onTap: () {
                                            final hasNextMenu =
                                                selectedMenuIndex.value !=
                                                        null &&
                                                    0 <=
                                                        (selectedMenuIndex
                                                                .value! -
                                                            1);

                                            if (hasNextMenu) {
                                              selectedMenuIndex.value =
                                                  selectedMenuIndex.value! - 1;
                                              // final offset = Offset();
                                              scrollController.animateTo(
                                                  selectedMenuIndex.value! * 16,
                                                  duration: const Duration(
                                                      milliseconds: 750),
                                                  curve: Curves.easeIn);
                                            }
                                          },
                                          child: const Column(
                                            children: [
                                              Expanded(
                                                child: Icon(
                                                    Icons.arrow_circle_left),
                                              ),
                                              Text('前のメニューへ'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      margin: const EdgeInsets.all(8),
                                      child: Material(
                                        // color: Colors.lightBlue,
                                        elevation: 2,
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          onTap: () {},
                                          child: const Column(
                                            children: [
                                              Expanded(
                                                child: Icon(
                                                    Icons.add_shopping_cart),
                                              ),
                                              Text('カートに追加'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      margin: const EdgeInsets.all(8),
                                      child: Material(
                                        // color: Colors.lightBlue,
                                        elevation: 2,
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                          onTap: () {
                                            final hasNextMenu =
                                                selectedMenuIndex.value !=
                                                        null &&
                                                    (selectedMenuIndex.value! +
                                                            1) <
                                                        dummyMenus.length;
                                            if (hasNextMenu) {
                                              selectedMenuIndex.value =
                                                  selectedMenuIndex.value! + 1;

                                              // TODO: おそらくValueKeyなどを持たせて対象のwidgetのpositionを取得するコードを実装する必要がありそう
                                              scrollController.animateTo(
                                                  selectedMenuIndex.value! * 16,
                                                  duration: const Duration(
                                                      milliseconds: 750),
                                                  curve: Curves.easeIn);
                                            }
                                          },
                                          child: const Column(
                                            children: [
                                              Expanded(
                                                // child: ColoredBox(
                                                //     color: Colors.red)),
                                                child: Icon(
                                                    Icons.arrow_circle_right),
                                              ),
                                              Text('次のメニューへ'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            // Flexible(
                            //   flex: 1,
                            //   child: Container(
                            //       margin: const EdgeInsets.symmetric(
                            //           vertical: 4, horizontal: 16),
                            //       color: Colors.blue),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: 'grand menu'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: '店舗一覧'),
        ],
      ),
      // bottomNavigationBar: const PersistentBottomNavBar(
      //   navBarStyle: NavBarStyle.style9,
      // ),
    );
  }
}
