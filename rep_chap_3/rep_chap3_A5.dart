void main() {
  List<String> electronics = ["Laptop", "Smartphone", "Tablet"];
  List<String> groceries = ["Apple", "Banana", "Carrot", "Tomato"];
  List<String> clothes = ["Shirt", "Jeans"];

  List<List<String>> productLists = [electronics, groceries, clothes];
  List<String> categories = ["Electronics", "Groceries", "Clothes"];

  for (int i = 0; i < productLists.length; i++) {
    int productCount = productLists[i].length;
    String category = categories[i];
    print("The $category category has $productCount products.");
  }
}
