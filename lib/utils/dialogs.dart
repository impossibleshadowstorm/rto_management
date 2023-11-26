import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/views/dashboard/home-screen.dart';

class CustomDialogs {
  static void showSuccessModal(
    BuildContext context,
    String header,
    String description,
  ) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: Lottie.asset("assets/success.json"),
              ),
              SizedBox(height: 2.5.w),
              Text(
                header,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2.5.w),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.w),
              InkWell(
                onTap: () {
                  Get.offAll(() => const HomeScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C884),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Center(
                    child: Text(
                      "Okay",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
