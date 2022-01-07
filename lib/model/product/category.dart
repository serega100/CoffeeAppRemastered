import 'package:coffee_app_remastered/data/id.dart';

class Category {
  final Id<Category> id;
  final String title;
  final int orderPriority;

  Category({
    required this.id,
    required this.title,
    required this.orderPriority,
  });
}
