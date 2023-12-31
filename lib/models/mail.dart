// To parse this JSON data, do
//
//     final mail = mailFromJson(jsonString);

import 'dart:convert';

Mail mailFromJson(String str) => Mail.fromJson(json.decode(str));

String mailToJson(Mail data) => json.encode(data.toJson());

class Mail {
  String? message;
  MailClass? mail;

  Mail({
    this.message,
    this.mail,
  });

  factory Mail.fromJson(Map<String, dynamic> json) => Mail(
        message: json["message"],
        mail: json["mail"] == null ? null : MailClass.fromJson(json["mail"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "mail": mail?.toJson(),
      };
}

class MailClass {
  int? id;
  String? subject;
  dynamic description;
  String? senderId;
  String? archiveNumber;
  String? archiveDate;
  dynamic decision;
  String? statusId;
  dynamic finalDecision;
  String? createdAt;
  String? updatedAt;
  Sender? sender;
  Status? status;
  List<dynamic>? attachments;
  List<Activity>? activities;
  List<dynamic>? tags;

  MailClass({
    this.id,
    this.subject,
    this.description,
    this.senderId,
    this.archiveNumber,
    this.archiveDate,
    this.decision,
    this.statusId,
    this.finalDecision,
    this.createdAt,
    this.updatedAt,
    this.sender,
    this.status,
    this.attachments,
    this.activities,
    this.tags,
  });

  factory MailClass.fromJson(Map<String, dynamic> json) => MailClass(
        id: json["id"],
        subject: json["subject"],
        description: json["description"],
        senderId: json["sender_id"],
        archiveNumber: json["archive_number"],
        archiveDate: json["archive_date"],
        decision: json["decision"],
        statusId: json["status_id"],
        finalDecision: json["final_decision"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        attachments: json["attachments"] == null
            ? []
            : List<dynamic>.from(json["attachments"]!.map((x) => x)),
        activities: json["activities"] == null
            ? []
            : List<Activity>.from(
                json["activities"]!.map((x) => Activity.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "description": description,
        "sender_id": senderId,
        "archive_number": archiveNumber,
        "archive_date": archiveDate,
        "decision": decision,
        "status_id": statusId,
        "final_decision": finalDecision,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "sender": sender?.toJson(),
        "status": status?.toJson(),
        "attachments": attachments == null
            ? []
            : List<dynamic>.from(attachments!.map((x) => x)),
        "activities": activities == null
            ? []
            : List<dynamic>.from(activities!.map((x) => x.toJson())),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
      };
}

class Activity {
  int? id;
  String? body;
  String? userId;
  String? mailId;
  dynamic sendNumber;
  dynamic sendDate;
  dynamic sendDestination;
  String? createdAt;
  String? updatedAt;
  User? user;

  Activity({
    this.id,
    this.body,
    this.userId,
    this.mailId,
    this.sendNumber,
    this.sendDate,
    this.sendDestination,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        body: json["body"],
        userId: json["user_id"],
        mailId: json["mail_id"],
        sendNumber: json["send_number"],
        sendDate: json["send_date"],
        sendDestination: json["send_destination"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "body": body,
        "user_id": userId,
        "mail_id": mailId,
        "send_number": sendNumber,
        "send_date": sendDate,
        "send_destination": sendDestination,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? name;
  String? email;
  String? image;
  dynamic emailVerifiedAt;
  String? roleId;
  String? createdAt;
  String? updatedAt;
  Status? role;

  User({
    this.id,
    this.name,
    this.email,
    this.image,
    this.emailVerifiedAt,
    this.roleId,
    this.createdAt,
    this.updatedAt,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        emailVerifiedAt: json["email_verified_at"],
        roleId: json["role_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        role: json["role"] == null ? null : Status.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "email_verified_at": emailVerifiedAt,
        "role_id": roleId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "role": role?.toJson(),
      };
}

class Status {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? color;

  Status({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.color,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "color": color,
      };
}

class Sender {
  int? id;
  String? name;
  String? mobile;
  dynamic address;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  Status? category;

  Sender({
    this.id,
    this.name,
    this.mobile,
    this.address,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        address: json["address"],
        categoryId: json["category_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        category:
            json["category"] == null ? null : Status.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "address": address,
        "category_id": categoryId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "category": category?.toJson(),
      };
}
