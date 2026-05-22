import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';



final navManagerProvider = StateNotifierProvider<NavManager, bool>((ref) {
  return NavManager();
});
class NavManager extends StateNotifier<bool> {
  NavManager() : super(false);

  void toggleNav() {
    state = !state;
  }
}
