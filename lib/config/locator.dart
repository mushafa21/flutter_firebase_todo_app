

import 'package:base_todolist/config/shared_preference.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global [GetIt.instance].
final GetIt locator = GetIt.instance;

/// Set up [GetIt] locator.
Future<void> setUpLocator() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  locator.registerSingleton<CacheStore>(CacheStore(preferences));
}
