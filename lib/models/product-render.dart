// To parse this JSON data, do
//
//     final productRender = productRenderFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';



class ProductRender with ChangeNotifier {
  ProductRender({
    this.items,
  });

  final List<Item> items;

  factory ProductRender.fromMap(Map<String, dynamic> json) => ProductRender(
    items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
  );

}

class Item {
  Item({
    this.addToCartButton,
    this.addToCompareButton,
    this.priceInfo,
    this.images,
    this.url,
    this.id,
    this.name,
    this.type,
    this.isSalable,
    this.storeId,
    this.currencyCode,
    this.extensionAttributes,
  });

  final ButtonProduct addToCartButton;
  final ButtonProduct addToCompareButton;
  final PriceInfo priceInfo;
  final List<ImageProduct> images;
  final String url;
  final int id;
  final String name;
  final String type;
  final String isSalable;
  final int storeId;
  final String currencyCode;
  final ItemExtensionAttributes extensionAttributes;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    addToCartButton: ButtonProduct.fromMap(json["add_to_cart_button"]),
    addToCompareButton: ButtonProduct.fromMap(json["add_to_compare_button"]),
    priceInfo: PriceInfo.fromMap(json["price_info"]),
    images: List<ImageProduct>.from(json["images"].map((x) => ImageProduct.fromMap(x))),
    url: json["url"],
    id: json["id"],
    name: json["name"],
    type: json["type"],
    isSalable: json["is_salable"],
    storeId: json["store_id"],
    currencyCode: json["currency_code"],
    extensionAttributes: ItemExtensionAttributes.fromMap(json["extension_attributes"]),
  );
}

class ButtonProduct {
  ButtonProduct({
    this.postData,
    this.url,
    this.requiredOptions,
  });

  final String postData;
  final String url;
  final bool requiredOptions;

  factory ButtonProduct.fromMap(Map<String, dynamic> json) => ButtonProduct(
    postData: json["post_data"] == null ? null : json["post_data"],
    url: json["url"],
    requiredOptions: json["required_options"] == null ? null : json["required_options"],
  );

}

class ItemExtensionAttributes {
  ItemExtensionAttributes({
    this.reviewHtml,
    this.wishlistButton,
  });

  final String reviewHtml;
  final ButtonProduct wishlistButton;

  factory ItemExtensionAttributes.fromMap(Map<String, dynamic> json) => ItemExtensionAttributes(
    reviewHtml: json["review_html"],
    wishlistButton: ButtonProduct.fromMap(json["wishlist_button"]),
  );

}

class ImageProduct {
  ImageProduct({
    this.url,
    this.code,
    this.height,
    this.width,
    this.label,
    this.resizedWidth,
    this.resizedHeight,
  });

  final String url;
  final String code;
  final int height;
  final int width;
  final String label;
  final int resizedWidth;
  final int resizedHeight;

  factory ImageProduct.fromMap(Map<String, dynamic> json) => ImageProduct(
    url: json["url"],
    code: json["code"],
    height: json["height"],
    width: json["width"],
    label: json["label"],
    resizedWidth: json["resized_width"],
    resizedHeight: json["resized_height"],
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "code": code,
    "height": height,
    "width": width,
    "label": label,
    "resized_width": resizedWidth,
    "resized_height": resizedHeight,
  };
}

class PriceInfo {
  PriceInfo({
    this.finalPrice,
    this.maxPrice,
    this.maxRegularPrice,
    this.minimalRegularPrice,
    this.specialPrice,
    this.minimalPrice,
    this.regularPrice,
    this.formattedPrices,
    this.extensionAttributes,
  });

  final int finalPrice;
  final int maxPrice;
  final int maxRegularPrice;
  final int minimalRegularPrice;
  final dynamic specialPrice;
  final int minimalPrice;
  final int regularPrice;
  final FormattedPrices formattedPrices;
  final PriceInfoExtensionAttributes extensionAttributes;

