class Product{
  int? id;
  String? name;
  String? description;
  double? unitPrice;

  Product(this.name, this.description, this.unitPrice);
  Product.withId({this.id ,this.name, this.description, this.unitPrice});

  Map<String,dynamic> toMap(){
    var map = new Map();
    map["name"] = name;
    map["description"] = description;
    map["unitPrice"] = unitPrice;
    if(id! == null) {
      map["id"] = id;
    }
    return toMap();

  }

  Product.fromObject(dynamic o){
    this.id = int.tryParse(o[id]);
    this.unitPrice = double.tryParse(o[unitPrice].toString());
    this.description = o[description];
    this.name = o[name];
  }
}