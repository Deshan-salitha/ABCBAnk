// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
    AuthResponse({
        this.body,
        this.status,
        this.message,
    });

    Body? body;
    String? status;
    String? message;

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "body": body == null ? null : body!.toJson(),
        "status": status == null ? null : status,
        "message": message == null ? null : message,
    };
}

class Body {
    Body({
        this.jwt,
        this.user,
    });

    String? jwt;
    User? user;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        jwt: json["jwt"] == null ? null : json["jwt"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "jwt": jwt == null ? null : jwt,
        "user": user == null ? null : user!.toJson(),
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
    User? owner;
    List<Transactin>? transactins;
    int? uId;
    int? balance;
    String? cOd;

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        accNumber: json["accNumber"] == null ? null : json["accNumber"],
        owner: json["owner"] == null ? null : User.fromJson(json["owner"]),
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

class User {
    User({
        this.accounts,
        this.address,
        this.email,
        this.ulname,
        this.ufname,
        this.password,
        this.uid,
        this.userType,
    });

    List<Account>? accounts;
    String? address;
    String? email;
    String? ulname;
    String? ufname;
    String? password;
    int? uid;
    String? userType;

    factory User.fromJson(Map<String, dynamic> json) => User(
        accounts: json["accounts"] == null ? null : List<Account>.from(json["accounts"].map((x) => Account.fromJson(x))),
        address: json["address"] == null ? null : json["address"],
        email: json["email"] == null ? null : json["email"],
        ulname: json["ulname"] == null ? null : json["ulname"],
        ufname: json["ufname"] == null ? null : json["ufname"],
        password: json["password"] == null ? null : json["password"],
        uid: json["uid"] == null ? null : json["uid"],
        userType: json["userType"] == null ? null : json["userType"],
    );

    Map<String, dynamic> toJson() => {
        "accounts": accounts == null ? null : List<dynamic>.from(accounts!.map((x) => x.toJson())),
        "address": address == null ? null : address,
        "email": email == null ? null : email,
        "ulname": ulname == null ? null : ulname,
        "ufname": ufname == null ? null : ufname,
        "password": password == null ? null : password,
        "uid": uid == null ? null : uid,
        "userType": userType == null ? null : userType,
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
    String? type;
    int? destinationAccId;

    factory Transactin.fromJson(Map<String, dynamic> json) => Transactin(
        tId: json["tID"] == null ? null : json["tID"],
        accNumber: json["accNumber"] == null ? null : json["accNumber"],
        amount: json["amount"] == null ? null : json["amount"],
        dateTime: json["date_Time"] == null ? null : DateTime.parse(json["date_Time"]),
        type: json["type"] == null ? null : json["type"],
        destinationAccId: json["destinationAccID"] == null ? null : json["destinationAccID"],
    );

    Map<String, dynamic> toJson() => {
        "tID": tId == null ? null : tId,
        "accNumber": accNumber == null ? null : accNumber,
        "amount": amount == null ? null : amount,
        "date_Time": dateTime == null ? null : dateTime!.toIso8601String(),
        "type": type == null ? null : type,
        "destinationAccID": destinationAccId == null ? null : destinationAccId,
    };
}
