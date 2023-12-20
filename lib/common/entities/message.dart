import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? docid;
  String? token;
  String? name;
  String? avatar;
  String? lastmsg;
  Timestamp? lasttime;
  int? msgnum;
  int? online;

  Message({
    this.docid,
    this.token,
    this.name,
    this.avatar,
    this.lastmsg,
    this.lasttime,
    this.msgnum,
    this.online,
  });
}

class CallMessage {
  String? docid;
  String? token;
  String? name;
  String? avatar;
  String? calltime;
  String? type;
  Timestamp? lasttime;

  CallMessage({
    this.docid,
    this.token,
    this.name,
    this.avatar,
    this.calltime,
    this.type,
    this.lasttime,
  });
}
