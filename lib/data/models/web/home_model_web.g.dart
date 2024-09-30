// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model_web.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModelWeb _$HomeModelWebFromJson(Map<String, dynamic> json) => HomeModelWeb(
      (json['DiscountProducts'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeModelWebToJson(HomeModelWeb instance) =>
    <String, dynamic>{
      'DiscountProducts': instance.discountProducts,
      'Categories': instance.categories,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      (json['id'] as num).toInt(),
      json['productname'] as String,
      (json['consumerdiscount'] as num?)?.toDouble() ?? 0,
      (json['productmrp'] as num).toDouble(),
      json['categoryname'] as String,
      (json['categoryid'] as num).toInt(),
      json['category'] == null
          ? null
          : CategoryColorModel.fromJson(
              json['category'] as Map<String, dynamic>),
      json['image'] as String? ?? '',
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productname': instance.productName,
      'consumerdiscount': instance.discount,
      'productmrp': instance.price,
      'categoryname': instance.categoryName,
      'categoryid': instance.categoryId,
      'image': instance.productImage,
      'category': instance.category,
    };

CategoryColorModel _$CategoryColorModelFromJson(Map<String, dynamic> json) =>
    CategoryColorModel(
      json['color'] as String,
    );

Map<String, dynamic> _$CategoryColorModelToJson(CategoryColorModel instance) =>
    <String, dynamic>{
      'color': instance.categoryColor,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      (json['id'] as num).toInt(),
      json['categoryname'] as String,
      json['categoryimage'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.categoryId,
      'categoryname': instance.categoryName,
      'categoryimage': instance.categoryImage,
    };