  factory PriceInfo.fromMap(Map<String, dynamic> json) => PriceInfo(
    finalPrice: json["final_price"],
    maxPrice: json["max_price"],
    maxRegularPrice: json["max_regular_price"],
    minimalRegularPrice: json["minimal_regular_price"],
    specialPrice: json["special_price"],
    minimalPrice: json["minimal_price"],
    regularPrice: json["regular_price"],
    formattedPrices: FormattedPrices.fromMap(json["formatted_prices"]),
    extensionAttributes: PriceInfoExtensionAttributes.fromMap(json["extension_attributes"]),
  );

}

class PriceInfoExtensionAttributes {
  PriceInfoExtensionAttributes({
    this.msrp,
    this.taxAdjustments,
    this.weeeAttributes,
    this.weeeAdjustment,
  });

  final Msrp msrp;
  final TaxAdjustments taxAdjustments;
  final List<dynamic> weeeAttributes;
  final String weeeAdjustment;

  factory PriceInfoExtensionAttributes.fromMap(Map<String, dynamic> json) => PriceInfoExtensionAttributes(
    msrp: Msrp.fromMap(json["msrp"]),
    taxAdjustments: TaxAdjustments.fromMap(json["tax_adjustments"]),
    weeeAttributes: List<dynamic>.from(json["weee_attributes"].map((x) => x)),
    weeeAdjustment: json["weee_adjustment"],
  );
}

class Msrp {
  Msrp({
    this.msrpPrice,
    this.isApplicable,
    this.isShownPriceOnGesture,
    this.msrpMessage,
    this.explanationMessage,
  });

  final String msrpPrice;
  final String isApplicable;
  final String isShownPriceOnGesture;
  final String msrpMessage;
  final String explanationMessage;

  factory Msrp.fromMap(Map<String, dynamic> json) => Msrp(
    msrpPrice: json["msrp_price"],
    isApplicable: json["is_applicable"],
    isShownPriceOnGesture: json["is_shown_price_on_gesture"],
    msrpMessage: json["msrp_message"],
    explanationMessage: json["explanation_message"],
  );

}

class TaxAdjustments {
  TaxAdjustments({
    this.finalPrice,
    this.maxPrice,
    this.maxRegularPrice,
    this.minimalRegularPrice,
    this.specialPrice,
    this.minimalPrice,
    this.regularPrice,
    this.formattedPrices,
  });

  final int finalPrice;
  final int maxPrice;
  final int maxRegularPrice;
  final int minimalRegularPrice;
  final int specialPrice;
  final int minimalPrice;
  final int regularPrice;
  final FormattedPrices formattedPrices;

  factory TaxAdjustments.fromMap(Map<String, dynamic> json) => TaxAdjustments(
    finalPrice: json["final_price"],
    maxPrice: json["max_price"],
    maxRegularPrice: json["max_regular_price"],
    minimalRegularPrice: json["minimal_regular_price"],
    specialPrice: json["special_price"],
    minimalPrice: json["minimal_price"],
    regularPrice: json["regular_price"],
    formattedPrices: FormattedPrices.fromMap(json["formatted_prices"]),
  );
}

class FormattedPrices {
  FormattedPrices({
    this.finalPrice,
    this.maxPrice,
    this.minimalPrice,
    this.maxRegularPrice,
    this.minimalRegularPrice,
    this.specialPrice,
    this.regularPrice,
  });

  final String finalPrice;
  final String maxPrice;
  final String minimalPrice;
  final String maxRegularPrice;
  final dynamic minimalRegularPrice;
  final String specialPrice;
  final String regularPrice;

  factory FormattedPrices.fromMap(Map<String, dynamic> json) => FormattedPrices(
    finalPrice: json["final_price"],
    maxPrice: json["max_price"],
    minimalPrice: json["minimal_price"],
    maxRegularPrice: json["max_regular_price"],
    minimalRegularPrice: json["minimal_regular_price"],
    specialPrice: json["special_price"] == null ? null : json["special_price"],
    regularPrice: json["regular_price"],
  );
}
