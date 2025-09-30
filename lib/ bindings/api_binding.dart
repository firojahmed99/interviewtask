import 'package:get/get.dart';
import '../controllers/api_controller.dart';
import '../services/api_service.dart';

class ApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<ApiController>(() => ApiController(apiService: Get.find()));
  }
}
