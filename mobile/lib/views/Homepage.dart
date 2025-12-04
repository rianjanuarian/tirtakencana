import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/CustomerController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CustomerController customerController = Get.put(CustomerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerController.fetchAllCustomers();
  }

  @override
  Widget build(BuildContext context) {
    var mHeigt = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("DROPDWON"),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromARGB(255, 192, 82, 82)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.card_giftcard_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "Total Hadiah",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Obx(() {
              if (customerController.cusLoading.value == true) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: customerController.customers.length,
                      itemBuilder: (context, index) {
                        var cust = customerController.customers[index];
                        return Container(
                          child: Text(cust.name ?? ""),
                        );
                      }),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
