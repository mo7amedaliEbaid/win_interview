abstract class Vehicle {
  deliver();
}

class Bike extends Vehicle {
  @override
  deliver() {
    print("d by bike");
  }
}

class Car extends Vehicle {
  @override
  deliver() {
    print("d by car");
  }
}

abstract class Transport {
// factory Method
  Vehicle createVehicle();

  startDelivery() {
    Vehicle vehicle = createVehicle();
    vehicle.deliver();
  }
}

class BikeTransport extends Transport {
  @override
  Vehicle createVehicle() {
    return Bike();
  }
}

class CarTransport extends Transport {
  @override
  Vehicle createVehicle() {
    return Car();
  }
}

main() {
  Transport car = CarTransport();
  Transport bike = BikeTransport();

  car.startDelivery();
  bike.startDelivery();
}
