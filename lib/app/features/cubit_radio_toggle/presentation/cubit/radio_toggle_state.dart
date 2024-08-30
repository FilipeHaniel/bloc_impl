part of 'radio_toggle_cubit.dart';

@freezed
abstract class RadioToggleState with _$RadioToggleState {
  factory RadioToggleState.initial() = _Initial;
  factory RadioToggleState.loading() = _Loading;
  factory RadioToggleState.error() = _Error;
  factory RadioToggleState.success({
    required List<PaymentMethodEntity> paymentMethod,
    PaymentMethod? selectedPaymentMethod,
  }) = _Success;
}
