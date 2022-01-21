// To parse this JSON data, do
//
//     final productDetails = productDetailsFromMap(jsonString);


class ProductDetails {
  ProductDetails({
    this.items,
    this.searchCriteria,
    this.totalCount,
  });

  final List<ItemDetails> items;
  final SearchCriteria searchCriteria;
  final int totalCount;

  factory ProductDetails.fromMap(Map<String, dynamic> json) => ProductDetails(
    items: List<ItemDetails>.from(json["items"].map((x) => ItemDetails.fromMap(x))),
    searchCriteria: SearchCriteria.fromMap(json["search_criteria"]),
    totalCount: json["total_count"],
  );

}

class ItemDetails {
  ItemDetails({
    this.id,
    this.sku,
    this.name,
    this.attributeSetId,
    this.price,
    this.status,
    this.visibility,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    // this.weight,
    this.extensionAttributes,
    this.productLinks,
    this.options,
    this.mediaGalleryEntries,
    this.tierPrices,
    this.customAttributes,
  });

  final int id;
  final String sku;
  final String name;
  final int attributeSetId;
  final int price;
  final int status;
  final int visibility;
  final String typeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  // final double weight;
  final ExtensionAttributes extensionAttributes;
  final List<dynamic> productLinks;
  final List<dynamic> options;
  final List<MediaGalleryEntry> mediaGalleryEntries;
  final List<dynamic> tierPrices;
  final List<CustomAttribute> customAttributes;

  factory ItemDetails.fromMap(Map<String, dynamic> json) => ItemDetails(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
    attributeSetId: json["attribute_set_id"],
    price: json["price"],
    status: json["status"],
    visibility: json["visibility"],
    typeId: json["type_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    // weight: json["weight"].toDouble(),
    extensionAttributes: ExtensionAttributes.fromMap(json["extension_attributes"]),
    productLinks: List<dynamic>.from(json["product_links"].map((x) => x)),
    options: List<dynamic>.from(json["options"].map((x) => x)),
    mediaGalleryEntries: List<MediaGalleryEntry>.from(json["media_gallery_entries"].map((x) => MediaGalleryEntry.fromMap(x))),
    tierPrices: List<dynamic>.from(json["tier_prices"].map((x) => x)),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromMap(x))),
  );
}

class CustomAttribute {
  CustomAttribute({
    this.attributeCode,
    this.value,
  });

  final String attributeCode;
  final dynamic value;

  factory CustomAttribute.fromMap(Map<String, dynamic> json) => CustomAttribute(
    attributeCode: json["attribute_code"],
    value: json["value"],
  );

}

class ExtensionAttributes {
  ExtensionAttributes({
    this.websiteIds,
    this.categoryLinks,
  });

  final List<int> websiteIds;
  final List<CategoryLink> categoryLinks;

  factory ExtensionAttributes.fromMap(Map<String, dynamic> json) => ExtensionAttributes(
    websiteIds: List<int>.from(json["website_ids"].map((x) => x)),
    categoryLinks: List<CategoryLink>.from(json["category_links"].map((x) => CategoryLink.fromMap(x))),
  );

}

class CategoryLink {
  CategoryLink({
    this.position,
    this.categoryId,
  });

  final int position;
  final String categoryId;

  factory CategoryLink.fromMap(Map<String, dynamic> json) => CategoryLink(
    position: json["position"],
    categoryId: json["category_id"],
  );

}

class MediaGalleryEntry {
  MediaGalleryEntry({
    this.id,
    this.mediaType,
    this.label,
    this.position,
    this.disabled,
    this.types,
    this.file,
  });

  final int id;
  final String mediaType;
  final dynamic label;
  final int position;
  final bool disabled;
  final List<String> types;
  final String file;

  factory MediaGalleryEntry.fromMap(Map<String, dynamic> json) => MediaGalleryEntry(
    id: json["id"],
    mediaType: json["media_type"],
    label: json["label"],
    position: json["position"],
    disabled: json["disabled"],
    types: List<String>.from(json["types"].map((x) => x)),
    file: json["file"],
  );
}

class SearchCriteria {
  SearchCriteria({
    this.filterGroups,
    this.pageSize,
  });

  final List<FilterGroup> filterGroups;
  final int pageSize;

  factory SearchCriteria.fromMap(Map<String, dynamic> json) => SearchCriteria(
    filterGroups: List<FilterGroup>.from(json["filter_groups"].map((x) => FilterGroup.fromMap(x))),
    pageSize: json["page_size"],
  );

}

class FilterGroup {
  FilterGroup({
    this.filters,
  });

  final List<Filter> filters;

  factory FilterGroup.fromMap(Map<String, dynamic> json) => FilterGroup(
    filters: List<Filter>.from(json["filters"].map((x) => Filter.fromMap(x))),
  );

}

class Filter {

  Filter({
    this.field,
    this.value,
    this.conditionType,
  });

  final String field;
  final String value;
  final String conditionType;

  factory Filter.fromMap(Map<String, dynamic> json) => Filter(
    field: json["field"],
    value: json["value"],
    conditionType: json["condition_type"],
  );
}
