import 'package:coffee_shop_app/models/product_model.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String email;
  final String name;
  final String uid;
  final List<Product> favorites;
  final List<Product> cart;
  UserModel({
    required this.email,
    required this.name,
    required this.uid,
    required this.favorites,
    required this.cart,
  });

  UserModel copyWith({
    String? name,
    String? uid,
    List<Product>? favorites,
    List<Product>? cart,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      favorites: favorites ?? this.favorites,
      cart: cart ?? this.cart,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'favorites': favorites,
      'cart':cart,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      favorites: List<Product>.from(map['favorites']),
      cart: List<Product>.from(map['cart']),
    );
  }

  @override
  String toString() {
    return 'UserModel(email:$email,name: $name, uid: $uid, favorites: $favorites,cart:$cart)';
  }
/*
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.uid == uid &&
        listEquals(other.awards, awards);
  }

  @override
  int get hashCode {
    return name.hashCode ^
    profilePic.hashCode ^
    banner.hashCode ^
    uid.hashCode ^
    isAuthenticated.hashCode ^
    karma.hashCode ^
    awards.hashCode;
  }*/
}