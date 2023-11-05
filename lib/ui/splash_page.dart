import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:saizeriya_menu_lottery/model/menu.dart';
import 'package:saizeriya_menu_lottery/repository/menu_repository.dart';
import 'package:saizeriya_menu_lottery/repository/supabase.dart';
import 'package:saizeriya_menu_lottery/route.dart';
import 'package:saizeriya_menu_lottery/ui/home_page.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final redirecting = useState(false);
    final supabase = ref.watch(supabaseProvider);
    final persistentController = useState(PersistentTabController());

    useEffect(
      () {
        supabase.client.auth.onAuthStateChange.listen(
          (data) {
            debugPrint('event: ${data.event.toString()}');
            if (redirecting.value) {
              return;
            }
            final session = data.session;
            if (session != null) {
              redirecting.value = true;
              Navigator.of(context).pushReplacementNamed(MyRoute.myPage);
            }
          },
        );
        return null;
      },
      [supabase.client.auth.onAuthStateChange],
    );

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: persistentController.value,
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.home_filled),
            title: 'Home',
            activeColorPrimary: Colors.teal,
            inactiveColorPrimary: Colors.grey[400],
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.lunch_dining),
            title: 'Lunch',
            activeColorPrimary: Colors.teal,
            inactiveColorPrimary: Colors.grey[400],
            routeAndNavigatorSettings: RouteAndNavigatorSettings(
              initialRoute: '/',
              routes: {
                MyRoute.home: (final context) =>
                    HomePage(parentBuildContext: context),
              },
            ),
          ),
        ],
        screens: [
          HomePage(parentBuildContext: context),
          HomePage(parentBuildContext: context),
        ],
        navBarStyle: NavBarStyle.style9,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
        decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
      ),
    );
  }

  Widget _buildSpecificGenreMenu(AsyncValue<List<Menu>> menus) {
    return menus.when(
      data: (m) {
        if (m.isEmpty) {
          return ListView(
            children: const [
              Center(
                child: Text('データが存在しませんでした'),
              ),
            ],
          );
        }

        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          itemBuilder: (context, index) {
            final item = m[index];
            return ListTile(
              leading: Text('${index + 1}'),
              title: Text('${item.name}'),
            );
          },
          itemCount: m.length,
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return ListView(
          children: [
            Center(
              child: Text('oops! error: $error, stackTrace: $stackTrace'),
            ),
          ],
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
