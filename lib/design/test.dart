abstract class Coffee {
  String getDescription();

  String getCost();
}

class SimpleCoffee implements Coffee {
  @override
  String getCost() {
    return "SimpleCost";
  }

  @override
  String getDescription() {
    return "Simple Description";
  }
}

abstract class CoffeeDecorator implements Coffee {
  final Coffee coffee;

  CoffeeDecorator(this.coffee);

  @override
  String getCost() {
    return coffee.getDescription();
  }

  @override
  String getDescription() {
    return coffee.getCost();
  }
}

class SugarCoffee extends CoffeeDecorator {
  SugarCoffee(super.coffee);

  @override
  String getCost() {
    return "Sugar Cost";
  }

  @override
  String getDescription() {
    return "Sugar Description";
  }
}

class MilkCoffee extends CoffeeDecorator {
  MilkCoffee(super.coffee);

  @override
  String getCost() {
    return "Milk Cost";
  }

  @override
  String getDescription() {
    return "Milk Description";
  }
}

main() {
  Coffee coffee = SimpleCoffee();
  print(coffee.getCost());
  print(coffee.getDescription());

  coffee = SugarCoffee(coffee);
  print(coffee.getCost());
  print(coffee.getDescription());

  coffee = MilkCoffee(coffee);
  print(coffee.getCost());
  print(coffee.getDescription());
}
