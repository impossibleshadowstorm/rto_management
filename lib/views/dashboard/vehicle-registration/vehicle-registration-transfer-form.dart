import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/controllers/vehicle-transfer-controller.dart';
import 'package:rto_management/utils/constants.dart';
import 'package:rto_management/utils/dialogs.dart';
import 'package:rto_management/utils/toasts.dart';

class VehicleRegistrationTransferForm extends StatefulWidget {
  const VehicleRegistrationTransferForm({super.key});

  @override
  State<VehicleRegistrationTransferForm> createState() =>
      _VehicleRegistrationTransferFormState();
}

class _VehicleRegistrationTransferFormState
    extends State<VehicleRegistrationTransferForm> {
  final VehicleRegistrationTransferController
      _vehicleRegistrationTransferController = Get.find();

  @override
  void dispose() {
    super.dispose();
    _vehicleRegistrationTransferController.vehicleNumberController.text = "";
    _vehicleRegistrationTransferController.engineNumberController.text = "";
    _vehicleRegistrationTransferController.chassisNumberController.text = "";
    _vehicleRegistrationTransferController.submitting.value = false;
    _vehicleRegistrationTransferController.insurancePhoto = null;
    _vehicleRegistrationTransferController.rcPhoto = null;
    _vehicleRegistrationTransferController.pucPhoto = null;
    _vehicleRegistrationTransferController.nocPhoto = null;
    _vehicleRegistrationTransferController.insurancePhotoSelected.value = false;
    _vehicleRegistrationTransferController.rcPhotoSelected.value = false;
    _vehicleRegistrationTransferController.nocPhotoSelected.value = false;
    _vehicleRegistrationTransferController.pucPhotoSelected.value = false;
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
                      "Vehicle Data",
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
                      SizedBox(
                        height: 45,
                        width: 100.w,
                        child: TextFormField(
                          cursorColor: Constants.yellowColor,
                          controller: _vehicleRegistrationTransferController
                              .vehicleNumberController,
                          decoration: InputDecoration(
                            hintText: "Vehicle Number",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 3.5.w),
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
                      SizedBox(
                        height: 45,
                        width: 100.w,
                        child: TextFormField(
                          cursorColor: Constants.yellowColor,
                          controller: _vehicleRegistrationTransferController
                              .engineNumberController,
                          decoration: InputDecoration(
                            hintText: "Engine Number",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 3.5.w),
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
                      SizedBox(
                        height: 45,
                        width: 100.w,
                        child: TextFormField(
                          cursorColor: Constants.yellowColor,
                          controller: _vehicleRegistrationTransferController
                              .chassisNumberController,
                          decoration: InputDecoration(
                            hintText: "Chassis Number",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 3.5.w),
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
                      SizedBox(height: 5.w),
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          "Document Upload",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.black54,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5.h),
                      // Document Upload
                      Obx(() {
                        return Column(
                          children: [
                            uploadFile(
                              "RC [Registration Certificate]",
                              "rc",
                              _vehicleRegistrationTransferController
                                  .rcPhotoSelected.value,
                            ),
                            SizedBox(height: 2.5.h),
                            uploadFile(
                              "Insurance",
                              "insurance",
                              _vehicleRegistrationTransferController
                                  .insurancePhotoSelected.value,
                            ),
                            SizedBox(height: 2.5.h),
                            uploadFile(
                              "NOC Certificate",
                              "noc",
                              _vehicleRegistrationTransferController
                                  .nocPhotoSelected.value,
                            ),
                            SizedBox(height: 2.5.h),
                            uploadFile(
                              "PUC Certificate",
                              "puc",
                              _vehicleRegistrationTransferController
                                  .pucPhotoSelected.value,
                            ),
                          ],
                        );
                      }),

                      SizedBox(height: 5.h),
                      // Upload Button
                      Obx(() {
                        return _vehicleRegistrationTransferController
                                .submitting.value
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
                                  if (_vehicleRegistrationTransferController
                                          .insurancePhoto ==
                                      null) {
                                    Toasts.showErrorToast("Insurance",
                                        "Please Select an Insurance Image.!");
                                  } else if (_vehicleRegistrationTransferController
                                          .insurancePhoto ==
                                      null) {
                                    Toasts.showErrorToast(
                                        "RC", "Please Select an RC Image.!");
                                  } else if (_vehicleRegistrationTransferController
                                          .insurancePhoto ==
                                      null) {
                                    Toasts.showErrorToast(
                                        "PUC", "Please Select an PUC Image.!");
                                  } else if (_vehicleRegistrationTransferController
                                          .insurancePhoto ==
                                      null) {
                                    Toasts.showErrorToast(
                                        "NOC", "Please Select an NOC Image.!");
                                  } else if (_vehicleRegistrationTransferController
                                          .vehicleNumberController.text.length <
                                      5) {
                                    Toasts.showErrorToast("Vehicle Number",
                                        "Please Enter valid Vehicle Number.!");
                                  } else if (_vehicleRegistrationTransferController
                                          .engineNumberController.text.length <
                                      5) {
                                    Toasts.showErrorToast("Engine Number",
                                        "Please Enter valid Engine Number.!");
                                  } else if (_vehicleRegistrationTransferController
                                          .chassisNumberController.text.length <
                                      5) {
                                    Toasts.showErrorToast("Chassis Number",
                                        "Please Enter valid Chassis Number.!");
                                  } else {
                                    if (await _vehicleRegistrationTransferController
                                            .initiateTransfer() ==
                                        1) {
                                      if (mounted) {
                                        CustomDialogs.showSuccessModal(
                                          context,
                                          "Successful",
                                          "Your Application for Vehicle Registration Transfer is successfully registered..!",
                                        );
                                      }
                                    } else if (await _vehicleRegistrationTransferController
                                            .initiateTransfer() ==
                                        2) {
                                      if (mounted) {
                                        CustomDialogs.showSuccessModal(
                                          context,
                                          "Requested",
                                          "Your Application is already registered before. Please Wait..!",
                                        );
                                      }
                                    } else {
                                      if (mounted) {
                                        CustomDialogs.showSuccessModal(
                                          context,
                                          "Error",
                                          "Error Submitting Request",
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

  Widget uploadFile(String name, String type, bool selected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.poppins(
            color: Colors.grey.shade600,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.5.w),
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            _vehicleRegistrationTransferController.getPermissionStatus();
            _showPicker(context, type);
          },
          child: Container(
            height: 220,
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: .5.w),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Constants.greyTextColor),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.w),
                    child: selected
                        ? Container(
                            decoration: BoxDecoration(
                              color: Constants.yellowColor,
                            ),
                            child: Center(
                              child: Text(
                                "Image Selected",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : const Image(
                            image: AssetImage("assets/upload.jpg"),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Text(
                  "Click & Select File to upload [Only Images]",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.5.sp,
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(height: 2.5.w),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showPicker(BuildContext context, String type) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(
                      Icons.photo_library,
                      size: 18.sp,
                    ),
                    title: Text(
                      'Gallery',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                      ),
                    ),
                    onTap: () {
                      _vehicleRegistrationTransferController
                          .imgFromGallery(type);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(
                    Icons.photo_camera,
                    size: 18.sp,
                  ),
                  title: Text(
                    'Camera',
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                    ),
                  ),
                  onTap: () {
                    _vehicleRegistrationTransferController.imgFromCamera(type);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
