import 'package:cloud_firestore/cloud_firestore.dart';

class ChatCall {
  final String? docid;
  final String? fromtoken;
  final String? totoken;
  final String? fromname;
  final String? toname;
  final String? fromavatar;
  final String? toavatar;
  final String? calltime;
  final String? type;
  final Timestamp? lasttime;

  ChatCall({
    this.docid,
    this.fromtoken,
    this.totoken,
    this.fromname,
    this.toname,
    this.fromavatar,
    this.toavatar,
    this.calltime,
    this.type,
    this.lasttime,
  });

  factory ChatCall.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ChatCall(
      fromtoken: data?['fromtoken'],
      totoken: data?['totoken'],
      fromname: data?['fromname'],
      toname: data?['toname'],
      fromavatar: data?['fromavatar'],
      toavatar: data?['toavatar'],
      lasttime: data?['lasttime'],
      type: data?['type'],
      calltime: data?['calltime'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (fromtoken != null) "fromtoken": fromtoken,
      if (totoken != null) "totoken": totoken,
      if (fromname != null) "fromname": fromname,
      if (toname != null) "toname": toname,
      if (fromavatar != null) "fromavatar": fromavatar,
      if (toavatar != null) "toavatar": toavatar,
      if (calltime != null) "calltime": calltime,
      if (type != null) "type": type,
      if (lasttime != null) "lasttime": lasttime,
    };
  }
}
