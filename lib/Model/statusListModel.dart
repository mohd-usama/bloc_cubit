class StatusListModel {
  StatusListModel({
      this.packetStatusCode, 
      this.packetStatus,});

  StatusListModel.fromJson(dynamic json) {
    packetStatusCode = json['PacketStatusCode'];
    packetStatus = json['PacketStatus'];
  }
  String? packetStatusCode;
  String? packetStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PacketStatusCode'] = packetStatusCode;
    map['PacketStatus'] = packetStatus;
    return map;
  }

}