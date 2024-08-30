import 'package:bloc_impl/app/features/domain/entity/payment_method_entity.dart';

List<PaymentMethodEntity> paymentMethodsMock() {
  final paymentMethodList = <PaymentMethodEntity>[
    PaymentMethodEntity(
      value: 5750.00,
      discount: .10,
      typeOfPayment: PaymentMethod.pix,
    ),
    PaymentMethodEntity(
      value: 5750.00,
      discount: .05,
      typeOfPayment: PaymentMethod.creditCard,
      creditMethodEntity: [
        CreditMethodEntity(
          total: 5462.50,
          installments: 1,
          installmentValue: 5462.50,
        ),
        CreditMethodEntity(
          total: 5750.00,
          installments: 2,
          installmentValue: 2875.00,
        ),
        CreditMethodEntity(
          total: 5750.00,
          installments: 3,
          installmentValue: 1916.00,
        ),
        CreditMethodEntity(
          total: 5750.00,
          installments: 4,
          installmentValue: 1437.50,
        ),
        CreditMethodEntity(
          total: 5750.00,
          installments: 5,
          installmentValue: 1150.00,
        ),
        CreditMethodEntity(
          total: 5750.00,
          installments: 6,
          installmentValue: 958.00,
        ),
        CreditMethodEntity(
          total: 5750.00,
          installments: 7,
          installmentValue: 821.00,
        ),
        CreditMethodEntity(
          total: 5750.00,
          installments: 8,
          installmentValue: 718.75,
        ),
        CreditMethodEntity(
          total: 5750.00,
          installments: 9,
          installmentValue: 638.88,
        ),
        CreditMethodEntity(
          total: 5750.00,
          installments: 10,
          installmentValue: 575.50,
        ),
      ],
    ),
    PaymentMethodEntity(
      value: 5462.00,
      discount: .05,
      typeOfPayment: PaymentMethod.debitCard,
    ),
  ];

  return paymentMethodList;
}
