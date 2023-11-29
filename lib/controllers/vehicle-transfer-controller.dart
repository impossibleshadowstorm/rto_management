import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class VehicleRegistrationTransferController extends GetxController {
  String imageUrl = "";
  var rcPhotoSelected = false.obs;
  var insurancePhotoSelected = false.obs;
  var nocPhotoSelected = false.obs;
  var pucPhotoSelected = false.obs;
  File? rcPhoto;
  final ImagePicker rcPicker = ImagePicker();
  File? insurancePhoto;
  final ImagePicker _insurancePicker = ImagePicker();
  File? nocPhoto;
  final ImagePicker _nocPicker = ImagePicker();
  File? pucPhoto;
  final ImagePicker _pucPicker = ImagePicker();
  var submitting = false.obs;

  // Text Controllers
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController engineNumberController = TextEditingController();
  TextEditingController chassisNumberController = TextEditingController();

  Future imgFromGallery(String type) async {
    XFile? pickedFile;
    if (type == "insurance") {
      pickedFile =
          await _insurancePicker.pickImage(source: ImageSource.gallery);
    } else if (type == "rc") {
      pickedFile = await rcPicker.pickImage(source: ImageSource.gallery);
    } else if (type == "noc") {
      pickedFile = await _nocPicker.pickImage(source: ImageSource.gallery);
    } else if (type == "puc") {
      pickedFile = await _pucPicker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      if (type == "insurance") {
        insurancePhoto = File(pickedFile.path);
        insurancePhotoSelected.value = true;
      } else if (type == "rc") {
        rcPhoto = File(pickedFile.path);
        rcPhotoSelected.value = true;
      } else if (type == "noc") {
        nocPhoto = File(pickedFile.path);
        nocPhotoSelected.value = true;
      } else if (type == "puc") {
        pucPhoto = File(pickedFile.path);
        pucPhotoSelected.value = true;
      }
      // uploadFile();
    } else {
      log('No image selected.');
    }
  }

  Future imgFromCamera(String type) async {
    XFile? pickedFile;
    if (type == "insurance") {
      pickedFile = await _insurancePicker.pickImage(source: ImageSource.camera);
    } else if (type == "rc") {
      pickedFile = await rcPicker.pickImage(source: ImageSource.camera);
    } else if (type == "noc") {
      pickedFile = await _nocPicker.pickImage(source: ImageSource.camera);
    } else if (type == "puc") {
      pickedFile = await _pucPicker.pickImage(source: ImageSource.camera);
    }

    if (pickedFile != null) {
      if (type == "insurance") {
        insurancePhoto = File(pickedFile.path);
        insurancePhotoSelected.value = true;
      } else if (type == "rc") {
        rcPhoto = File(pickedFile.path);
        rcPhotoSelected.value = true;
      } else if (type == "noc") {
        nocPhoto = File(pickedFile.path);
        nocPhotoSelected.value = true;
      } else if (type == "puc") {
        pucPhoto = File(pickedFile.path);
        pucPhotoSelected.value = true;
      }
      // uploadFile();
    } else {
      log('No image selected.');
    }
  }

  Future<String?> uploadFile(String type) async {
    String? fileName;

    if (type == "insurance") {
      if (insurancePhoto == null) return null;
      fileName = basename(insurancePhoto!.path);
    } else if (type == "rc") {
      if (rcPhoto == null) return null;
      fileName = basename(rcPhoto!.path);
    } else if (type == "noc") {
      if (nocPhoto == null) return null;
      fileName = basename(nocPhoto!.path);
    } else if (type == "puc") {
      if (pucPhoto == null) return null;
      fileName = basename(pucPhoto!.path);
    }

    try {
      final ref = FirebaseStorage.instance
          .ref("files")
          .child("${fileName!}${DateTime.now().toString()}");
      if (type == "insurance") {
        await ref.putFile(insurancePhoto!);
      } else if (type == "rc") {
        await ref.putFile(rcPhoto!);
      } else if (type == "noc") {
        await ref.putFile(nocPhoto!);
      } else if (type == "puc") {
        await ref.putFile(pucPhoto!);
      }

      return ref.getDownloadURL();
    } catch (e) {
      log('error occured');
      return null;
    }
  }

  var isCameraPermissionGranted = false.obs;

  void getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;
    if (status.isGranted) {
      log('Camera Permission: GRANTED');
      isCameraPermissionGranted.value = true;
    } else {
      log('Camera Permission: DENIED');
    }
  }

  Future<int> initiateTransfer() async {
    try {
      // Get other details
      String vehicleNumber = vehicleNumberController.text;
      String engineNumber = engineNumberController.text;
      String chassisNumber = chassisNumberController.text;
      submitting.value = true;
      final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('vehicle-transfer')
          .doc(vehicleNumber)
          .get();

      if (docSnapshot.exists) {
        submitting.value = false;
        return 2;
      }

      // Upload files and get download URLs
      String? rc = await uploadFile("rc");
      String? insurance = await uploadFile("insurance");
      String? noc = await uploadFile("noc");
      String? puc = await uploadFile("puc");

      // Store data in FireStore
      await FirebaseFirestore.instance
          .collection('vehicle-transfer')
          .doc(vehicleNumber)
          .set({
        'rc': rc,
        'insurance': insurance,
        'noc': noc,
        'puc': puc,
        'vehicleNumber': vehicleNumber,
        'engineNumber': engineNumber,
        'chassisNumber': chassisNumber,
        "e-challan": generateEChallanNumber(),
      });

      // If successful, return 1
      submitting.value = false;
      return 1;
    } catch (e) {
      // If any error occurs, print it and return 0
      log('Error occurred: $e');
      submitting.value = false;
      return 0;
    }
  }

  String generateEChallanNumber() {
    // Get the initial 4 characters from rcNumber
    String rcPrefix = vehicleNumberController.text.substring(0, 4);

    // Get the initial 4 characters from taxReceipt
    String taxPrefix = engineNumberController.text.substring(0, 4);

    // Get the current date in text (yyyyMMdd format)
    String currentDate =
        DateFormat('yyyyMMdd').format(DateTime.now()).substring(6);

    // Get the current month in text (MM format)
    // String currentMonth = DateFormat('MM').format(DateTime.now());
    String currentMonth =
        DateFormat('MMM').format(DateTime.now()).toUpperCase();

    // Get the initial 4 characters from insurance
    String insurancePrefix = chassisNumberController.text.substring(0, 2);

    // Concatenate all the components to form the eChallan number
    String eChallanNumber =
        '$rcPrefix$taxPrefix$currentDate$currentMonth$insurancePrefix';

    return eChallanNumber;
  }
}
