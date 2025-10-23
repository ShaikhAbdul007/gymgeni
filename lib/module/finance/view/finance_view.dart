import 'package:flutter/material.dart';
import 'package:gymgeni/module/responsive_layout/responsive_dimension/responsive_tempate.dart';

class FinanceView extends StatelessWidget {
  const FinanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveTemplate(
      desktop: Desktop(),
      tablet: Tablet(),
      mobile: Mobile(),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text('FinanceView', style: TextStyle(fontSize: 50))),
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
