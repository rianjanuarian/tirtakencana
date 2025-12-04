class MobileConfigModel {
  int? iD;
  String? branchCode;
  String? name;
  String? description;
  String? value;

  MobileConfigModel(
      {this.iD, this.branchCode, this.name, this.description, this.value});

  MobileConfigModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    branchCode = json['BranchCode'];
    name = json['Name'];
    description = json['Description'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['BranchCode'] = this.branchCode;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Value'] = this.value;
    return data;
  }
}
