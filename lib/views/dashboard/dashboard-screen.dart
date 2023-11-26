import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
            Row(
              children: [
                SizedBox(width: 5.w),
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: .5,
                          offset: Offset(4, 3),
                          blurRadius: 10,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: .5,
                          offset: Offset(4, 5),
                          blurRadius: 10,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
              ],
            )
          ],
        ),
      ),
    );
  }
}
