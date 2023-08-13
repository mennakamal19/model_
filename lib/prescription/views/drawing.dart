import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_model/prescription/controllers/drawing_controller.dart';
import 'package:speech_model/prescription/draw.dart';

class Drawing extends GetView<DrawingController> {
  const Drawing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () => controller.clearPoints(),
              child: const Icon(Icons.delete_outlined)),
          const SizedBox(width: 10),
          FloatingActionButton(
              onPressed: () => controller.undo(),
           child: const Icon(Icons.undo)),
          const SizedBox(width: 10),
          FloatingActionButton(
              onPressed: () => controller.redo(),
              child: const Icon(Icons.redo)),
          const SizedBox(width: 10),
          FloatingActionButton(
              onPressed: (){},
              child: const Icon(Icons.send)),
        ],
      ),
      body: Obx(() => GestureDetector(
        onPanStart: (_)  => controller.startDrawing(),
        onPanUpdate: (details) => controller.addPoint(details.localPosition),
        onPanEnd: (_) => controller.stopDrawing(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomPaint(
            painter: MyPainter(points: controller.points),
          ),
        ),
      )),
    );
  }
}
