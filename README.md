# nbc_wallet

Flutter Wallet For NBC.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

git clean -f

#QRCode Solution:
#1.info.plist
  <key>NSCameraUsageDescription</key>
	<string>Camera permission is required for barcode scanning.</string>
#2.pod "MTBBarcodeScanner"
#3.code :
		    [self.scanner startScanningWithResultBlock:^(NSArray<AVMetadataMachineReadableCodeObject *> *codes) {
        [self.scanner stopScanning];
        AVMetadataMachineReadableCodeObject *code =codes.firstObject;
        if(code){
            [self.delegate barcodeScannerViewController:self didScanBarcodeWithResult:code.stringValue];
            [self dismissViewControllerAnimated:NO completion:nil];
        }
    }];

# Cocopods Solution
pod repo remove master
pod setup
pod install