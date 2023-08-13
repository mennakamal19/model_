import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextController extends GetxController
{
  SpeechToText speech = SpeechToText();
  RxBool  isListening = false.obs;
  RxString text = 'Hold the button and start speaking'.obs;


  void startSpeaking() async {
    if (!isListening.value) {
      bool available = await speech.initialize(
          onStatus: (val) => print('onStatus: $val'),
          onError: (val) => print('onError: $val'),
          debugLogging: true
      );
      if (available) {
        isListening.value = true;
        speech.listen(
          onResult: (result) {
            text.value = result.recognizedWords;
            isListening.value = false;
          });
      }
    }else{
      speech.stop();
      isListening.value = false;
      print('stooooooooooooooooooooooop');
    }
  }
}