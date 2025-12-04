import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controller/CustomerController.dart';
import 'package:mobile/controller/CustomerTTHDetailController.dart';
import 'package:mobile/controller/MobileConfigController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CustomerController customerController = Get.put(CustomerController());
  final MobileConfigController mobileConfigController =
      Get.put(MobileConfigController());
  final CustomerTTHDetailController customerTTHDetailController =
      Get.put(CustomerTTHDetailController());
  String? selectedStore;

  @override
  void initState() {
    super.initState();
    customerController.fetchAllCustomers();
    mobileConfigController.fetchAllMobileConfig();
    customerTTHDetailController.fetchAllTthDetails();
  }

  List<String> getStoreNames() {
    List<String> storeNames = [];
    for (var customer in customerController.customers) {
      if (customer.name != null && customer.name!.isNotEmpty) {
        if (!storeNames.contains(customer.name)) {
          storeNames.add(customer.name!);
        }
      }
    }
    storeNames.sort();
    return storeNames;
  }

  List getFilteredCustomers() {
    if (selectedStore == null) {
      return customerController.customers;
    }
    return customerController.customers
        .where((customer) => customer.name == selectedStore)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    if (customerController.cusLoading.value == true) {
                      return Text("Loading...");
                    }

                    List<String> storeNames = getStoreNames();

                    return Container(
                      width: mWidth * 0.6,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text("Pilih Toko"),
                        value: selectedStore,
                        icon: Icon(Icons.arrow_drop_down, color: Colors.teal),
                        underline: SizedBox(),
                        items: [
                          DropdownMenuItem<String>(
                            value: null,
                            child: Row(
                              children: [
                                Icon(Icons.home, size: 18, color: Colors.grey),
                                SizedBox(width: 8),
                                Text("Semua Toko",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          ...storeNames.map((String storeName) {
                            return DropdownMenuItem<String>(
                              value: storeName,
                              child: Row(
                                children: [
                                  Icon(Icons.home,
                                      size: 18, color: Colors.grey),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(storeName),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedStore = newValue;
                          });
                        },
                      ),
                    );
                  }),
                  InkWell(
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
                          SizedBox(width: 4),
                          Text(
                            "Total Hadiah",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      showMobileConfig(
                        context,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.wallet_giftcard_outlined),
                                SizedBox(width: 3),
                                Text("Total Hadiah"),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: mWidth * 0.05,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(thickness: 1.25, color: Colors.amber[600]),
                            Obx(() {
                              final rawValue = mobileConfigController
                                      .mobileConfigs.first.value ??
                                  "";
                              final List<String> rewards = rawValue.split('|');

                              int totalDisplayedQty = 0;

                              final items = rewards.map((reward) {
                                final int totalQty = customerTTHDetailController
                                    .getTotalQtyByJenis(reward);

                                if (totalQty == 0) return SizedBox.shrink();

                                totalDisplayedQty += totalQty;

                                String lower = reward.toLowerCase();
                                String unitLabel = "";

                                if (lower.startsWith("emas")) {
                                  unitLabel = " Buah";
                                } else if (lower.startsWith("voucher")) {
                                  unitLabel = " Lembar";
                                }

                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(reward),
                                      Row(
                                        children: [
                                          Text(
                                            "$totalQty",
                                            style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(unitLabel),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...items,
                                  Divider(
                                      thickness: 1.25,
                                      color: Colors.amber[600]),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(),
                                      Row(
                                        children: [
                                          Text(
                                            "$totalDisplayedQty",
                                            style: TextStyle(
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(" Lembar"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Obx(() {
              if (customerController.cusLoading.value == true) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var filteredCustomers = getFilteredCustomers();

                if (filteredCustomers.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Tidak ada data customer",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                return Container(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filteredCustomers.length,
                      itemBuilder: (context, index) {
                        var cust = filteredCustomers[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          color: Colors.teal[700],
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cust.name ?? "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: mWidth * 0.04),
                                        ),
                                        Text("Belum Diberikan",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.place_outlined,
                                                color: Colors.white,
                                                size: mWidth * 0.03,
                                              ),
                                              SizedBox(width: 3),
                                              Text(cust.address ?? "",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: mWidth * 0.03)),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color: Colors.white,
                                              size: mWidth * 0.03,
                                            ),
                                            SizedBox(width: 3),
                                            Text(cust.phoneNo ?? "",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: mWidth * 0.03)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: mHeight * 0.125,
                                  ),
                                  Center(
                                    child: Container(
                                      width: mWidth,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30))),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20.0),
                                        child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, tthIndex) {
                                            var tth = cust.tth![tthIndex];
                                            return Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  width: mWidth * 0.85,
                                                  decoration: BoxDecoration(
                                                      color: Colors.teal[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.wallet_giftcard,
                                                        color: Colors.amber,
                                                        size: mWidth * 0.035,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        tth.tTHNo ?? "",
                                                        style: TextStyle(
                                                            fontSize:
                                                                mWidth * 0.035,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: cust.tth?.length ?? 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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

  void showMobileConfig(BuildContext context, Widget child) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          content: child,
        );
      },
    );
  }
}
