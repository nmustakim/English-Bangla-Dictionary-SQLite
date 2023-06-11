import 'package:e2b_dictionary/global_widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../controller/settings_controller.dart';

class Settings extends StatelessWidget {

  Settings({Key? key}) : super(key: key);
  final SettingsController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            centerTitle:true,title:  const Text('Settings'),),
        body:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            children: [Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              height:40,
              child: Row(children: [
               const Text('Heading Font',), const SizedBox(width: 20,),InkWell(onTap:ctrl.titleFontIncrement,child: const Icon(Icons.add_circle),),const SizedBox(width: 8,),Obx(() => Text(ctrl.titleFontSize.value.toString())),const SizedBox(width: 8,),const SizedBox(width: 8,),InkWell(onTap: ctrl.titleFontDecrement,child: const Icon(Icons.remove_circle),)],),
            ),
          ),

            Card(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                height:40,
                child: Row(children: [
              const Text('Body Font',), const SizedBox(width: 16,),InkWell(onTap:ctrl.bodyFontIncrement,child: const Icon(Icons.add_circle),),const SizedBox(width: 8,),Obx(() => Text(ctrl.bodyFontSize.value.toString())),const SizedBox(width: 8,),InkWell(onTap: ctrl.bodyFontDecrement,child: const Icon(Icons.remove_circle),)],),
              ),
            ),
            Card(child: ListTile(title: TextButton(onPressed: (){Get.isDarkMode ? Get.changeThemeMode(ThemeMode.light) : Get.changeThemeMode(ThemeMode.dark);}, child: const Text('Switch Theme',style: TextStyle(fontSize: 17),))))

          ],),
        )
    );
  }
}