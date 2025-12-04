class CustomerModel {
  String? custID;
  String? name;
  String? address;
  String? branchCode;
  String? phoneNo;

  CustomerModel(
      {this.custID, this.name, this.address, this.branchCode, this.phoneNo});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    custID = json['CustID'];
    name = json['Name'];
    address = json['Address'];
    branchCode = json['BranchCode'];
    phoneNo = json['PhoneNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustID'] = this.custID;
    data['Name'] = this.name;
    data['Address'] = this.address;
    data['BranchCode'] = this.branchCode;
    data['PhoneNo'] = this.phoneNo;
    return data;
  }
}
