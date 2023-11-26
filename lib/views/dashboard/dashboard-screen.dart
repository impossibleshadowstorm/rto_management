import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/controllers/main-application-controller.dart';
import 'package:rto_management/utils/constants.dart';
import 'package:rto_management/views/dashboard/home-screen.dart';
import 'package:rto_management/views/dashboard/permit-applications/permit-applications-screen.dart';
import 'package:rto_management/views/dashboard/traffic-challans/traffic-challans-screen.dart';
import 'package:rto_management/views/dashboard/vehicle-registration/vehicle-registration-screen.dart';

import 'licence-management/licence-management-screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final MainApplicationController _mainApplicationController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(height: AppBar().preferredSize.height + 5.h),
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: Row(
                children: [
                  _card("assets/dl.png",1),
                  _card("assets/vechle.png",0),

                ],
              ),
            ),
            SizedBox(height: 3.h),
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: Row(
                children: [
                  _card("assets/challan.png",4),
                  _card("assets/permit.png",3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _card(String url, int index ){
    return    Expanded(
      child: InkWell(
        onTap: (){
          _mainApplicationController.bottomNavIdx.value = index;
          Get.to(()=>const HomeScreen());
        },
        child: Card(
          elevation: 10,
          child: Container(
            decoration:  BoxDecoration(

              image: DecorationImage(
                image: AssetImage(url),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
