class Shoe{
  Shoe({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description
  });

  final String name;
  final String price;
  final String imagePath;
  final String description;

  static List<Shoe> getShoes (){
    List<Shoe> shoes = [];

    shoes.add(
      Shoe(name: "Nike Revolution 7", price: "70", imagePath: 'assets/images/nike-5.png', description: "Men's Road Running Shoes")
    );

    shoes.add(
      Shoe(name: "Nike Swoosh 3", price: "299", imagePath: 'assets/images/nike-3.png', description: "Metaverse kicks")
    );

    shoes.add(
      Shoe(name: "Nike Spark", price: "135", imagePath: 'assets/images/nike-2.png', description: "Air Revolution")
    );

    shoes.add(
      Shoe(name: "Nike Joyride", price: "114", imagePath: 'assets/images/nike-1.png', description: "Nike Joyride Run Flyknit")
    );

    shoes.add(
      Shoe(name: "Nike Air Max Correlate", price: "100", imagePath: 'assets/images/nike-4.png', description: "Women's Running Shoes")
    );

    return shoes;
  }
}