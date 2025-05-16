import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:async';

class AdvancedQRScanner extends StatefulWidget {
  /// Constructor for advanced QR scanner
  const AdvancedQRScanner({super.key});

  @override
  State<AdvancedQRScanner> createState() => _AdvancedQRScannerState();
}

class _AdvancedQRScannerState extends State<AdvancedQRScanner>
    with SingleTickerProviderStateMixin {
  late MobileScannerController controller;
  Barcode? barcode;
  BarcodeCapture? capture;
  bool isScanning = true;
  bool isDialogOpen = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('QR Scanner'),
        //actions: [
        // IconButton(
        //   color: Colors.white,
        //   icon: ValueListenableBuilder(
        //     valueListenable: controller.torchState,
        //     builder: (context, state, child) {
        //       switch (state) {
        //         case TorchState.off:
        //           return const Icon(Icons.flash_off, color: Colors.grey);
        //         case TorchState.on:
        //           return const Icon(Icons.flash_on, color: Colors.yellow);
        //       }
        //     },
        //   ),
        //   onPressed: () => controller.toggleTorch(),
        // ),
        // IconButton(
        //   color: Colors.white,
        //   icon: ValueListenableBuilder(
        //     valueListenable: controller.cameraFacingState,
        //     builder: (context, state, child) {
        //       switch (state) {
        //         case CameraFacing.front:
        //           return const Icon(Icons.camera_front);
        //         case CameraFacing.back:
        //           return const Icon(Icons.camera_rear);
        //       }
        //     },
        //   ),
        //   onPressed: () => controller.switchCamera(),
        // ),
        //],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (capture) {
              if (!isScanning || isDialogOpen) return;

              final scannedBarcode = capture.barcodes.firstOrNull;
              if (scannedBarcode != null &&
                  (barcode?.rawValue != scannedBarcode.rawValue ||
                      barcode == null)) {
                setState(() {
                  this.capture = capture;
                  barcode = scannedBarcode;
                  isScanning = false;
                  HapticFeedback.mediumImpact();
                });

                // Show dialog with small delay to give visual feedback
                Timer(const Duration(milliseconds: 300), () {
                  _showResultDialog(barcode!);
                });
              }
            },
            overlayBuilder: (context, constraints) {
              return Stack(
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isScanning
                                  ? Colors.white.withOpacity(_animation.value)
                                  : Colors.green,
                              width: 3,
                            ),
                          ),
                          height: 250,
                          width: 250,
                          child: isScanning
                              ? null
                              : const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 48,
                                ),
                        ),
                      );
                    },
                  ),
                  // Corner indicators
                  _buildCornerIndicator(Alignment.topLeft),
                  _buildCornerIndicator(Alignment.topRight),
                  _buildCornerIndicator(Alignment.bottomLeft),
                  _buildCornerIndicator(Alignment.bottomRight),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      barcode?.displayValue ?? 'Position QR code within frame',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: isScanning ? null : _resetScanner,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Scan Again'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCornerIndicator(Alignment alignment) {
    // Calculate rotation based on corner position
    double rotation = 0;
    if (alignment == Alignment.topRight || alignment == Alignment.bottomLeft) {
      rotation = 90 * (3.14159 / 180); // 90 degrees in radians
    } else if (alignment == Alignment.bottomRight) {
      rotation = 180 * (3.14159 / 180); // 180 degrees in radians
    }

    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Transform.rotate(
          angle: rotation,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                top: const BorderSide(color: Colors.white, width: 3),
                left: const BorderSide(color: Colors.white, width: 3),
                right: const BorderSide(color: Colors.transparent),
                bottom: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _resetScanner() {
    setState(() {
      barcode = null;
      isScanning = true;
    });
  }

  void _showResultDialog(Barcode barcode) {
    isDialogOpen = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.qr_code, color: Colors.green),
            SizedBox(width: 8),
            Text('QR Code Result'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type: ${barcode.type.name}'),
            const SizedBox(height: 8),
            const Text('Value:', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                barcode.displayValue ?? 'No value found',
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
              _resetScanner();
              isDialogOpen = false;
            },
            icon: const Icon(Icons.close),
            label: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
