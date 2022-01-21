
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class UserData with ChangeNotifier{
  UserData({
    this.id,
    this.groupId,
    this.createdAt,
    this.updatedAt,
    this.createdIn,
    this.email,
    this.firstname,
    this.lastname,
    this.storeId,
    this.websiteId,
    this.addresses,
    this.disableAutoGroupChange,
    this.extensionAttributes,
  });

  final int id;
  final int groupId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdIn;
  final String email;
  final String firstname;
  final String lastname;
  final int storeId;
  final int websiteId;
  final List<dynamic> addresses;
  final int disableAutoGroupChange;
  final ExtensionAttributes extensionAttributes;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
    id: json["id"],
    groupId: json["group_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdIn: json["created_in"],
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    storeId: json["store_id"],
    websiteId: json["website_id"],
    addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
    disableAutoGroupChange: json["disable_auto_group_change"],
    extensionAttributes: ExtensionAttributes.fromMap(json["extension_attributes"]),
  );


}

class ExtensionAttributes {
  ExtensionAttributes({
    this.isSubscribed,
  });

  final bool isSubscribed;

  factory ExtensionAttributes.fromMap(Map<String, dynamic> json) => ExtensionAttributes(
    isSubscribed: json["is_subscribed"],
  );

}
