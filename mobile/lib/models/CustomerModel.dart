class CustomerModel {
  String? custID;
  String? name;
  String? address;
  String? branchCode;
  String? phoneNo;
  List<Tth>? tth;

  CustomerModel(
      {this.custID,
      this.name,
      this.address,
      this.branchCode,
      this.phoneNo,
      this.tth});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    custID = json['CustID'];
    name = json['Name'];
    address = json['Address'];
    branchCode = json['BranchCode'];
    phoneNo = json['PhoneNo'];
    if (json['tth'] != null) {
      tth = <Tth>[];
      json['tth'].forEach((v) {
        tth!.add(new Tth.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustID'] = this.custID;
    data['Name'] = this.name;
    data['Address'] = this.address;
    data['BranchCode'] = this.branchCode;
    data['PhoneNo'] = this.phoneNo;
    if (this.tth != null) {
      data['tth'] = this.tth!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tth {
  int? iD;
  String? tTHNo;
  String? salesID;
  String? tTOTTPNo;
  String? custID;
  String? docDate;
  int? received;
  String? receivedDate;
  String? failedReason;

  Tth(
      {this.iD,
      this.tTHNo,
      this.salesID,
      this.tTOTTPNo,
      this.custID,
      this.docDate,
      this.received,
      this.receivedDate,
      this.failedReason});

  Tth.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tTHNo = json['TTHNo'];
    salesID = json['SalesID'];
    tTOTTPNo = json['TTOTTPNo'];
    custID = json['CustID'];
    docDate = json['DocDate'];
    received = json['Received'];
    receivedDate = json['ReceivedDate'];
    failedReason = json['FailedReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TTHNo'] = this.tTHNo;
    data['SalesID'] = this.salesID;
    data['TTOTTPNo'] = this.tTOTTPNo;
    data['CustID'] = this.custID;
    data['DocDate'] = this.docDate;
    data['Received'] = this.received;
    data['ReceivedDate'] = this.receivedDate;
    data['FailedReason'] = this.failedReason;
    return data;
  }
}
