// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/cubit_radio_toggle/presentation/cubit/radio_toggle_cubit.dart'
    as _i3;
import '../../features/domain/entity/payment_method_entity.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factoryParam<_i3.RadioToggleCubit, _i4.PaymentMethod?, dynamic>((
    initialSelectedPaymentMethod,
    _,
  ) =>
      _i3.RadioToggleCubit(
          initialSelectedPaymentMethod: initialSelectedPaymentMethod));
  return getIt;
}
