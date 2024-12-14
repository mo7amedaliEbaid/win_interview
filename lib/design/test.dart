class AirConditioner {
  void turnOn() => print("turn on conditioner");

  void turnOff() => print("turn off conditioner");
}

class Lights {
  void turnOn() => print("turn on lights");

  void turnOff() => print("turn off lights");
}

class Tv {
  void turnOn() => print("turn on tv");

  void turnOff() => print("turn off tv");
}

class RoomFacade {
  final Lights lights;
  final Tv tv;
  final AirConditioner airConditioner;

  RoomFacade({
    required this.tv,
    required this.lights,
    required this.airConditioner,
  });

  void startDayMode() {
    lights.turnOn();
    airConditioner.turnOn();
    tv.turnOn();
  }

  void startSleepMood() {
    tv.turnOff();
    lights.turnOff();
    airConditioner.turnOff();
  }
}

main() {
  Lights lights = Lights();
  AirConditioner airConditioner = AirConditioner();
  Tv tv = Tv();

  RoomFacade roomFacade =
      RoomFacade(tv: tv, lights: lights, airConditioner: airConditioner);

  roomFacade.startDayMode();
  roomFacade.startSleepMood();
}
// provide a simplified interface to a larger, more complex subsystems,
