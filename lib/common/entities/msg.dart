import 'package:cloud_firestore/cloud_firestore.dart';

class Msg {
  final String? fromtoken;
  final String? totoken;
  final String? fromname;
  final String? toname;
  final String? fromavatar;
  final String? toavatar;
  final int? fromonline;
  final int? toonline;
  final int? frommsgnum;
  final int? tomsgnum;
  final String? lastmsg;
  final Timestamp? lasttime;
  final int? msgnum;

  Msg({
    this.fromtoken,
    this.totoken,
    this.fromname,
    this.toname,
    this.fromavatar,
    this.toavatar,
    this.fromonline,
    this.toonline,
    this.frommsgnum,
    this.tomsgnum,
    this.lastmsg,
    this.lasttime,
    this.msgnum,
  });

  factory Msg.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Msg(
      fromtoken: data?['fromtoken'],
      totoken: data?['totoken'],
      fromname: data?['fromname'],
      toname: data?['toname'],
      fromavatar: data?['fromavatar'],
      toavatar: data?['toavatar'],
      fromonline: data?['fromonline'],
      toonline: data?['toonline'],
      frommsgnum: data?['frommsgnum'],
      tomsgnum: data?['tomsgnum'],
      lastmsg: data?['lastmsg'],
      lasttime: data?['lasttime'],
      msgnum: data?['msgnum'],
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
      if (fromonline != null) "fromonline": fromonline,
      if (toonline != null) "toonline": toonline,
      if (frommsgnum != null) "frommsgnum": frommsgnum,
      if (tomsgnum != null) "tomsgnum": tomsgnum,
      if (lastmsg != null) "lastmsg": lastmsg,
      if (lasttime != null) "lasttime": lasttime,
      if (msgnum != null) "msgnum": msgnum,
    };
  }
}
