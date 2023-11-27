import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/controllers/licence-management-controller.dart';
import 'package:rto_management/controllers/main-application-controller.dart';
import 'package:rto_management/controllers/permit-application-controller.dart';
import 'package:rto_management/controllers/trafic-challan-controller.dart';
import 'package:rto_management/controllers/vehicle-transfer-controller.dart';
import 'package:rto_management/services/global.dart';
import 'package:rto_management/views/splash-screen.dart';

void main() async {
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MainApplicationController mainApplicationController =
      Get.put(MainApplicationController());
  VehicleRegistrationTransferController vehicleRegistrationTransferController =
      Get.put(VehicleRegistrationTransferController());
  LicenceManagementController licenceManagementController =
      Get.put(LicenceManagementController());
  PermitApplicationController permitApplicationController =
      Get.put(PermitApplicationController());
  TrafficChallanController trafficChallanController =
      Get.put(TrafficChallanController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, type) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RTO Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
