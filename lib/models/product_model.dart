class ProductModel {
  final String image;
  final String name;
  final String desription;
  final String price;

  ProductModel(
      {required this.image,
      required this.desription,
      required this.name,
      required this.price});

  static List<ProductModel> products = [
    ProductModel(
        image: "assets/product/1.png",
        desription: "reversible angora cardigan",
        name: "October",
        price: "120"),
    ProductModel(
        image: "assets/product/2.png",
        desription: "reversible angora cardigan",
        name: "October",
        price: "270"),
    ProductModel(
        image: "assets/product/3.png",
        desription: "reversible angora cardigan",
        name: "October",
        price: "210"),
    ProductModel(
        image: "assets/product/4.png",
        desription: "reversible angora cardigan",
        name: "October",
        price: "700"),
    ProductModel(
        image: "assets/product/5.png",
        desription: "reversible angora cardigan",
        name: "October",
        price: "400"),
    ProductModel(
        image: "assets/product/6.png",
        desription: "reversible angora cardigan",
        name: "October",
        price: "350"),
  ];
}
