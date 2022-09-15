import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  XFile? imagefile;
   takePhotoFromSource(source) async {
    XFile? pickedfile = await ImagePicker().pickImage(source: source);
    imagefile = pickedfile;
    update();
  }

}
