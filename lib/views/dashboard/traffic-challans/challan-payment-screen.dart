import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rto_management/controllers/trafic-challan-controller.dart';
import 'package:rto_management/utils/dialogs.dart';
import 'package:rto_management/utils/toasts.dart';
import '../../../utils/constants.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  MobileScannerController cameraController = MobileScannerController();
  final TrafficChallanController _trafficChallanController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/confetti.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.8,
                    width: size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("assets/payment.png"),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Google Pay Number",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  InkWell(
                                    onTap: () {
                                      Clipboard.setData(const ClipboardData(
                                              text: '+919639588268'))
                                          .then((_) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'GPay Number copied to your clipboard!')));
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Constants.backgroundColor,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "+91 9639588268",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 45,
                                            child: Icon(
                                              Icons.copy,
                                              color: Colors.black87,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Bank Details",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.account_balance,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "Bank Transfer",
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            )
                                          ],
                                        ),
                                        Icon(Icons.check_circle,
                                            color: Constants.primaryColor),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Bank Name",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Clipboard.setData(const ClipboardData(
                                                text: 'Axis Bank'))
                                            .then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Bank Name copied to your clipboard!')));
                                        });
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Axis Bank",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: Colors.black87,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Account Holder Name",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Clipboard.setData(const ClipboardData(
                                                text: 'Pay Gov.'))
                                            .then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Account Holder Name copied to your clipboard!',
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Pay Gov.",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: Colors.black87,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Account Number",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Clipboard.setData(const ClipboardData(
                                                text: '921020049194854'))
                                            .then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Account Number copied to your clipboard!')));
                                        });
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "921020049194854",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: Colors.black87,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "IFSC Code",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Clipboard.setData(const ClipboardData(
                                                text: 'UTIB0003948'))
                                            .then((_) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'IFSC Code copied to your clipboard!')));
                                        });
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "UTIB0003948",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: Colors.black87,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Back Button
            Positioned(
              top: size.height * 0.15,
              left: 20,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
              ),
            ),
            // Paid Button
            Positioned(
              top: size.height * 0.15,
              right: 20,
              child: InkWell(
                onTap: () async {
                  int response = await _trafficChallanController.payChallan();
                  if (response == 0) {
                    Toasts.showErrorToast(
                        "Error", "Unable to Pay your Challan..!");
                  } else if (response == 1) {
                    _trafficChallanController.resetData();
                    if (mounted) {
                      CustomDialogs.showSuccessModal(
                        context,
                        "Success",
                        "You have successfully paid your challan..!",
                      );
                    }
                  }
                },
                child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Paid",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 2.5.w),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 17.sp,
                        )
                      ],
                    )
                    // const Icon(
                    //   Icons.arrow_back_sharp,
                    //   color: Colors.white,
                    //   size: 23,
                    // ),
                    ),
              ),
            ),
            //left bubble
            Positioned(
              top: size.height * 0.5 - 15,
              left: size.width * 0.05 - 15,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.primaryColor,
                ),
              ),
            ),
            // right bubble
            Positioned(
              top: size.height * 0.5 - 15,
              right: size.width * 0.05 - 15,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.primaryColor,
                ),
              ),
            ),
            // center horizontal line
            Positioned(
              top: size.height * 0.5 - 2,
              right: size.width * 0.05 + 30,
              child: SizedBox(
                width: size.width * 0.8 - 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.1 - 15,
              right: size.width * 0.05 + 30,
              child: SizedBox(
                width: size.width * 0.8 - 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Mobile Scanner'),
//       actions: [
//         IconButton(
//           color: Colors.white,
//           icon: ValueListenableBuilder(
//             valueListenable: cameraController.torchState,
//             builder: (context, state, child) {
//               switch (state) {
//                 case TorchState.off:
//                   return const Icon(Icons.flash_off, color: Colors.grey);
//                 case TorchState.on:
//                   return const Icon(Icons.flash_on, color: Colors.yellow);
//               }
//             },
//           ),
//           iconSize: 32.0,
//           onPressed: () => cameraController.toggleTorch(),
//         ),
//         IconButton(
//           color: Colors.white,
//           icon: ValueListenableBuilder(
//             valueListenable: cameraController.cameraFacingState,
//             builder: (context, state, child) {
//               switch (state) {
//                 case CameraFacing.front:
//                   return const Icon(Icons.camera_front);
//                 case CameraFacing.back:
//                   return const Icon(Icons.camera_rear);
//               }
//             },
//           ),
//           iconSize: 32.0,
//           onPressed: () => cameraController.switchCamera(),
//         ),
//       ],
//     ),
//     body: Container(
//       height: 100.h,
//       width: 100.w,
//     ),
//     // body: MobileScanner(
//     //   // fit: BoxFit.contain,
//     //   controller: cameraController,
//     //   onDetect: (capture) {
//     //     final List<Barcode> barcodes = capture.barcodes;
//     //     final Uint8List? image = capture.image;
//     //     for (final barcode in barcodes) {
//     //       if(barcode.rawValue == "hello"){
//     //         Get.to(() => const ChallanSuccessScreen());
//     //       }
//     //       else{
//     //       }
//     //     }
//     //   },
//     // ),
//   );
// }
}
