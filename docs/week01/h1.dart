class MenuItem {
  String name;
  double price;
  double? discountPercent;

  MenuItem(this.name,this.price,this.discountPercent);

  double finalPrice(){
    double? discount = discountPercent;
    if(discount != null){
      double maxPrice = price * discount;
      return price-maxPrice;
    }else{
      return price;
    }
  }
}

void main(){
  List<MenuItem> listItem = [
    MenuItem("nasi goreng", 15000, null),
    MenuItem("mie goreng", 10000, null),
    MenuItem("ayam geprek", 15000, 0.2)
  ];

  var menu = listItem.map((Menu) => Menu.name).toList();

  var MenuMurah = listItem.where((MenuM) => MenuM.finalPrice() < 15000).toList();

  var totalHarga = listItem.fold(0.0,(totalS,MenuM) => totalS + MenuM.finalPrice());
}
