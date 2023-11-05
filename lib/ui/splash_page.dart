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

    final memos = ref.watch(fetchAllMenusProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ホーム画面')),
      body: SingleChildScrollView(
        child: memos.when(
          data: (memos) {
            if (memos.isEmpty) {
              return const Center(child: Text('データが存在しませんでした'));
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                final item = memos[index];
                return ListTile(
                  leading: Text('no. ${index + 1}'),
                  title: Text('name: ${item.name}'),
                );
              },
              itemCount: memos.length,
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Text('oops! error: $error, stackTrace: $stackTrace');
          },
          loading: () {
            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
    );
  }
}
