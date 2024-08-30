enum PaymentMethod { pix, creditCard, debitCard }

class PaymentMethodEntity {
  final double value;
  final double discount;
  final PaymentMethod typeOfPayment;
  final List<CreditMethodEntity>? creditMethodEntity;

  PaymentMethodEntity({
    required this.value,
    required this.discount,
    required this.typeOfPayment,
    this.creditMethodEntity,
  });
}

class CreditMethodEntity {
  final double total;
  final int installments;
  final double installmentValue;

  CreditMethodEntity({
    required this.total,
    required this.installments,
    required this.installmentValue,
  });
}
