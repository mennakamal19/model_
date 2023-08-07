import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_model/app/modules/controllers/tab_bar_controller.dart';
import 'package:speech_model/app/modules/views/speech_to_text.dart';
import 'package:speech_model/app/modules/views/typing_diagnostic.dart';

class TabBarScreen extends StatelessWidget {

  TabBarController controller = Get.put(TabBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Diagnostic',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
        )),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: ColoredBox(
            color: Colors.white,
            child: TabBar(
              controller: controller.tabController,
              tabs: const [
                Tab(
                  icon: Icon(Icons.mic_none_rounded,color: Colors.black,),
                  child: Text('Voice',style: TextStyle(color: Colors.black)),
                ),
                Tab(
                  icon: Icon(Icons.edit,color: Colors.black,),
                  child: Text('Draw',style: TextStyle(color: Colors.black)),
                ),
                Tab(
                  icon: Icon(Icons.edit_calendar_rounded,color: Colors.black,),
                  child: Text('Typing',style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          SpeechToTextScreen(),
          TypingDiagnostic(),
          TypingDiagnostic(),
        ],
      ),
    );
  }
}
