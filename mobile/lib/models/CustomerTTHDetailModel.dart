class CustomerTTHDetailModel {
  int? iD;
  String? tTHNo;
  String? tTOTTPNo;
  String? jenis;
  int? qty;
  String? unit;

  CustomerTTHDetailModel(
      {this.iD, this.tTHNo, this.tTOTTPNo, this.jenis, this.qty, this.unit});

  CustomerTTHDetailModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tTHNo = json['TTHNo'];
    tTOTTPNo = json['TTOTTPNo'];
    jenis = json['Jenis'];
    qty = json['Qty'];
    unit = json['Unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TTHNo'] = this.tTHNo;
    data['TTOTTPNo'] = this.tTOTTPNo;
    data['Jenis'] = this.jenis;
    data['Qty'] = this.qty;
    data['Unit'] = this.unit;
    return data;
  }
}
