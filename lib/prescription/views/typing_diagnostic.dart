import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_model/app/modules/controllers/typing_diagnostic_controller.dart';

class TypingDiagnostic extends StatelessWidget {

  TypingDiagnosticController controller = Get.put(TypingDiagnosticController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              GetBuilder<TypingDiagnosticController>(
                  builder: (controller)=> Form(
                      key: controller.typingFormKey,
                      child: Column(
                        children: [
                          defaultFormField(
                              controller: controller.patientNameController,
                              hint: 'Patient Name',
                              type: TextInputType.text,
                              validate: (String value){}),
                          defaultFormField(
                              controller: controller.patientAgeController,
                              hint: 'Patient Age',
                              type: TextInputType.number,
                              validate: (String value){}),
                          defaultFormField(
                              controller: controller.medicaneController,
                              hint: 'Medicane Name',
                              type: TextInputType.text,
                              maxLines: 8,
                              validate: (String value){}),
                          defaultFormField(
                              controller: controller.numberOfDaysController,
                              hint: 'No.Of Days',
                              type: TextInputType.number,
                              validate: (String value){}),
                          defaultFormField(
                              controller: controller.quantityController,
                              hint: 'Quantity',
                              type: TextInputType.number,
                              validate: (String value){}),
                          defaultFormField(
                              controller: controller.dailyDoseController,
                              hint: 'Daily Dose',
                              type: TextInputType.number,
                              validate: (String value){}),
                          const SizedBox(height: 10),
                          defaultButton(text: 'Next', press: () => controller.next())
                        ],
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
