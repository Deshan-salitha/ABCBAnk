// To parse this JSON data, do
//
//     final allAccountsResponse = allAccountsResponseFromJson(jsonString);

import 'dart:convert';

List<AllAccountsResponse> allAccountsResponseFromJson(String str) => List<AllAccountsResponse>.from(json.decode(str).map((x) => AllAccountsResponse.fromJson(x)));

String allAccountsResponseToJson(List<AllAccountsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAccountsResponse {
    AllAccountsResponse({
        this.accNumber,
        this.owner,
        this.transactins,
        this.uId,
        this.balance,
        this.cOd,
    });

    int? accNumber;
    Owner? owner;
    List<Transactin>? transactins;
    int? uId;
    int? balance;
    String? cOd;

    factory AllAccountsResponse.fromJson(Map<String, dynamic> json) => AllAccountsResponse(
        accNumber: json["accNumber"] == null ? null : json["accNumber"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        transactins: json["transactins"] == null ? null : List<Transactin>.from(json["transactins"].map((x) => Transactin.fromJson(x))),
        uId: json["uID"] == null ? null : json["uID"],
        balance: json["balance"] == null ? null : json["balance"],
        cOd: json["cOD"] == null ? null : json["cOD"],
    );

    Map<String, dynamic> toJson() => {
        "accNumber": accNumber == null ? null : accNumber,
        "owner": owner == null ? null : owner!.toJson(),
        "transactins": transactins == null ? null : List<dynamic>.from(transactins!.map((x) => x.toJson())),
        "uID": uId == null ? null : uId,
        "balance": balance == null ? null : balance,
        "cOD": cOd == null ? null : cOd,
    };
}

class Owner {
    Owner({
        this.address,
        this.ulname,
        this.ufname,
        this.email,
        this.password,
        this.userType,
        this.uid,
    });

    String? address;
    String? ulname;
    String? ufname;
    String? email;
    String? password;
    String? userType;
    int? uid;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        address: json["address"] == null ? null : json["address"],
        ulname: json["ulname"] == null ? null : json["ulname"],
        ufname: json["ufname"] == null ? null : json["ufname"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        userType: json["userType"] == null ? null : json["userType"],
        uid: json["uid"] == null ? null : json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
        "ulname": ulname == null ? null : ulname,
        "ufname": ufname == null ? null : ufname,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "userType": userType == null ? null : userType,
        "uid": uid == null ? null : uid,
    };
}

class Transactin {
    Transactin({
        this.tId,
        this.accNumber,
        this.amount,
        this.dateTime,
        this.type,
        this.destinationAccId,
    });

    int? tId;
    int? accNumber;
    int? amount;
    DateTime? dateTime;
    Type? type;
    int? destinationAccId;

    factory Transactin.fromJson(Map<String, dynamic> json) => Transactin(
        tId: json["tID"] == null ? null : json["tID"],
        accNumber: json["accNumber"] == null ? null : json["accNumber"],
        amount: json["amount"] == null ? null : json["amount"],
        dateTime: json["date_Time"] == null ? null : DateTime.parse(json["date_Time"]),
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        destinationAccId: json["destinationAccID"] == null ? null : json["destinationAccID"],
    );

    Map<String, dynamic> toJson() => {
        "tID": tId == null ? null : tId,
        "accNumber": accNumber == null ? null : accNumber,
        "amount": amount == null ? null : amount,
        "date_Time": dateTime == null ? null : dateTime!.toIso8601String(),
        "type": type == null ? null : typeValues.reverse![type],
        "destinationAccID": destinationAccId == null ? null : destinationAccId,
    };
}

enum Type { D, W, T }

final typeValues = EnumValues({
    "d": Type.D,
    "t": Type.T,
    "w": Type.W
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
