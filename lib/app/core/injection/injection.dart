import 'package:bloc_impl/app/core/injection/injection.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
GetIt configureDependencies() {
  init(getIt);
  return getIt;
}
