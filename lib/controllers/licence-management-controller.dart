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
  var submitting = false.obs;
}
