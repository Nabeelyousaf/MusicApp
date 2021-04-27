import 'package:get/get.dart';

class PressedState extends GetxController {
  var pressedBool = true;
  changeStatus() {
    if (pressedBool) {
      pressedBool = false;
    } else {
      pressedBool = true;
    }
    update();
  }
}
