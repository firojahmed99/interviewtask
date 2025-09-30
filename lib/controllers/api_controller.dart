import 'package:get/get.dart';
import '../ models/user_model.dart';
import '../services/api_service.dart';


class ApiController extends GetxController {
  final ApiService apiService;
  ApiController({required this.apiService});

  var users = <UserModel>[].obs;
  var loading = false.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    loading.value = true;
    error.value = '';
    try {
      final list = await apiService.fetchUsers();
      users.assignAll(list);
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
    }
  }
}
