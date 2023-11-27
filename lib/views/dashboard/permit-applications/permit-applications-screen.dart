import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/utils/constants.dart';
import 'package:rto_management/views/dashboard/permit-applications/permit-application-form.dart';
import 'package:rto_management/views/dashboard/vehicle-registration/vehicle-registration-transfer-form.dart';

class PermitApplicationScreen extends StatefulWidget {
  const PermitApplicationScreen({super.key});

  @override
  State<PermitApplicationScreen> createState() =>
      _PermitApplicationScreenState();
}

class _PermitApplicationScreenState extends State<PermitApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      height: 30.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/permit_screen.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                      width: 100.w,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 2.5.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black87.withOpacity(0.6),
                          ),
                          child: Text(
                            "Permit Application",
                            style: GoogleFonts.poppins(
                              color: Constants.yellowColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.5.h),
              Text(
                "Permit Applications",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  fontSize: 17.sp,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.5.h),
                    Text(
                      "Please have your below mentioned ready with you in order to apply for Permit Application:",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 2.5.w),
                    documentsList("Registration Certificate"),
                    documentsList("Tax Receipt"),
                    documentsList("Tax Any Previous Permit"),
                    documentsList("Insurance"),
                    SizedBox(height: 2.5.w),
                    Text(
                      "*Note: Permit Application will cost you 1500 INR.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.5.h),
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  Get.to(() => const PermitApplicationForm());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Center(
                    child: Text(
                      "Apply",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget documentsList(String name) {
    return Row(
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 2.5.w),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
