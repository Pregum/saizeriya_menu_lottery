import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saizeriya_menu_lottery/repository/menu_repository.dart';
import 'package:saizeriya_menu_lottery/repository/supabase.dart';
import 'package:saizeriya_menu_lottery/route.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final redirecting = useState(false);
    final supabase = ref.watch(supabaseProvider);

    useEffect(() {
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
    }, [supabase.client.auth.onAuthStateChange]);

    final menus = ref.watch(fetchAllMenusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム画面'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          debugPrint('refresh');
          return ref.refresh(fetchAllMenusProvider.future);
        },
        child: menus.when(
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
        ),
      ),
    );
  }
}
