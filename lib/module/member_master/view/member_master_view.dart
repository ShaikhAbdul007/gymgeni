import 'package:flutter/material.dart';

import 'membermasterdesktop.dart';

class MemberMasterView extends StatelessWidget {
  const MemberMasterView({super.key});

  @override
  Widget build(BuildContext context) {
    return MemberMasterDesktop();
  }
}

class MemberMasterTablet extends StatelessWidget {
  const MemberMasterTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MemberMasterMobile extends StatelessWidget {
  const MemberMasterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
