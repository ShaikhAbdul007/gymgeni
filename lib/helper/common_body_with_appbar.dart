import 'package:flutter/material.dart';
import '../utils/container.dart';
import '../utils/divider.dart';
import '../utils/sizebox.dart';
import '../utils/text_style.dart';
import 'svg_assetes.dart';

class Header extends StatelessWidget {
  final String label;
  final bool isactionChildReq;
  final Widget? actionWidget;
  const Header({
    super.key,
    required this.label,
    this.isactionChildReq = false,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(label, style: customMontserrat(fontSize: 18)),
              Spacer(),
              isactionChildReq
                  ? actionWidget!
                  : Row(
                    children: [
                      CustomContainer(
                        margin: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 0,
                        ),
                        height: 30,
                        width: 50,
                        padding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 0,
                        ),
                        radius: 15,
                        child: CustomImageAssets(svgAssets: 'assets/bell.png'),
                      ),
                      setWidth(width: 8),
                      CustomContainer(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        radius: 15,
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 2,
                        ),
                        height: 40,
                        width: 180,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImageAssets(svgAssets: 'assets/admin.png'),
                            Text(
                              'Abdul Shaikh',
                              style: customMontserrat(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            // PopupMenuButton<SampleItem>(
                            //   offset: Offset.fromDirection(50),
                            //   position: PopupMenuPosition.under,
                            //   elevation: 10,
                            //   icon: Icon(Icons.arrow_drop_down_sharp),
                            //   initialValue: selectedItem,
                            //   onSelected: (SampleItem item) {
                            //     selectedItem = item;
                            //   },
                            //   itemBuilder: (BuildContext context) =>
                            //       <PopupMenuEntry<SampleItem>>[
                            //     const PopupMenuItem<SampleItem>(
                            //       value: SampleItem.itemOne,
                            //       child: Text('Permission'),
                            //     ),
                            //     const PopupMenuItem<SampleItem>(
                            //       value: SampleItem.itemTwo,
                            //       child: Text('Profile'),
                            //     ),
                            //     PopupMenuItem<SampleItem>(
                            //       value: SampleItem.itemThree,
                            //       child: Text('Logout'),
                            //       onTap: () {
                            //         Constant.showGetDialogue(
                            //             content: Column(
                            //               mainAxisSize: MainAxisSize.min,
                            //               children: [
                            //                 Text(
                            //                   'Are you sure want to logout ?',
                            //                   style:
                            //                       styleNunito(fontSize: 16),
                            //                 ),
                            //                 setHeight(height: 20),
                            //                 Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     CustomButton(
                            //                         color: AppColors.greyColor
                            //                             .withOpacity(0.5),
                            //                         style: styleNunito(
                            //                             fontSize: 14),
                            //                         height: 50,
                            //                         width: 90,
                            //                         label: 'No',
                            //                         onPress: () {
                            //                           Get.back();
                            //                         }),
                            //                     setWidth(width: 10),
                            //                     CustomButton(
                            //                         style: styleNunito(
                            //                             fontSize: 14,
                            //                             color: AppColors
                            //                                 .whiteColor),
                            //                         height: 50,
                            //                         width: 90,
                            //                         label: 'Yes',
                            //                         onPress: () {
                            //                           Routes.navigateToRoute(
                            //                               routeName: Routes
                            //                                   .loginScreen);
                            //                         }),
                            //                   ],
                            //                 )
                            //               ],
                            //             ),
                            //             textStyle: styleNunito(),
                            //             titleText: '');
                            //         print('object');
                            //       },
                            //     ),
                            //   ],
                            // ),

                            // InkWell(
                            //   onTap: (){

                            //   },
                            //   child: Icon(Icons.arrow_drop_down_sharp))
                          ],
                        ),
                      ),
                    ],
                  ),
            ],
          ),
          customDivider(
            height: 0,
            isParameterGiven: true,
            endIndent: 0,
            indent: 0,
          ),
        ],
      ),
    );
  }
}
