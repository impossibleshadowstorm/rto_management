import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PermitApplicationController extends GetxController {
  var submitting = false.obs;

  TextEditingController rcNumber = TextEditingController();
  TextEditingController taxReceipt = TextEditingController();
  TextEditingController insurance = TextEditingController();
  TextEditingController previousPermit = TextEditingController();

  Future<int> addPermitApplication() async {
    try {
      submitting.value = true;
      DocumentSnapshot<Map<String, dynamic>> db = await FirebaseFirestore
          .instance
          .collection("permit-applications")
          .doc(rcNumber.text)
          .get();

      if (db.exists) {
        submitting.value = false;
        return 1;
      } else {
        await FirebaseFirestore.instance
            .collection("permit-applications")
            .doc(rcNumber.text)
            .set({
          "rc": rcNumber.text,
          "tax-receipt": taxReceipt.text,
          "insurance": insurance.text,
          "previous-permit-number": previousPermit.text,
          "e-challan": generateEChallanNumber(),
        });
        submitting.value = false;
        return 2;
      }
    } catch (error) {
      log(error.toString());
      submitting.value = false;
      return 0;
    }
  }

  String generateEChallanNumber() {
    // Get the initial 4 characters from rcNumber
    String rcPrefix = rcNumber.text.substring(0, 4);

    // Get the initial 4 characters from taxReceipt
    String taxPrefix = taxReceipt.text.substring(0, 4);

    // Get the current date in text (yyyyMMdd format)
    String currentDate =
        DateFormat('yyyyMMdd').format(DateTime.now()).substring(6);

    // Get the current month in text (MM format)
    // String currentMonth = DateFormat('MM').format(DateTime.now());
    String currentMonth =
        DateFormat('MMM').format(DateTime.now()).toUpperCase();

    // Get the initial 4 characters from insurance
    String insurancePrefix = insurance.text.substring(0, 2);

    // Get the initial 4 characters from previousPermit, if not empty
    String permitPrefix = previousPermit.text.isNotEmpty
        ? previousPermit.text.substring(0, 2)
        : '';

    // Concatenate all the components to form the eChallan number
    String eChallanNumber =
        '$rcPrefix$taxPrefix$currentDate$currentMonth$insurancePrefix$permitPrefix';

    return eChallanNumber;
  }

  void resetData() {
    rcNumber.text = "";
    taxReceipt.text = "";
    insurance.text = "";
    previousPermit.text = "";
    submitting.value = false;
  }
}
