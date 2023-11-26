import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/utils/constants.dart';
import 'package:rto_management/views/dashboard/vehicle-registration/vehicle-registration-transfer-form.dart';

class VehicleRegistrationScreen extends StatefulWidget {
  const VehicleRegistrationScreen({super.key});

  @override
  State<VehicleRegistrationScreen> createState() =>
      _VehicleRegistrationScreenState();
}

class _VehicleRegistrationScreenState extends State<VehicleRegistrationScreen> {
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
                height: 30.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/car.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 2.5.h),
              Text(
                "Vehicle Registration Transfer",
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
                      "Please have your below mentioned ready with you in order to apply for vehicle Registration Transfer:",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 2.5.w),
                    documentsList("Insurance"),
                    documentsList("Registration Certificate"),
                    documentsList("NOC"),
                    documentsList("PUC"),
                    SizedBox(height: 2.5.w),
                    Text(
                      "*Note: Vehicle Registration Transfer will cost you 2500 INR.",
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
                  Get.to(() => const VehicleRegistrationTransferForm());
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
