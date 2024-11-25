```

In general, the difference between enums and sealed classes applies
across languages like Java, Kotlin, Dart, and others,
though the specific features and syntax may vary.
Here's a broad comparison, with examples from Java to clarify:

1. Enums (Enumerations)
Definition:
An enum is a special type that represents a fixed set of named constants.
In many languages, including Java, enums can also have methods and fields,
making them more than just simple constants.

Key Characteristics:
Fixed constants: The set of constants in an enum is pre-defined and cannot be extended.
Singleton-like instances: Each constant is a unique instance of the enum.
Can have methods and fields: In Java, enums can define methods and fields,
allowing behavior to be attached to constants.
Usage in Java:

enum Color {
    RED, GREEN, BLUE;

    public void printColor() {
        System.out.println("Selected color: " + this.name());
    }
}

public class Main {
    public static void main(String[] args) {
        Color color = Color.RED;
        color.printColor(); // Output: Selected color: RED
    }
}

Typical Use Cases:
Representing fixed sets like days of the week, directions, or states of an object.
When each constant can optionally have associated behavior or state.

2. Sealed Classes
Definition:
A sealed class is a more flexible way to define a closed hierarchy of types.
Only a specific set of classes can extend or implement a sealed class.

Key Characteristics:
Closed hierarchy: You control which classes can extend or implement the sealed class.
Subtypes may have distinct behavior and state.
Exhaustive pattern matching: Enforces handling of all possible subtypes at compile time.
Usage in Java (Since Java 15):

sealed class Shape permits Circle, Rectangle {}

final class Circle extends Shape {
    double radius;

    Circle(double radius) {
        this.radius = radius;
    }
}

final class Rectangle extends Shape {
    double width, height;

    Rectangle(double width, double height) {
        this.width = width;
        this.height = height;
    }
}

public class Main {
    public static void main(String[] args) {
        Shape shape = new Circle(5.0);

        if (shape instanceof Circle circle) {
            System.out.println("Circle with radius: " + circle.radius);
        } else if (shape instanceof Rectangle rectangle) {
            System.out.println("Rectangle with width: " + rectangle.width);
        }
    }
}

Typical Use Cases:
Modeling hierarchies of related classes.
Situations where each subtype may hold different data or have different methods.
Use with pattern matching to ensure all possible cases are handled.
Comparison of Enums and Sealed Classes
Feature	Enums	Sealed Classes
Purpose	Represent a fixed set of constants	Define a closed set of related types
Extensibility	Fixed set of constants	Fixed set of subclasses
State and Behavior	Can have state and behavior per constant	Subclasses can have distinct state/behavior
Pattern Matching	Limited (e.g., switch in Java)	Full pattern matching in some languages
Use Case	Simple categorical values	Complex hierarchies with varied data
Example	Days of the week, traffic light colors	Geometric shapes, sealed event hierarchies
Key Differences in Java:
Enums are best when you have a fixed set of constant values, possibly with some shared behavior.
Sealed classes are better when you have a fixed set of types that share a common supertype
but may have different fields and methods.

```
