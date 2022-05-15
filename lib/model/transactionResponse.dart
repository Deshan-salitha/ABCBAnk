// To parse this JSON data, do
//
//     final transactionResponse = transactionResponseFromJson(jsonString);

import 'dart:convert';

List<TransactionResponse> transactionResponseFromJson(String str) => List<TransactionResponse>.from(json.decode(str).map((x) => TransactionResponse.fromJson(x)));

String transactionResponseToJson(List<TransactionResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OwnerAcc {
    OwnerAcc({
        this.accNumber,
        this.owner,
        this.transactins,
        this.uId,
        this.balance,
        this.cOd,
    });

    int? accNumber;
    Owner? owner;
    List<TransactionResponse>? transactins;
    int? uId;
    int? balance;
    String? cOd;

    factory OwnerAcc.fromJson(Map<String, dynamic> json) => OwnerAcc(
        accNumber: json["accNumber"] == null ? null : json["accNumber"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        transactins: json["transactins"] == null ? null : List<TransactionResponse>.from(json["transactins"].map((x) => TransactionResponse.fromJson(x))),
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

class TransactionResponse {
    TransactionResponse({
        this.tId,
        this.accNumber,
        this.amount,
        this.dateTime,
        this.type,
        this.destinationAccId,
        this.ownerAcc,
    });

    int? tId;
    int? accNumber;
    int? amount;
    DateTime? dateTime;
    Type? type;
    int? destinationAccId;
    OwnerAcc? ownerAcc;

    factory TransactionResponse.fromJson(Map<String, dynamic> json) => TransactionResponse(
        tId: json["tID"] == null ? null : json["tID"],
        accNumber: json["accNumber"] == null ? null : json["accNumber"],
        amount: json["amount"] == null ? null : json["amount"],
        dateTime: json["date_Time"] == null ? null : DateTime.parse(json["date_Time"]),
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        destinationAccId: json["destinationAccID"] == null ? null : json["destinationAccID"],
        ownerAcc: json["ownerAcc"] == null ? null : OwnerAcc.fromJson(json["ownerAcc"]),
    );

    Map<String, dynamic> toJson() => {
        "tID": tId == null ? null : tId,
        "accNumber": accNumber == null ? null : accNumber,
        "amount": amount == null ? null : amount,
        "date_Time": dateTime == null ? null : dateTime!.toIso8601String(),
        "type": type == null ? null : typeValues.reverse![type],
        "destinationAccID": destinationAccId == null ? null : destinationAccId,
        "ownerAcc": ownerAcc == null ? null : ownerAcc!.toJson(),
    };
}

class Owner {
    Owner({
        this.address,
        this.ufname,
        this.ulname,
        this.email,
        this.password,
        this.uid,
        this.userType,
    });

    String? address;
    String? ufname;
    String? ulname;
    String? email;
    String? password;
    int? uid;
    String? userType;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        address: json["address"] == null ? null : json["address"],
        ufname: json["ufname"] == null ? null : json["ufname"],
        ulname: json["ulname"] == null ? null : json["ulname"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        uid: json["uid"] == null ? null : json["uid"],
        userType: json["userType"] == null ? null : json["userType"],
    );

    Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
        "ufname": ufname == null ? null : ufname,
        "ulname": ulname == null ? null : ulname,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "uid": uid == null ? null : uid,
        "userType": userType == null ? null : userType,
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
