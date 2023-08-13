import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_model/prescription/controllers/speech_to_text_controller.dart';

class SpeechToTextScreen extends GetView<SpeechToTextController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: AvatarGlow(
        endRadius: 50.0,
        animate: true,
        duration: const Duration(milliseconds: 2000),
        glowColor: const Color(0X4DB6ACFF),
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds:100),
        showTwoGlows: true,
        child:GestureDetector(
          onTap: () => controller.startSpeaking(),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.indigo,
            child: Obx(() => Icon(controller.isListening.value?Icons.stop:Icons.mic_none_rounded)),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical:16 ) ,
              decoration: BoxDecoration(
                color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
              ),
              child: Obx(() => Text(controller.text.value,
                style: const TextStyle(fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600
                ),
              ))
            ),
          ),
        ),
      ),
    );
  }
}
