import 'package:flutter/material.dart';
import 'package:gymgeni/helper/footer.dart';

import '../../../utils/colors.dart';
import '../../drawer/view/drawer_view.dart';

class Tablet extends StatelessWidget {
  final Widget? body;
  const Tablet({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: body ?? Container(),
      persistentFooterButtons: [Footer()],
    );
  }
}
