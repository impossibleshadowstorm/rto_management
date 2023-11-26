import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rto_management/views/dashboard/dashboard-screen.dart';
import 'package:rto_management/views/dashboard/licence-management/licence-management-screen.dart';
import 'package:rto_management/views/dashboard/permit-applications/permit-applications-screen.dart';
import 'package:rto_management/views/dashboard/traffic-challans/traffic-challans-screen.dart';
import 'package:rto_management/views/dashboard/vehicle-registration/vehicle-registration-screen.dart';

class MainApplicationController extends GetxController {
  var bottomNavIdx = 2.obs;

  List bottomNavData = [
    {
      "name": "Vehicles",
      "page": const VehicleRegistrationScreen(),
      "icon": Icons.local_police
    },
    {
      "name": "Licence",
      "page": const LicenceManagementScreen(),
      "icon": Icons.local_police
    },
    {
      "name": "Dashboard",
      "page": const DashboardScreen(),
      "icon": Icons.local_police
    },
    {
      "name": "Permits",
      "page": const PermitApplicationScreen(),
      "icon": Icons.local_police
    },
    {
      "name": "Challan",
      "page": const TrafficChallanScreen(),
      "icon": Icons.local_police
    },
  ];
}
