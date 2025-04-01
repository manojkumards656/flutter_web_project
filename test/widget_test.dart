import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera/camera.dart';
import "package:flutter_web_project/cam.dart";

// Mock CameraController for testing
class MockCameraController extends CameraController {
  MockCameraController()
      : super(
          CameraDescription(
            name: 'Test Camera',
            lensDirection: CameraLensDirection.back,
            sensorOrientation: 0,
          ),
          ResolutionPreset.high,
        );

  @override
  Future<void> initialize() async {}
}

void main() {
  testWidgets('CameraScreen UI test', (WidgetTester tester) async {
    // Create a mock camera controller
    final mockCameraController = MockCameraController();

    // Build the CameraScreen with the mock camera controller
    await tester.pumpWidget(MaterialApp(
      home: CameraScreen(cameraController: mockCameraController),
    ));

    // Verify "Live Capture" title exists
    expect(find.text('Live Capture'), findsOneWidget);

    // Verify the Floating Action Button exists
    expect(find.byIcon(Icons.camera_alt), findsOneWidget);

    // Tap the FAB to simulate image capture
    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pump();

    // Ensure camera preview exists (this will be mocked)
    expect(find.byType(CameraPreview), findsOneWidget);
  });
}
