import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile/models/MobileConfigModel.dart';
import 'package:mobile/services/apiUrl.dart';

class MobileConfigController extends GetxController {
  final mobileConfigs = RxList<MobileConfigModel>([]);
  final mobileLoading = false.obs;

  Future<void> fetchAllMobileConfig() async {
    try {
      mobileLoading.value = true;
      final response = await Dio().get('$apiUrl/mobileconfig');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<MobileConfigModel> fetched =
            data.map((e) => MobileConfigModel.fromJson(e)).toList();
        mobileConfigs.assignAll(fetched);
      }
    } catch (e) {
      throw Exception('failed to load mobile config: $e');
    } finally {
      mobileLoading.value = false;
    }
  }
}
