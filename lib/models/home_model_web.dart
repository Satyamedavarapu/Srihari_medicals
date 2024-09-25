import 'package:json_annotation/json_annotation.dart';

part 'home_model_web.g.dart';

@JsonSerializable()
class HomeModelWeb {
  @JsonKey(name: 'DiscountProducts')
  final List<ProductModel> discountProducts;

  @JsonKey(name: 'Categories')
  final List<CategoryModel> categories;

  const HomeModelWeb(this.discountProducts, this.categories);

  factory HomeModelWeb.fromJson(Map<String, dynamic> json) =>
      _$HomeModelWebFromJson(json);
}

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'productname')
  final String productName;

  @JsonKey(name: 'consumerdiscount')
  final double discount;

  @JsonKey(name: 'productmrp')
  final double price;

  @JsonKey(name: 'categoryname')
  final String categoryName;

  @JsonKey(name: 'categoryid')
  final int categoryId;

  @JsonKey(name: 'category')
  final CategoryColorModel category;

  const ProductModel(this.id, this.productName, this.discount, this.price,
      this.categoryName, this.categoryId, this.category);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@JsonSerializable()
class CategoryColorModel {
  @JsonKey(name: 'color')
  final String categoryColor;

  const CategoryColorModel(this.categoryColor);

  factory CategoryColorModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryColorModelFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'id')
  final int categoryId;

  @JsonKey(name: 'categoryname')
  final String categoryName;

  @JsonKey(name: 'categoryimage', defaultValue: '')
  final String? categoryImage;

  const CategoryModel(this.categoryId, this.categoryName, this.categoryImage);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
