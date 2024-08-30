import 'package:bloc_impl/app/features/cubit_radio_toggle/presentation/widgets/button_bloc_widget.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App page')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ButtonBlocWidget(
              buttonName: 'cubit radio',
              action: () => Navigator.of(context).pushNamed('/radio_toggle'),
            ),
            ButtonBlocWidget(
              buttonName: 'teste 01',
              action: () {},
            ),
            ButtonBlocWidget(
              buttonName: 'teste 01',
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}
