import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void onInit(){
    super.onInit();
    tabController = new TabController(length: 3, vsync: this);
  }
}