import 'package:get/get.dart';
import 'package:speech_model/prescription/controllers/drawing_controller.dart';
import 'package:speech_model/prescription/controllers/speech_to_text_controller.dart';
import 'package:speech_model/prescription/controllers/tab_bar_controller.dart';
import 'package:speech_model/prescription/controllers/typing_diagnostic_controller.dart';

class TabBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TabBarController>(() => TabBarController());
    Get.lazyPut<SpeechToTextController>(() => SpeechToTextController());
    Get.lazyPut<DrawingController>(() => DrawingController());
    Get.lazyPut<TypingDiagnosticController>(() => TypingDiagnosticController());
  }
}