import 'package:bloc_impl/app/features/cubit_radio_toggle/presentation/cubit/radio_toggle_cubit.dart';
import 'package:bloc_impl/app/features/domain/entity/payment_method_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioToggleWidget extends StatelessWidget {
  final PaymentMethodEntity paymentMethod;
  final List<CreditMethodEntity>? creditMethodEntity;

  const RadioToggleWidget({
    super.key,
    required this.paymentMethod,
    this.creditMethodEntity,
  });

  String filterPaymentMethod({required PaymentMethod payment}) {
    switch (payment) {
      case PaymentMethod.pix:
        return 'Pagamento no Pix';
      case PaymentMethod.creditCard:
        return 'Pagamento no Crédito';
      case PaymentMethod.debitCard:
        return 'Pagamento no Débito';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioToggleCubit, RadioToggleState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: paymentMethod.typeOfPayment,
                        groupValue: state.maybeWhen(
                          success: (paymentMethod, selectedPaymentMethod) {
                            return selectedPaymentMethod;
                          },
                          orElse: () => null,
                        ),
                        onChanged: (PaymentMethod? value) {
                          context
                              .read<RadioToggleCubit>()
                              .toSelectpaymentMethod(paymentMethod: value);
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(filterPaymentMethod(
                              payment: paymentMethod.typeOfPayment)),
                          Text(paymentMethod.value.toString()),
                        ],
                      ),
                    ],
                  ),
                  Visibility(
                    visible:
                        paymentMethod.typeOfPayment == PaymentMethod.creditCard,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ExpansionTile(
                        title: const Text('ver parcelas'),
                        children: creditMethodEntity
                                ?.map((installments) => ListTile(
                                      title: Text(
                                        installments.installmentValue
                                            .toString(),
                                      ),
                                      subtitle: Text(
                                        installments.installments.toString(),
                                      ),
                                    ))
                                .toList() ??
                            [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
