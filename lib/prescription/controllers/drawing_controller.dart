import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class DrawingController extends GetxController {

   final points = <Offset>[].obs;
   final undoList = <List<Offset>>[].obs;
   final redoList = <List<Offset>>[].obs;
   final isDrawing = false.obs;

  void addPoint(Offset point) {
    points.add(point);
  }

  void clearPoints() {
    points.clear();
    undoList.clear();
    redoList.clear();
  }

   void startDrawing() {
     isDrawing.value = true;
   }

   void stopDrawing() {
     isDrawing.value = false;
   }

  void undo() {
    if (points.isNotEmpty) {
      redoList.add(List.from(points));
      undoList.add(points);
      points.clear();
      if (undoList.isNotEmpty) {
        points.addAll(undoList.removeLast());
      }
    }
  }

  void redo() {
    if (redoList.isNotEmpty) {
      undoList.add(List.from(points));
      points.clear();
      points.addAll(redoList.removeLast());
    }
  }

  /*
  Future<void> recognizeText() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
        recorder, Rect.fromPoints(Offset(0, 0), Offset(300, 300)));
    final painter = MyPainter(points: points);
    painter.paint(canvas, Size(300, 300));

    final picture = recorder.endRecording();
    final img = await picture.toImage(300, 300);
    final imgBytes = await img.toByteData(format: ui.ImageByteFormat.png);
    final image = FirebaseVisionImage.fromBytes(
      imgBytes.buffer.asUint8List(),
      FirebaseVisionImageMetadata(
        rawFormat: imgBytes.format.raw,
        size: Size(300, 300),
        rotation: ImageRotation.rotation0,
      ),
    );

    final textRecognizer = FirebaseVision.instance.textRecognizer();
    final visionText = await textRecognizer.processImage(image);

    String recognizedText = '';
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        recognizedText += line.text + ' ';
      }
    }

    textRecognizer.close();
  }

  String convertPathsToJson() {
  final List<Map<String, dynamic>> pathsData = [];

  for (final path in points) {
    final pathData = {
      'x': path.dx,
      'y': path.dy,
    };
    pathsData.add(pathData);
  }

  return jsonEncode(pathsData);
}

List<Offset> pathsFromJson(String json) {
  final List<Map<String, dynamic>> pathsData = jsonDecode(json);

  final List<Offset> paths = pathsData.map((pathData) {
    return Offset(pathData['x'], pathData['y']);
  }).toList();

  return paths;
}

   */
}

