import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypingDiagnosticController extends GetxController {
  final typingFormKey = GlobalKey<FormState>();
  var patientNameController = TextEditingController();
  var patientAgeController = TextEditingController();
  var medicaneController = TextEditingController();
  var numberOfDaysController = TextEditingController();
  var quantityController = TextEditingController();
  var dailyDoseController = TextEditingController();

  void next(){
    Map<String,dynamic> diagnosticMap = {
      'patient_name' : patientNameController.text,
      'patient_age' : patientAgeController.text,
      'medicane' : medicaneController.text,
      'number_of_days' : numberOfDaysController.text,
      'quantity' : quantityController.text,
      'daily_dose' : dailyDoseController.text
    };
  }
}