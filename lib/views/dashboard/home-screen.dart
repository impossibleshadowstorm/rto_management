import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miladtech_flutter_icons/miladtech_flutter_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/controllers/main-application-controller.dart';
import 'package:rto_management/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MainApplicationController _mainApplicationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Obx(
        () => _mainApplicationController
                .bottomNavData[_mainApplicationController.bottomNavIdx.value]
            ["page"],
      ),
      bottomNavigationBar: Container(
        height: 15.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.sp),
            topRight: Radius.circular(10.sp),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 2.5.w),
            bottomMenu(0, "Vehicles", FontAwesome.car),
            SizedBox(width: 2.5.w),
            bottomMenu(1, "Licence", MaterialCommunityIcons.license),
            SizedBox(width: 2.5.w),
            bottomMenu(2, "Dashboard", Icons.add),
            SizedBox(width: 2.5.w),
            bottomMenu(3, "Permits", FontAwesome.stack_exchange),
            SizedBox(width: 2.5.w),
            bottomMenu(4, "Challan", FontAwesome5.credit_card),
            SizedBox(width: 2.5.w),
          ],
        ),
      ),
    );
  }

  Widget bottomMenu(int index, String menuName, IconData menuIconData) {
    return Obx(() {
      return Expanded(
        child: InkWell(
          onTap: () {
            _mainApplicationController.bottomNavIdx.value = index;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: _mainApplicationController.bottomNavIdx.value == index
                    ? 55
                    : 35,
                width: _mainApplicationController.bottomNavIdx.value == index
                    ? 55
                    : 35,
                // height: menuName == "Dashboard" ? 55 : 35,
                // width: menuName == "Dashboard" ? 55 : 35,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color:
                        _mainApplicationController.bottomNavIdx.value == index
                            ? Colors.white
                            : Constants.lightBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Icon(
                  menuIconData,
                  color: _mainApplicationController.bottomNavIdx.value == index
                      ? Constants.yellowColor
                      : Constants.lightBorderColor,
                  size: 20.sp,
                ),
              ),
              SizedBox(height: 2.5.w),
              _mainApplicationController.bottomNavIdx.value == index
                  ? Text(
                      menuName,
                      style: GoogleFonts.poppins(
                        color: _mainApplicationController.bottomNavIdx.value ==
                                index
                            ? Colors.white
                            : Constants.lightBorderColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      );
    });
  }
}
