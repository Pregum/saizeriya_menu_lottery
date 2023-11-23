import 'package:hooks_riverpod/hooks_riverpod.dart';

final dummyData = Provider.family<List<String>, int?>(
    (ref, input) => List<String>.generate(input ?? 10, (index) => 'sample menu$index'));
