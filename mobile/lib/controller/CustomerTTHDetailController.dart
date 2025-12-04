import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile/models/CustomerTTHDetailModel.dart';
import 'package:mobile/services/apiUrl.dart';

class CustomerTTHDetailController extends GetxController {
  final customerTthDetails = RxList<CustomerTTHDetailModel>([]);
  final cusdetailLoading = false.obs;

  Future<void> fetchAllTthDetails() async {
    try {
      cusdetailLoading.value = true;
      final response = await Dio().get('$apiUrl/customertthdetail');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<CustomerTTHDetailModel> fetched =
            data.map((e) => CustomerTTHDetailModel.fromJson(e)).toList();
        customerTthDetails.assignAll(fetched);
      }
    } catch (e) {
      throw Exception('failed to load tthdetail: $e');
    } finally {
      cusdetailLoading.value = false;
    }
  }

  int getTotalQtyByJenis(String jenis) {
    return customerTthDetails
        .where((item) => item.jenis == jenis)
        .fold(0, (sum, item) => sum + (item.qty ?? 0));
  }
}
