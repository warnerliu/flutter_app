class UserModel {
  String name;
  int age;

  UserModel(this.name, this.age);

  @override
  String toString() {
    return name + " is " + age.toString() + " years old";
  }
}
