import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:bloc_impl/app/features/domain/entity/payment_method_entity.dart';
import 'package:bloc_impl/app/features/utils/local_mock.dart';

part 'radio_toggle_cubit.freezed.dart';
part 'radio_toggle_state.dart';

@Injectable()
class RadioToggleCubit extends Cubit<RadioToggleState> {
  RadioToggleCubit({@factoryParam this.initialSelectedPaymentMethod})
      : super(RadioToggleState.initial());

  final PaymentMethod? initialSelectedPaymentMethod;

  List<PaymentMethodEntity> paymentMethodMock = <PaymentMethodEntity>[];

  void fetchPaymentMethod() async {
    emit(RadioToggleState.loading());

    await Future.delayed(const Duration(seconds: 1));
    paymentMethodMock = paymentMethodsMock();

    emit(RadioToggleState.success(
      paymentMethod: paymentMethodMock,
      selectedPaymentMethod: initialSelectedPaymentMethod,
    ));
  }

  void toSelectpaymentMethod({PaymentMethod? paymentMethod}) {
    final currentState = state;

    if (currentState is _Success) {
      emit(currentState.copyWith(
        selectedPaymentMethod: paymentMethod,
      ));
    }
  }
}
