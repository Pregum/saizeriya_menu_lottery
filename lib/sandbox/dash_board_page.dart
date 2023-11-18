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
    final dummyMenus = ref.watch(dummyData(20));
    final selectedMenuIndex = useState<int?>(null);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.amber,
          child: Column(
            children: [
              SizedBox(
                // height: 30,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
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
                  color: Colors.green,
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            color: Colors.red,
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
                          color: Colors.tealAccent,
                          margin: const EdgeInsets.all(8),
                          child: ListView.separated(
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
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            color: Colors.lightBlueAccent,
                            margin: const EdgeInsets.all(8),
                            child: Assets.images.dummyImage.image()),
                      ),
                      Container(
                        width: 8,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const VerticalDivider(
                          color: Colors.grey,
                          thickness: 2.5,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.tealAccent,
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
                                            .titleMedium,
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
                                            .bodyMedium,
                                      ),
                                    ),
                                    const Gap(8),
                                    Wrap(children: [
                                      Assets.images.buckwheatBBlk
                                          .image(width: 32),
                                      Assets.images.eggBBlk.image(width: 32),
                                      Assets.images.crabBBlk.image(width: 32),
                                      Assets.images.shrimpBBlk.image(width: 32),
                                    ],),
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
                        child: Card(
                            elevation: 4,
                            child: Column(children: [
                              Container(
                                height: 24,
                                margin: const EdgeInsets.only(left: 16),
                                child: const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'campaign',
                                  ),
                                ),
                              ),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 4),
                                      color: Colors.green)),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 16),
                                      color: Colors.blue)),
                            ])),
                      ),
                      Expanded(
                        child: Card(
                            elevation: 4,
                            child: Column(children: [
                              Container(
                                  height: 24,
                                  margin: const EdgeInsets.only(left: 16),
                                  child: const Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text('this dummy text'))),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 4),
                                      color: Colors.green)),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 16),
                                      color: Colors.blue)),
                            ])),
                      ),
                    ],
                  ),
                ),
              ),
              // Flexible(
              //     flex: 2,
              //     child: Container(
              //         color: Colors.grey, margin: const EdgeInsets.all(8))),
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
