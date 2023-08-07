import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextController extends GetxController
{
  SpeechToText speech = SpeechToText();
  RxBool  is_Listening = false.obs;
  String text = 'Hold the button and start speaking';


  void startSpeaking() async {
    if (!is_Listening.value) {
      bool available = await speech.initialize(
          onStatus: (val) => print('onStatus: $val'),
          onError: (val) => print('onError: $val'),
          debugLogging: true
      );
      if (available) {
        is_Listening.value = true;
        speech.listen(
          onResult: (result) {
            text = result.recognizedWords;
            // if(result.hasConfidenceRating && result.confidence >0)
            // {
            //   text = result.recognizedWords;
            // }
          });
      }
    }else{
      speech.stop();
      is_Listening.value = false;
      print('stooooooooooooooooooooooop');
    }
  }
}