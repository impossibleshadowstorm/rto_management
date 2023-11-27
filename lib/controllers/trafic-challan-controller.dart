import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TrafficChallanController extends GetxController {
  var submitting = false.obs;

  TextEditingController rcNumber = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController challanNumber = TextEditingController();

  Future<int> payChallan() async {
    try {
      await FirebaseFirestore.instance
          .collection("challan")
          .doc(rcNumber.text)
          .set({
        "rc": rcNumber.text,
        "district": district.text,
        "state": state.text,
        "challan-number": challanNumber.text,
      });

      return 1;
    } catch (error) {
      log(error.toString());
      return 0;
    }
  }

  void resetData() {
    rcNumber.text = "";
    state.text = "";
    district.text = "";
    challanNumber.text = "";
  }
}
