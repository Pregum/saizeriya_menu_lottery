import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

    return Scaffold(
      appBar: AppBar(title: const Text('ホーム画面')),
      body: Center(
        child: Container(
          color: Colors.amber[300],
        ),
      ),
    );
  }
}
