import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saizeriya_menu_lottery/gen/assets.gen.dart';
import 'package:saizeriya_menu_lottery/repository/menu_repository.dart';
import 'package:saizeriya_menu_lottery/repository/supabase.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: '.env');
      final url = dotenv.get('SUPABASE_URL');
      final anonKey = dotenv.get('SUPABASE_ANONKEY');
      debugPrint('url: $url');
      debugPrint('anonkey: $anonKey');
      final supabaseAsync = supabaseAsyncProvider(url, anonKey);
      final rootContainer = ProviderContainer();
      final supabase = await rootContainer.read(supabaseAsync.future);
      final childContainer = ProviderContainer(
        parent: rootContainer,
        overrides: [
          supabaseProvider.overrideWithValue(supabase),
        ],
      );

      runApp(
        UncontrolledProviderScope(
          container: childContainer,
          child: const RootPage(),
        ),
      );
    },
    (error, stackTrace) {
      debugPrint('zoned guarded error!!!!11!');
    },
  );
  // runApp(const ProviderScope(child: RootPage()));
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
      home: DashBoardPage(),
    );
  }
}

class DashBoardPage extends HookConsumerWidget {
  DashBoardPage({super.key});
  final itemController = ItemScrollController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: 向き先をDBに差し替える
    // final dummyMenus = ref.watch(dummyData(20));
    final selectedMenuIndex = useState<int?>(null);
    // final scrollController = useScrollController();
    // final asyncMenus = ref.watch(fetchAllMenusProvider);
    final asyncMenus = ref.watch(fetchAllMenusProvider);
    final numOfMenus =
        asyncMenus.maybeWhen(data: (data) => data.length, orElse: () => 0);

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          children: [
            InkWell(
              onTap: () async {
                final uri = Uri.parse(
                    'https://github.com/Pregum/saizeriya_menu_lottery');
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              child: const SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('GitHubのリポジトリ'),
                    Icon(SimpleIcons.github),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // final _ = ref.refresh(fetchAllMenusProvider.future);
                Navigator.of(context).pop();
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: _scaffoldKey.currentContext!,
                  builder: (context) {
                    return Container(
                      margin: const EdgeInsets.all(16),
                      height: MediaQuery.sizeOf(context).height - 50,
                      width: MediaQuery.sizeOf(context).width,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'このサイトについて',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text('このサイトは有志が開発した、非公式のファンサイトです。'),
                            const Text('現在のメニューと異なる場合がございます。'),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(text: 'ご報告・ご要望がございましたら、'),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final uri = Uri.parse(
                                            'https://twitter.com/pregum_fox');
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        }
                                      },
                                    text: 'Twitter',
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                  const TextSpan(text: 'もしくはこちらの'),
                                  TextSpan(
                                    text: 'フォーム',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final uri = Uri.parse(
                                            'https://docs.google.com/forms/d/e/1FAIpQLSfuDA9lIawsZkstr9PBA4gOh2HSILscaXtFS5dsMXXPFSQsog/viewform?usp=sf_link');
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        }
                                      },
                                  ),
                                  const TextSpan(text: 'までご連絡ください。'),
                                ],
                              ),
                            ),
                            const Gap(16),
                            Text(
                              '表示している情報について',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'グランドメニュー',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final uri = Uri.parse(
                                            'https://book.saizeriya.co.jp/library/menu1907/book/list');
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        }
                                      },
                                  ),
                                  const TextSpan(text: 'と'),
                                  TextSpan(
                                    text: 'アレルゲン・カロリー塩分情報一覧',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final uri = Uri.parse(
                                            'https://allergy.saizeriya.co.jp/');
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        }
                                      },
                                  ),
                                  const TextSpan(text: 'の情報を使用しております。'),
                                ],
                              ),
                            ),
                            const Text('また、特定原材料は表示が必須な8品目のみ表示しております。'),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: '特定原材料のアイコンは、'),
                                  TextSpan(
                                    text: 'こちらから',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final uri = Uri.parse(
                                            'https://pakelog.net/allegy_illust');
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        }
                                      },
                                  ),
                                  const TextSpan(text: 'お借りしました。'),
                                ],
                              ),
                            ),
                            const Gap(16),
                            Text('免責事項',
                                style: Theme.of(context).textTheme.titleLarge),
                            const Text('当サイトの利用で直接・間接的に生じた損失に関し一切責任を負いかねます。'),
                          ],
                        ),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                );
              },
              child: const SizedBox(
                height: 50,
                child: Center(
                  child: Text('このサイトについて'),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showLicensePage(context: context);
              },
              child: const SizedBox(
                height: 50,
                child: Center(
                  child: Text('ライセンス'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
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
                const Spacer(),
                DrawerButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openEndDrawer();
                  },
                )
              ],
            ),
            Flexible(
              flex: 2,
              child: Container(
                // color: Colors.green,
                margin: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MediaQuery.sizeOf(context).width > 500
                        ? MenuNumWidget(numOfMenus: numOfMenus)
                        : MenusCountWidget(numOfMenus: numOfMenus),
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
                        margin: const EdgeInsets.all(8),
                        child: asyncMenus.when(
                          data: (menus) {
                            return ScrollablePositionedList.separated(
                              // return ListView.separated(
                              // controller: scrollController,
                              itemScrollController: itemController,
                              itemBuilder: (context, index) {
                                // final menu = dummyMenus[index];
                                final menu = menus[index];
                                return Material(
                                  color: selectedMenuIndex.value == index
                                      ? Colors.tealAccent
                                      : Colors.transparent,
                                  child: InkWell(
                                    onTap: () =>
                                        selectedMenuIndex.value = index,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Gap(8),
                                        Expanded(
                                          child: AutoSizeText(
                                            menu.name,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            minFontSize: 10,
                                          ),
                                        ),
                                        const Gap(8),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: AutoSizeText(
                                            menu.orderCode,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              // itemCount: dummyMenus.length,
                              itemCount: menus.length,
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
                            );
                          },
                          error: (error, stackTrace) {
                            debugPrint(
                                'error: $error, stackTrace: $stackTrace');
                            // return const Center(child: Text('oops!'));
                            return Center(
                              child: Column(
                                children: [
                                  const Text('うまく読み込めませんでした。'),
                                  FilledButton(
                                    onPressed: () {
                                      final _ = ref.refresh(
                                          fetchAllMenusProvider.future);
                                    },
                                    child: const Text('再読み込み'),
                                  )
                                ],
                              ),
                            );
                          },
                          loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
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
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return asyncMenus.when(
                            data: (menus) {
                              return Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                      child: selectedMenuIndex.value != null
                                          ? Container(
                                              // color: Colors.lightBlueAccent,
                                              margin: const EdgeInsets.all(8),
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              // child: Assets.images.dummyImage.image(),
                                              child: Image.network(
                                                menus[selectedMenuIndex.value!]
                                                    .imageUrl,
                                                loadingBuilder:
                                                    (context, child, event) {
                                                  if (event != null) {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator
                                                              .adaptive(),
                                                    );
                                                  }
                                                  return child;
                                                },
                                                frameBuilder: (context,
                                                    child,
                                                    frame,
                                                    wasSynchronouslyLoaded) {
                                                  if (!wasSynchronouslyLoaded &&
                                                      frame == 0) {
                                                    debugPrint(
                                                        'image was loaded');
                                                  }
                                                  debugPrint(
                                                      'frameBuilder was called: $frame');
                                                  return child;
                                                },
                                                fit: BoxFit.contain,
                                              ),
                                            )
                                          : const Center(
                                              child: Text(
                                                  'メニューを選択すると、ここに料理の画像が表示されます。'))),
                                  selectedMenuIndex.value != null
                                      ? Container(
                                          alignment: Alignment.centerRight,
                                          height: 25,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${menus[selectedMenuIndex.value!].price}円',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                TextSpan(
                                                  text:
                                                      '(税込み ${menus[selectedMenuIndex.value!].priceWithTax}円)',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : const SizedBox(height: 25),
                                ],
                              );
                            },
                            error: (error, stackTrace) {
                              return const Center(child: Text('oops!'));
                            },
                            loading: () => const Center(
                                child: CircularProgressIndicator.adaptive()),
                          );
                        },
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
                          margin: const EdgeInsets.all(8),
                          child: asyncMenus.when(
                              data: (menus) {
                                // TODO: ここにallergensを取得するコードを入れる。
                                final hasSelectedMenu =
                                    selectedMenuIndex.value != null;
                                if (hasSelectedMenu) {
                                  // final allergens = ref.read(
                                  //   fetchAllergensByIdProvider(
                                  //     menus[selectedMenuIndex.value!].id,
                                  //   ),
                                  // );
                                  final menu = menus[selectedMenuIndex.value!];

                                  return Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          menu.name,
                                          // dummyMenus[
                                          //     selectedMenuIndex.value!],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                      const Gap(8),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          // 'ここに料理のフレーバーテキストが入ります',
                                          menu.description ??
                                              'ここに料理のフレーバーテキストが入ります',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      const Gap(8),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '法令で規定する特定原材料8品目',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                      const Gap(8),

                                      Wrap(
                                        alignment: WrapAlignment.center,
                                        children: [
                                          ...menu.allergens
                                              .where((e) => e.image != null)
                                              .map((m) => m.image!.image())
                                        ],
                                      ),
                                      // allergens.when(
                                      //   data: (fetchedAllergen) {
                                      //     // return Container();

                                      //     return Wrap(
                                      //       alignment: WrapAlignment.center,
                                      //       children: [
                                      //         Text('$fetchedAllergen')
                                      //       ],
                                      //     );
                                      //   },
                                      //   error: (error, stackTrace) =>
                                      //       const Center(child: Text('oops!!')),
                                      //   loading: () => const Center(
                                      //     child: CircularProgressIndicator
                                      //         .adaptive(),
                                      //   ),
                                      // ),
                                      // Wrap(
                                      //   alignment: WrapAlignment.center,
                                      //   children: [
                                      //     // Assets.images.buckwheatBBlk
                                      //     //     .image(width: 32),
                                      //     // Assets.images.eggBBlk
                                      //     //     .image(width: 32),
                                      //     // Assets.images.crabBBlk
                                      //     //     .image(width: 32),
                                      //     // Assets.images.shrimpBBlk
                                      //     //     .image(width: 32),
                                      //   ],
                                      // ),
                                      const Gap(8),
                                      RichText(
                                          text: TextSpan(children: [
                                        const TextSpan(text: '他の特定原材料は'),
                                        TextSpan(
                                            text: 'こちら',
                                            style: const TextStyle(
                                                color: Colors.blue),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                // 頑張るなら管理画面から渡すようにする
                                                final url = Uri.parse(
                                                    'https://allergy.saizeriya.co.jp/allergy');
                                                if (await canLaunchUrl(url)) {
                                                  await launchUrl(url,
                                                      mode: LaunchMode
                                                          .externalApplication);
                                                }
                                              }),
                                        const TextSpan(text: 'からご覧ください'),
                                      ]))
                                    ],
                                  );
                                } else {
                                  return const Center(
                                      child:
                                          Text('メニューを選択すると、ここに料理の詳細が表示されます。'));
                                }
                              },
                              error: (error, stackTrace) =>
                                  const Center(child: Text('oops!')),
                              loading: () => const Center(
                                  child:
                                      CircularProgressIndicator.adaptive()))),
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
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                              // color: Colors.green,
                              child: Row(children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    margin: const EdgeInsets.all(8),
                                    child: Material(
                                      // color: Colors.lightBlue,
                                      elevation: 2,
                                      borderRadius: BorderRadius.circular(8),
                                      child: InkWell(
                                        onTap: () {
                                          final hasPreviousMenu =
                                              selectedMenuIndex.value != null &&
                                                  0 <=
                                                      (selectedMenuIndex
                                                              .value! -
                                                          1);

                                          if (hasPreviousMenu) {
                                            selectedMenuIndex.value =
                                                selectedMenuIndex.value! - 1;
                                            // final offset = Offset();
                                            itemController.scrollTo(
                                              index: selectedMenuIndex.value!,
                                              duration: const Duration(
                                                  milliseconds: 150),
                                              alignment: 0.2,
                                            );
                                          }
                                        },
                                        child: const Column(
                                          children: [
                                            Expanded(
                                              child:
                                                  Icon(Icons.arrow_circle_left),
                                            ),
                                            Text('前のメニューへ'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Spacer(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    margin: const EdgeInsets.all(8),
                                    child: Material(
                                      // color: Colors.lightBlue,
                                      elevation: 2,
                                      borderRadius: BorderRadius.circular(8),
                                      child: InkWell(
                                        onTap: () {
                                          final menus = asyncMenus.maybeWhen(
                                              data: (value) => value,
                                              loading: () => [],
                                              orElse: () {
                                                return [];
                                              });
                                          if (menus.isEmpty) {
                                            return;
                                          }
                                          final hasNextMenu =
                                              selectedMenuIndex.value != null &&
                                                  (selectedMenuIndex.value! +
                                                          1) <
                                                      menus.length;
                                          if (hasNextMenu) {
                                            selectedMenuIndex.value =
                                                selectedMenuIndex.value! + 1;

                                            itemController.scrollTo(
                                              index: selectedMenuIndex.value!,
                                              duration: const Duration(
                                                  milliseconds: 150),
                                              alignment: 0.2,
                                            );
                                            // // TODO: おそらくValueKeyなどを持たせて対象のwidgetのpositionを取得するコードを実装する必要がありそう
                                            // scrollController.animateTo(
                                            //     selectedMenuIndex.value! * 16,
                                            //     duration: const Duration(
                                            //         milliseconds: 750),
                                            //     curve: Curves.easeIn);
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
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.menu_book),
      //       label: 'Grand Menu',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.stars_outlined),
      //       label: 'Special Menu',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart_outlined),
      //       label: 'Order List',
      //     ),
      //   ],
      // ),
    );
  }
}

class MenuNumWidget extends StatelessWidget {
  final int? numOfMenus;
  const MenuNumWidget({super.key, this.numOfMenus});

  @override
  Widget build(BuildContext context) {
    final numOfMenusStr = numOfMenus?.toString();
    final String firstNum;
    final String secondNum;
    if ((numOfMenusStr?.length ?? 0) >= 2) {
      firstNum = numOfMenusStr![0];
      secondNum = numOfMenusStr.substring(1);
    } else {
      firstNum = '';
      secondNum = '';
    }

    final largeTheme = Theme.of(context).textTheme.displayLarge;
    final largeFontSize = largeTheme?.fontSize ?? 0;
    final smallTheme = Theme.of(context).textTheme.displayMedium;
    final smallFontSize = smallTheme?.fontSize ?? 0;
    debugPrint(
        'large: ${largeTheme?.fontSize ?? -1}, small: ${smallTheme?.fontSize ?? -1}');
    final deltaFontSize = largeFontSize - smallFontSize;
    final half = deltaFontSize / 2.0;
    final quoter = deltaFontSize / 4.0;
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Baseline(
                baseline: 0, // deltaFontSize * 3,
                baselineType: TextBaseline.alphabetic,
                child: Text(firstNum,
                    style: Theme.of(context).textTheme.displayLarge)),
            Baseline(
                baseline: -deltaFontSize + quoter, //-half,
                baselineType: TextBaseline.alphabetic,
                child: Text(secondNum,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: largeFontSize / 1.5))),
            const Gap(16),
            Baseline(
                baseline: -quoter,
                baselineType: TextBaseline.alphabetic,
                child: Text('menus',
                    style: Theme.of(context).textTheme.displayMedium)),
          ],
        ),
      ),
    );
  }
}

class MenusCountWidget extends StatelessWidget {
  final int? numOfMenus;
  const MenusCountWidget({super.key, this.numOfMenus});

  @override
  Widget build(BuildContext context) {
    final numOfMenusStr = numOfMenus?.toString();
    final String firstNum;
    final String secondNum;
    if ((numOfMenusStr?.length ?? 0) >= 2) {
      firstNum = numOfMenusStr![0];
      secondNum = numOfMenusStr.substring(1);
    } else {
      firstNum = '';
      secondNum = '';
    }
    return Expanded(
      flex: 1,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Stack(
            children: [
              Positioned(
                // right: constraints.maxWidth / 3,
                // top: 10,
                height: constraints.maxHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Baseline(
                      baseline: constraints.maxHeight / 2,
                      baselineType: TextBaseline.ideographic,
                      child: Text(
                        firstNum,
                        style: TextStyle(fontSize: constraints.maxHeight / 2.5),
                      ),
                    ),
                    Baseline(
                      baseline: constraints.maxHeight / 3,
                      baselineType: TextBaseline.ideographic,
                      child: Text(
                        secondNum,
                        style: TextStyle(fontSize: constraints.maxHeight / 3.5),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 2 / 3,
                left: constraints.maxWidth / 6,
                child: Text(
                  'menus',
                  style: TextStyle(fontSize: constraints.maxHeight / 8),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
