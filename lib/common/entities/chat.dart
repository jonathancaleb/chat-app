// import 'package:intl/intl.dart';

class SyncMessageRequestEntity {
  int? msgid;
  SyncMessageRequestEntity({
    this.msgid,
  });

  Map<String, dynamic> toJson() => {
        "msgid": msgid,
      };
}

class CallRequestEntity {
  String? calltype; //1. voice 2. video
  String? totoken;
  String? toname;
  String? toavatar;
  String? docid;

  CallRequestEntity({
    this.calltype,
    this.totoken,
    this.toname,
    this.toavatar,
    this.docid,
  });

  Map<String, dynamic> toJson() => {
        "calltype": calltype,
        "totoken": totoken,
        "toname": toname,
        "toavatar": toavatar,
        "docid": docid,
      };
}

class CallTokenRequestEntity {
  String? channelname;

  CallTokenRequestEntity({
    this.channelname,
  });

  Map<String, dynamic> toJson() => {
        "channelname": channelname,
      };
}

class ChatRequestEntity {
  String? content;
  String? type;
  String? totoken;

  ChatRequestEntity({
    this.content,
    this.type,
    this.totoken,
  });

  Map<String, dynamic> toJson() => {
        "content": content,
        "type": type,
        "totoken": totoken,
      };
}

class Chat {
  String? fromtoken;
  String? totoken;
  int? msgid;
  String? content;
  String? type;
  int? status;
  String? createdat;

  Chat({
    this.fromtoken,
    this.totoken,
    this.msgid,
    this.content,
    this.type,
    this.status,
    this.createdat,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        fromtoken: json["fromtoken"],
        totoken: json["totoken"],
        msgid: json["msgid"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
        createdat: json["createdat"],
      );

  Map<String, dynamic> toJson() => {
        "fromtoken": fromtoken,
        "totoken": totoken,
        "msgid": msgid,
        "content": content,
        "type": type,
        "status": status,
        "createdat": createdat,
      };
}

class MsgListcontent {
  int? msgid;
  String? fromtoken;
  String? fromname;
  String? fromavatar;
  String? totoken;
  String? content;
  String? type;
  int? status;
  String? createdat;

  MsgListcontent({
    this.msgid,
    this.fromtoken,
    this.fromname,
    this.fromavatar,
    this.totoken,
    this.content,
    this.type,
    this.status,
    this.createdat,
  });

  factory MsgListcontent.fromJson(Map<String, dynamic> json) => MsgListcontent(
        fromtoken: json["fromtoken"],
        fromavatar: json["fromavatar"],
        fromname: json["fromname"],
        totoken: json["totoken"],
        msgid: json["msgid"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
        createdat: json["createdat"],
      );

  Map<String, dynamic> toJson() => {
        "fromtoken": fromtoken,
        "fromname": fromname,
        "fromavatar": fromavatar,
        "totoken": totoken,
        "msgid": msgid,
        "content": content,
        "type": type,
        "status": status,
        "createdat": createdat,
      };
}

class SyncMessageResponseEntity {
  int? code;
  String? msg;
  List<MsgListcontent>? data;

  SyncMessageResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory SyncMessageResponseEntity.fromJson(Map<String, dynamic> json) =>
      SyncMessageResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<MsgListcontent>.from(
                json["data"].map((x) => MsgListcontent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "counts": code,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
