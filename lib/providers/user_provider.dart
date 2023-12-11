import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_e/misc/dummy_data/dummy_data.dart';

final userProvider = Provider((ref) {
  return user;
});
