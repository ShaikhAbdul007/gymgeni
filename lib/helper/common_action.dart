import 'package:flutter/material.dart';
import 'package:gymgeni/helper/svg_assetes.dart';

class CommonAction extends StatelessWidget {
  final VoidCallback editOnTap;
  final VoidCallback deleteOnTap;
  final VoidCallback? freezeOnTap;
  final VoidCallback? unfreezeOnTap;
  final VoidCallback? transferOnTap;
  final VoidCallback? convertOnTap;
  const CommonAction({
    super.key,
    required this.editOnTap,
    required this.deleteOnTap,
    this.freezeOnTap,
    this.unfreezeOnTap,
    this.transferOnTap,
    this.convertOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: editOnTap,
          child: CustomNetworkOrAssetImage(
            svgAssets: 'assets/editicon.png',
            height: 50,
            width: 20,
          ),
        ),
        SizedBox(width: 8),
        InkWell(
          onTap: deleteOnTap,
          child: CustomNetworkOrAssetImage(
            svgAssets: 'assets/deleteicon.png',
            height: 50,
            width: 20,
          ),
        ),
        if (freezeOnTap != null) ...[
          SizedBox(width: 8),
          InkWell(
            onTap: freezeOnTap,
            child: const Icon(
              Icons.ac_unit,
              color: Colors.blue,
              size: 20,
            ),
          ),
        ],
        if (unfreezeOnTap != null) ...[
          SizedBox(width: 8),
          InkWell(
            onTap: unfreezeOnTap,
            child: const Icon(
              Icons.lock_open,
              color: Colors.green,
              size: 20,
            ),
          ),
        ],
        if (transferOnTap != null) ...[
          SizedBox(width: 8),
          InkWell(
            onTap: transferOnTap,
            child: const Icon(
              Icons.swap_horiz,
              color: Colors.purple,
              size: 20,
            ),
          ),
        ],
        if (convertOnTap != null) ...[
          SizedBox(width: 8),
          InkWell(
            onTap: convertOnTap,
            child: const Icon(
              Icons.person_add,
              color: Colors.orange,
              size: 20,
            ),
          ),
        ],
      ],
    );
  }
}
