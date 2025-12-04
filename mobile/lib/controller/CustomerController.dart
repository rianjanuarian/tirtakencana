import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mobile/models/CustomerModel.dart';
import 'package:mobile/services/apiUrl.dart';

class CustomerController extends GetxController {
  final customers = RxList<CustomerModel>([]);
  final cusLoading = false.obs;

  Future<void> fetchAllCustomers() async {
    try {
      cusLoading.value = true;

      final response = await Dio().get('$apiUrl/customers');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<CustomerModel> fetchedCustomers =
            data.map((e) => CustomerModel.fromJson(e)).toList();
        customers.assignAll(fetchedCustomers);
      }
    } catch (e) {
      throw Exception('Failed to load customers: $e');
    } finally {
      cusLoading.value = false;
    }
  }
}
