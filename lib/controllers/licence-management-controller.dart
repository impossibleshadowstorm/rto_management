import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LicenceManagementController extends GetxController {
  var licenceTypeTab = 0.obs;
  TextEditingController fullName = TextEditingController();
  TextEditingController aadhaar = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController otp = TextEditingController();
  var submitting = false.obs;
  var otpSent = false.obs;
  String verify = "";

  Future<int> applyLicence(String type) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      smsCode: otp.text,
      verificationId: verify,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    try {
      DocumentSnapshot<Map<String, dynamic>> db = await FirebaseFirestore
          .instance
          .collection(type)
          .doc(aadhaar.text)
          .get();

      if (db.exists) {
        return 1;
      } else {
        await FirebaseFirestore.instance
            .collection(type)
            .doc(aadhaar.text)
            .set({
          "name": fullName.text,
          "aadhaar": aadhaar.text,
          "address": address.text,
          "district": district.text,
          "state": state.text,
          "blood-group": bloodGroup.text,
          "father-name": fatherName.text,
          "mother-name": motherName.text,
          "mobile": mobile.text,
        });
        return 2;
      }
    } catch (error) {
      log(error.toString());
      return 0;
    }
  }
}
