class CellModel {
  String name;
  String address = 'const address';
  int age;

  CellModel(this.name, this.address, this.age);

  CellModel.nameAndAge(this.name, this.age);

  @override
  String toString() {
    return "user name is : $name, age is $age and live in $address";
  }
}
