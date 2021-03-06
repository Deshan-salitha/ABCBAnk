// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
        this.body,
        this.status,
        this.message,
    });

    List<Body>? body;
    String? status;
    String? message;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        body: json["body"] == null ? null : List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "body": body == null ? null : List<dynamic>.from(body!.map((x) => x.toJson())),
        "status": status == null ? null : status,
        "message": message == null ? null : message,
    };
}

class Account {
    Account({
        this.accNumber,
        this.owner,
        this.transactins,
        this.uId,
        this.balance,
        this.cOd,
    });

    int? accNumber;
    Body? owner;
    List<Transactin>? transactins;
    int? uId;
    int? balance;
    String? cOd;

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        accNumber: json["accNumber"] == null ? null : json["accNumber"],
        owner: json["owner"] == null ? null : Body.fromJson(json["owner"]),
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

class Body {
    Body({
        this.uId,
        this.uFName,
        this.uLName,
        this.address,
        this.userEmail,
        this.password,
        this.userType,
        this.accounts,
    });

    int? uId;
    String? uFName;
    String? uLName;
    String? address;
    String? userEmail;
    String? password;
    UserType? userType;
    List<Account>? accounts;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        uId: json["uID"] == null ? null : json["uID"],
        uFName: json["uFName"] == null ? null : json["uFName"],
        uLName: json["uLName"] == null ? null : json["uLName"],
        address: json["address"] == null ? null : json["address"],
        userEmail: json["userEmail"] == null ? null : json["userEmail"],
        password: json["password"] == null ? null : json["password"],
        userType: json["userType"] == null ? null : userTypeValues.map[json["userType"]],
        accounts: json["accounts"] == null ? null : List<Account>.from(json["accounts"].map((x) => Account.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uID": uId == null ? null : uId,
        "uFName": uFName == null ? null : uFName,
        "uLName": uLName == null ? null : uLName,
        "address": address == null ? null : address,
        "userEmail": userEmail == null ? null : userEmail,
        "password": password == null ? null : password,
        "userType": userType == null ? null : userTypeValues.reverse![userType],
        "accounts": accounts == null ? null : List<dynamic>.from(accounts!.map((x) => x.toJson())),
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

enum UserType { ADMIN, EMPLOYEE, CUSTOMER }

final userTypeValues = EnumValues({
    "admin": UserType.ADMIN,
    "customer": UserType.CUSTOMER,
    "employee": UserType.EMPLOYEE
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
