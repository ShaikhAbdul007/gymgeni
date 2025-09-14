import 'package:flutter/material.dart';
import 'package:gymgeni/helper/footer.dart';
import '../../../color/colors.dart';
import '../../drawer/view/drawer_view.dart';

class Mobile extends StatelessWidget {
  final Widget? body;
  const Mobile({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: body ?? Container(),
      persistentFooterButtons: [Footer(isMobile: true)],
    );
  }
}
