import 'dart:developer';

import 'package:bloc_impl/app/core/injection/injection.dart';
import 'package:bloc_impl/app/features/domain/entity/payment_method_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_impl/app/features/cubit_radio_toggle/presentation/cubit/radio_toggle_cubit.dart';
import 'package:bloc_impl/app/features/cubit_radio_toggle/presentation/widgets/radio_toggle_widget.dart';
import 'package:flutter/material.dart';

class RadioTogglePage extends StatefulWidget {
  const RadioTogglePage({super.key});

  @override
  State<RadioTogglePage> createState() => _RadioTogglePageState();
}

class _RadioTogglePageState extends State<RadioTogglePage> {
  late final RadioToggleCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = getIt<RadioToggleCubit>(param1: PaymentMethod.pix);
    _cubit.fetchPaymentMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('radio toggle')),
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocBuilder<RadioToggleCubit, RadioToggleState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Text('Initial'),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: () => const Text('Error'),
              success: (paymentMethod, selectedPaymentMethod) => Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: paymentMethod.length,
                        itemBuilder: (context, index) => RadioToggleWidget(
                          paymentMethod: paymentMethod[index],
                          creditMethodEntity:
                              paymentMethod[index].creditMethodEntity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => _cubit,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<RadioToggleCubit, RadioToggleState>(
            builder: (context, state) {
              return ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text(
                  'Enviar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  state.maybeWhen(
                    success: (paymentMethod, selectedPaymentMethod) {
                      if (selectedPaymentMethod != null) {
                        log('O método de pagamento escolhido é $selectedPaymentMethod');
                      }
                    },
                    orElse: () => null,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
