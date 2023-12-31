import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/controllers/trafic-challan-controller.dart';
import 'package:rto_management/utils/constants.dart';
import 'package:rto_management/utils/toasts.dart';
import 'package:rto_management/views/dashboard/traffic-challans/challan-payment-screen.dart';

class TrafficChallanScreen extends StatefulWidget {
  const TrafficChallanScreen({super.key});

  @override
  State<TrafficChallanScreen> createState() => _TrafficChallanScreenState();
}

class _TrafficChallanScreenState extends State<TrafficChallanScreen> {
  final TrafficChallanController _trafficChallanController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
                width: 100.w,
                child: Center(
                  child: Text(
                    "Traffic Challan",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 5.w),
                      customTextField(
                        "RC Number",
                        _trafficChallanController.rcNumber,
                        "text",
                      ),
                      SizedBox(height: 3.5.w),
                      customTextField(
                        "State",
                        _trafficChallanController.state,
                        "text",
                      ),
                      SizedBox(height: 3.5.w),
                      customTextField(
                        "District",
                        _trafficChallanController.district,
                        "text",
                      ),
                      SizedBox(height: 3.5.w),
                      customTextField(
                        "Challan Number",
                        _trafficChallanController.challanNumber,
                        "number",
                      ),
                      SizedBox(height: 5.h),
                      // Submit Button
                      Obx(() {
                        return _trafficChallanController.submitting.value
                            ? Container(
                                height: 60,
                                width: 100.w,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Constants.yellowColor,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () async {
                                  if (_trafficChallanController
                                              .rcNumber.text.length <
                                          10 ||
                                      _trafficChallanController
                                              .state.text.length <
                                          3 ||
                                      _trafficChallanController
                                              .district.text.length <
                                          5) {
                                    Toasts.showErrorToast(
                                      "Invalid Data",
                                      "Please Fill the Data Correctly..!",
                                    );
                                  } else {
                                    Get.to(() => const PaymentScreen());
                                  }
                                },
                                child: Container(
                                  height: 60,
                                  width: 100.w,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Pay Challan",
                                      style: GoogleFonts.poppins(
                                        color: Constants.yellowColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextField(
    String hintText,
    TextEditingController controller,
    String type,
  ) {
    return SizedBox(
      height: 45,
      width: 100.w,
      child: TextFormField(
        controller: controller,
        cursorColor: Constants.yellowColor,
        keyboardType:
            type == "text" ? TextInputType.text : TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 3.5.w),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Constants.yellowColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Constants.greyTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
