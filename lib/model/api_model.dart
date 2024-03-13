// To parse this JSON data, do
//
//     final modelApi = modelApiFromJson(jsonString);

import 'dart:convert';

ModelApi modelApiFromJson(String str) => ModelApi.fromJson(json.decode(str));

String modelApiToJson(ModelApi data) => json.encode(data.toJson());

class ModelApi {
    int? customerId;
    String? latitude;
    String? longitude;
    List<Merchant>? merchants;
    List<String>? shopCategories;

    ModelApi({
        this.customerId,
        this.latitude,
        this.longitude,
        this.merchants,
        this.shopCategories,
    });

    factory ModelApi.fromJson(Map<String, dynamic> json) => ModelApi(
        customerId: json["customer_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        merchants: json["merchants"] == null ? [] : List<Merchant>.from(json["merchants"]!.map((x) => Merchant.fromJson(x))),
        shopCategories: json["shop_categories"] == null ? [] : List<String>.from(json["shop_categories"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "latitude": latitude,
        "longitude": longitude,
        "merchants": merchants == null ? [] : List<dynamic>.from(merchants!.map((x) => x.toJson())),
        "shop_categories": shopCategories == null ? [] : List<dynamic>.from(shopCategories!.map((x) => x)),
    };
}

class Merchant {
    String? name;
    double? distance;
    List<String>? categories;

    Merchant({
        this.name,
        this.distance,
        this.categories,
    });

    factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        name: json["name"],
        distance: json["distance"]?.toDouble(),
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "distance": distance,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    };
}