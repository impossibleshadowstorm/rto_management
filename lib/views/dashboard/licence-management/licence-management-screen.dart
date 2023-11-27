import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/controllers/licence-management-controller.dart';
import 'package:rto_management/utils/dialogs.dart';
import 'package:rto_management/utils/toasts.dart';
import '../../../utils/constants.dart';

class LicenceManagementScreen extends StatefulWidget {
  const LicenceManagementScreen({super.key});

  @override
  State<LicenceManagementScreen> createState() =>
      _LicenceManagementScreenState();
}

class _LicenceManagementScreenState extends State<LicenceManagementScreen> {
  final LicenceManagementController _licenceManagementController = Get.find();

  @override
  void dispose() {
    super.dispose();
    resetData();
  }

  void resetData() {
    _licenceManagementController.submitting.value = false;
    _licenceManagementController.otpSent.value = false;
    _licenceManagementController.verify = "";
    _licenceManagementController.fullName.text = "";
    _licenceManagementController.aadhaar.text = "";
    _licenceManagementController.address.text = "";
    _licenceManagementController.district.text = "";
    _licenceManagementController.state.text = "";
    _licenceManagementController.bloodGroup.text = "";
    _licenceManagementController.fatherName.text = "";
    _licenceManagementController.motherName.text = "";
    _licenceManagementController.mobile.text = "";
    _licenceManagementController.otp.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 2.5.w),
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Container(
                height: 60,
                width: 100.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Obx(() {
                  return Row(
                    children: [
                      Container(
                        width: 5.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: _licenceManagementController
                                      .licenceTypeTab.value ==
                                  0
                              ? BorderRadius.only(
                                  bottomRight: Radius.circular(5.w),
                                )
                              : BorderRadius.zero,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _licenceManagementController.licenceTypeTab.value =
                                0;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _licenceManagementController
                                          .licenceTypeTab.value ==
                                      0
                                  ? Colors.white
                                  : Colors.grey.shade200,
                              borderRadius: _licenceManagementController
                                          .licenceTypeTab.value ==
                                      0
                                  ? BorderRadius.only(
                                      topRight: Radius.circular(5.w),
                                      topLeft: Radius.circular(5.w),
                                    )
                                  : BorderRadius.zero,
                            ),
                            child: Center(
                              child: Text(
                                "Learner's Licence",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 7.5.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              _licenceManagementController
                                          .licenceTypeTab.value ==
                                      0
                                  ? 5.w
                                  : 0,
                            ),
                            bottomRight: Radius.circular(
                              _licenceManagementController
                                          .licenceTypeTab.value ==
                                      1
                                  ? 5.w
                                  : 0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _licenceManagementController.licenceTypeTab.value =
                                1;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _licenceManagementController
                                          .licenceTypeTab.value ==
                                      1
                                  ? Colors.white
                                  : Colors.grey.shade200,
                              borderRadius: _licenceManagementController
                                          .licenceTypeTab.value ==
                                      1
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(5.w),
                                      topRight: Radius.circular(5.w),
                                    )
                                  : BorderRadius.zero,
                            ),
                            child: Center(
                              child: Text(
                                "Driving Licence",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 5.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: _licenceManagementController
                                      .licenceTypeTab.value ==
                                  1
                              ? BorderRadius.only(
                                  bottomLeft: Radius.circular(5.w),
                                )
                              : BorderRadius.zero,
                        ),
                      ),
                    ],
                  );
                }),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Obx(() =>
                        _licenceManagementController.licenceTypeTab.value == 0
                            ? learnerLicence()
                            : drivingLicence()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget learnerLicence() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          SizedBox(height: 2.5.h),
          Text(
            "Apply for Learner License",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              letterSpacing: 2.5,
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 5.w),
          _customField(_licenceManagementController.fullName,
              "Full Name as per aadhaar"),
          SizedBox(height: 3.5.w),
          _customField(_licenceManagementController.aadhaar, "Aadhaar Number"),
          SizedBox(height: 3.5.w),
          _customField(_licenceManagementController.address, "Full Address"),
          SizedBox(height: 3.5.w),
          _customField(_licenceManagementController.district, "District"),
          SizedBox(height: 3.5.w),
          _customField(_licenceManagementController.state, "State"),
          SizedBox(height: 3.5.w),
          _customField(_licenceManagementController.bloodGroup, "Blood Group"),
          SizedBox(height: 3.5.w),
          _customField(
              _licenceManagementController.fatherName, "Father's Name"),
          SizedBox(height: 3.5.w),
          _customField(
              _licenceManagementController.motherName, "Mother's Name"),
          SizedBox(height: 3.5.w),
          SizedBox(
            height: 45,
            width: 100.w,
            child: TextFormField(
              cursorColor: Constants.yellowColor,
              controller: _licenceManagementController.mobile,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Mobile Number",
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
          ),
          SizedBox(height: 3.5.w),
          _licenceManagementController.otpSent.value
              ? SizedBox(
                  height: 45,
                  width: 100.w,
                  child: TextFormField(
                    cursorColor: Constants.yellowColor,
                    controller: _licenceManagementController.otp,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: InputDecoration(
                      counter: null,
                      counterText: "",
                      hintText: "OTP",
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
                )
              : const SizedBox(),
          SizedBox(height: 10.h),
          // Submit Button
          Obx(() {
            return _licenceManagementController.submitting.value
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
                      if (_licenceManagementController.fullName.text.length < 5 ||
                          _licenceManagementController.aadhaar.text.length !=
                              12 ||
                          _licenceManagementController.address.text.length <
                              10 ||
                          _licenceManagementController.district.text.length <
                              3 ||
                          _licenceManagementController.state.text.length < 5 ||
                          _licenceManagementController
                              .bloodGroup.text.isEmpty ||
                          _licenceManagementController.fatherName.text.length <
                              5 ||
                          _licenceManagementController.motherName.text.length <
                              5) {
                        Toasts.showErrorToast(
                            "Data", "Please fill Correct Form Data...!");
                      } else if (_licenceManagementController
                              .mobile.text.length !=
                          10) {
                        Toasts.showErrorToast(
                            "Mobile Number", "Invalid Mobile Number...!");
                      } else if (!_licenceManagementController.otpSent.value) {
                        _licenceManagementController.submitting.value = true;
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:
                              "+91${_licenceManagementController.mobile.text}",
                          verificationCompleted: (
                            PhoneAuthCredential credential,
                          ) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            _licenceManagementController.verify =
                                verificationId;
                            _licenceManagementController.otpSent.value = true;
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            _licenceManagementController.submitting.value =
                                false;
                          },
                        );
                        _licenceManagementController.submitting.value = false;
                      } else if (_licenceManagementController.otpSent.value) {
                        _licenceManagementController.submitting.value = true;
                        int response = await _licenceManagementController
                            .applyLicence("learner-licence");
                        _licenceManagementController.submitting.value = false;
                        if (response == 0) {
                          Toasts.showErrorToast(
                              "Error", "Unable to verify you..");
                        } else if (response == 1) {
                          Toasts.showErrorToast("Already Applied",
                              "You have already applied..! Please have patience..!");
                        } else {
                          if (mounted) {
                            CustomDialogs.showSuccessModal(context, "Applied",
                                "You have Successfully applied for Driving Licence..!");
                            resetData();
                          }
                        }
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Text(
                          _licenceManagementController.otpSent.value
                              ? "Verify Otp"
                              : "Send OTP",
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
          SizedBox(height: 5.h),
        ],
      ),
    );
  }

  Widget drivingLicence() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          SizedBox(height: 2.5.h),
          Text(
            "Apply for Driving License",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              letterSpacing: 2.5,
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 5.w),
          _customField(
            _licenceManagementController.fullName,
            "Full Name as per aadhaar",
          ),
          SizedBox(height: 3.5.w),
          _customField(
            _licenceManagementController.aadhaar,
            "Aadhaar Number",
          ),
          SizedBox(height: 3.5.w),
          _customField(
            _licenceManagementController.address,
            "Full Address",
          ),
          SizedBox(height: 3.5.w),
          _customField(
            _licenceManagementController.district,
            "District",
          ),
          SizedBox(height: 3.5.w),
          _customField(
            _licenceManagementController.state,
            "State",
          ),
          SizedBox(height: 3.5.w),
          _customField(
            _licenceManagementController.bloodGroup,
            "Blood Group",
          ),
          SizedBox(height: 3.5.w),
          _customField(
            _licenceManagementController.fatherName,
            "Father's Name",
          ),
          SizedBox(height: 3.5.w),
          _customField(
            _licenceManagementController.motherName,
            "Mother's Name",
          ),
          SizedBox(height: 3.5.w),
          SizedBox(
            height: 45,
            width: 100.w,
            child: TextFormField(
              cursorColor: Constants.yellowColor,
              controller: _licenceManagementController.mobile,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Mobile Number",
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
          ),
          SizedBox(height: 3.5.w),
          _licenceManagementController.otpSent.value
              ? SizedBox(
                  height: 45,
                  width: 100.w,
                  child: TextFormField(
                    cursorColor: Constants.yellowColor,
                    controller: _licenceManagementController.otp,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    decoration: InputDecoration(
                      counter: null,
                      counterText: "",
                      hintText: "OTP",
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
                )
              : const SizedBox(),
          SizedBox(height: 10.h),
          // Submit Button
          Obx(() {
            return _licenceManagementController.submitting.value
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
                      if (_licenceManagementController.fullName.text.length < 5 ||
                          _licenceManagementController.aadhaar.text.length !=
                              12 ||
                          _licenceManagementController.address.text.length <
                              10 ||
                          _licenceManagementController.district.text.length <
                              3 ||
                          _licenceManagementController.state.text.length < 5 ||
                          _licenceManagementController
                              .bloodGroup.text.isEmpty ||
                          _licenceManagementController.fatherName.text.length <
                              5 ||
                          _licenceManagementController.motherName.text.length <
                              5) {
                        Toasts.showErrorToast(
                            "Data", "Please fill Correct Form Data...!");
                      } else if (_licenceManagementController
                              .mobile.text.length !=
                          10) {
                        Toasts.showErrorToast(
                            "Mobile Number", "Invalid Mobile Number...!");
                      } else if (!_licenceManagementController.otpSent.value) {
                        // _licenceManagementController.sendOtp();
                        _licenceManagementController.submitting.value = true;
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:
                              "+91${_licenceManagementController.mobile.text}",
                          verificationCompleted: (
                            PhoneAuthCredential credential,
                          ) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            _licenceManagementController.verify =
                                verificationId;
                            _licenceManagementController.otpSent.value = true;
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            _licenceManagementController.submitting.value =
                                false;
                          },
                        );
                        _licenceManagementController.submitting.value = false;
                      } else if (_licenceManagementController.otpSent.value) {
                        _licenceManagementController.submitting.value = true;
                        int response = await _licenceManagementController
                            .applyLicence("driving-licence");
                        _licenceManagementController.submitting.value = false;
                        if (response == 0) {
                          Toasts.showErrorToast(
                              "Error", "Unable to verify you..");
                        } else if (response == 1) {
                          Toasts.showErrorToast("Already Applied",
                              "You have already applied..! Please have patience..!");
                        } else {
                          if (mounted) {
                            CustomDialogs.showSuccessModal(context, "Applied",
                                "You have Successfully applied for Learner Licence..!");
                            resetData();
                          }
                        }
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(
                        child: Text(
                          _licenceManagementController.otpSent.value
                              ? "Verify Otp"
                              : "Send OTP",
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
          SizedBox(height: 5.h),
        ],
      ),
    );
  }

  Widget _customField(TextEditingController controller, String hintText) {
    return SizedBox(
      height: 45,
      width: 100.w,
      child: TextFormField(
        cursorColor: Constants.yellowColor,
        controller: controller,
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
