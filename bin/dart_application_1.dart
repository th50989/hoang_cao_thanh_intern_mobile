class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);
}

void main() {
  //Question 2.1
  // Inventory of products
  List<Product> products = [
    Product('Laptop', 999.99, 5),
    Product('Smartphone', 499.99, 10),
    Product('Tablet', 299.99, 0),
    Product('Smartwatch', 199.99, 3),
  ];

  // Calculate the total inventory value
  double totalInventoryValue = products.fold(0, (total, product) {
    return total + (product.price * product.quantity);
  });
  print('Total Inventory Value: \$${totalInventoryValue.toStringAsFixed(2)}');

  // Find the most expensive product
  Product mostExpensive = products.reduce((current, next) {
    return current.price > next.price ? current : next;
  });
  print('Most Expensive Product: "${mostExpensive.name}"');

  //check exist true or false
  bool isExist = findProductByName(['Headphones'], products);
  isExist ? print('Found Product') : print('Product Not Found');

  //shortBy
  //asc and quantity
  shortList('asc', 'quantity', products);
  print('Sorted Products :');
  for (var product in products) {
    print(
        '${product.name}: price ${product.price}, quantity ${product.quantity}');
  }
  print('---------------');
  //dsc and price
  shortList('dsc', 'price', products);
  print('Sorted Products :');
  for (var product in products) {
    print(
        '${product.name}: price ${product.price}, quantity ${product.quantity}');
  }

  //Question 2.2
  findMissingNum([3, 1, 2, 6, 4], 5);
}

//Return true if products exist
bool findProductByName(List<String> name, List<Product> products) {
  List<String> searchNames = name;

  // Filter the products with names in the searchNames list
  List<Product> foundProducts = products.where((product) {
    return searchNames.contains(product.name);
  }).toList();
  if (foundProducts.isEmpty) {
    return false;
  } else {
    return true;
  }
}

void shortList(String order, String sortBy, List<Product> products) {
  products.sort((a, b) {
    int comparison;
    if (sortBy == 'price') {
      comparison = a.price.compareTo(b.price); // Compare by price
    } else if (sortBy == 'quantity') {
      comparison = a.quantity.compareTo(b.quantity); // Compare by quantity
    } else {
      throw ArgumentError('Invalid sortBy option: $sortBy');
    }
    return order == 'asc' ? comparison : -comparison; // Reverse for descending
  });
}

//list<int> so always distince number
int findMissingNum(List<int> lst, int n) {
  //step 1
  //find total of the real list
  //step 2
  //find total of the expected without missing ayny number
  //step3
  //compare

  //find ActualNumber
  int totalInActualList = 0;
  for (int i = 0; i < lst.length; i++) {
    totalInActualList += lst[i];
  }
  print("Actual number ${totalInActualList.toString()}");

  //find ExpectNumber
  int totalExpect = 0;
  for (int i = 0; i <= n + 1; i++) {
    totalExpect += i;
  }
  print("Expected number ${totalExpect.toString()}");

  //find MissingNumber
  int missingNumber = totalExpect - totalInActualList;
  print('Missing number ${missingNumber.toString()}');
  return missingNumber;
}
