import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/controllers/permit-application-controller.dart';
import 'package:rto_management/utils/constants.dart';
import 'package:rto_management/utils/dialogs.dart';
import 'package:rto_management/utils/toasts.dart';

class PermitApplicationForm extends StatefulWidget {
  const PermitApplicationForm({super.key});

  @override
  State<PermitApplicationForm> createState() => _PermitApplicationFormState();
}

class _PermitApplicationFormState extends State<PermitApplicationForm> {
  final PermitApplicationController _permitApplicationController = Get.find();
  @override
  void dispose() {
    super.dispose();
    _permitApplicationController.resetData();
  }

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 19.sp,
                      ),
                    ),
                    Text(
                      "Permit Application",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.transparent,
                      size: 19.sp,
                    ),
                  ],
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
                        _permitApplicationController.rcNumber,
                        "text",
                      ),
                      SizedBox(height: 3.5.w),
                      customTextField(
                        "Tax Receipt Number",
                        _permitApplicationController.taxReceipt,
                        "number",
                      ),
                      SizedBox(height: 3.5.w),
                      customTextField(
                        "Insurance Number",
                        _permitApplicationController.insurance,
                        "number",
                      ),
                      SizedBox(height: 3.5.w),
                      customTextField(
                        "Previous Permit Number",
                        _permitApplicationController.previousPermit,
                        "number",
                      ),
                      SizedBox(height: 5.h),
                      // Upload Button
                      Obx(() {
                        return _permitApplicationController.submitting.value
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
                                  if (_permitApplicationController
                                              .rcNumber.text.length <
                                          10 ||
                                      _permitApplicationController
                                              .taxReceipt.text.length <
                                          5 ||
                                      _permitApplicationController
                                              .insurance.text.length <
                                          5) {
                                    Toasts.showErrorToast(
                                      "Invalid Data",
                                      "Please Fill the Data Correctly..!",
                                    );
                                  } else {
                                    int response =
                                        await _permitApplicationController
                                            .addPermitApplication();

                                    if (response == 0) {
                                      Toasts.showErrorToast(
                                        "Error",
                                        "Unable to Process Request",
                                      );
                                    } else if (response == 1) {
                                      Toasts.showErrorToast(
                                        "Already Exists",
                                        "Permit Application already Exists on this RC Number..!",
                                      );
                                    } else {
                                      if (mounted) {
                                        String challan =
                                            _permitApplicationController
                                                .generateEChallanNumber();
                                        _permitApplicationController
                                            .resetData();
                                        CustomDialogs.showSuccessModal(
                                          context,
                                          "Success",
                                          "Your application has been saved..! Your challan Number is $challan",
                                        );
                                      }
                                    }
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
                                      "Submit",
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
