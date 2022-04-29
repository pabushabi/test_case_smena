import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// Get instance of [GetIt]
final GetIt getIt = GetIt.instance;

/// initializes the configurations of [GetIt].
///
/// `env` environment
@injectableInit
Future<void> configureInjection(String env) async {
  await $initGetIt(getIt, environment: env);
}
