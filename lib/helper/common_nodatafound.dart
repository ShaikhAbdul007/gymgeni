import 'package:flutter/material.dart';

import '../utils/text_style.dart';

class CommonNoDataFound extends StatelessWidget {
  final String label;
  const CommonNoDataFound({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(label, style: customRaleway(fontSize: 20)));
  }
}
