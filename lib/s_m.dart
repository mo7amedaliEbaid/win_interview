// The Cubit (from flutter_bloc) and Provider (from provider package) are state management solutions in Flutter.
// They cater to different use cases and follow distinct paradigms for managing and exposing state.
//
// Here’s a detailed breakdown of the differences under the hood, their use cases, and example code snippets:
//
// 1. Conceptual Difference
// Provider:
//
// A lightweight dependency injection and state management library.
// It provides a way to expose and rebuild widgets based on state changes.
// Reactive programming is optional.
// It doesn’t enforce a specific architecture but integrates with various patterns (MVVM, MVC, etc.).
// Cubit:
//
// A simpler layer built on top of bloc (part of flutter_bloc).
// It follows a predictable event-based architecture, where:
// The state is emitted in response to actions (state transitions).
// The logic for transitions is encapsulated within a Cubit.
// Reactive by design.
// 2. Architectural Paradigm
// Provider:
//
// Based on the ChangeNotifier or any other observable pattern.
// Simplifies listening to state changes by exposing notifyListeners().
// Cubit:
//
// Built around the streams-based pattern, where:
// Cubit emits states.
// Consumers listen to these emitted states using BlocBuilder or BlocListener.
// 3. Under the Hood
// Provider Mechanics:
// Uses a InheritedWidget to propagate state changes down the widget tree.
// When notifyListeners() is called, all dependent widgets are rebuilt.
// Key points:
//
// Efficient, as it rebuilds only widgets that depend on the updated state.
// Flexible; you can use Provider.of<T>(context) or Consumer<T>() to retrieve and rebuild on updates.
// Cubit Mechanics:
// Uses Streams under the hood.
// Each Cubit instance manages its state as a stream of immutable objects.
// Listeners (widgets) subscribe to this stream, and the state updates are pushed downstream.
// Key points:
//
// Reactivity is baked in; widgets automatically react to new state emissions.
// Encourages separation of UI and business logic.
// 4. Use Cases
// Provider Use Cases:
// When you need a simple solution for dependency injection.
// For lightweight state updates, such as form fields or simple counters.
// When you don’t need reactive streams and prefer a more imperative style.
// Cubit Use Cases:
// When your app involves complex state transitions.
// When you need a predictable reactive architecture for state management.
// When using flutter_bloc-based ecosystem tools for scalability.
// 5. Code Snippets
// Provider Example: Counter App
// dart
// Copy code
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// // Counter Model
// class CounterModel with ChangeNotifier {
//   int _count = 0;
//   int get count => _count;
//
//   void increment() {
//     _count++;
//     notifyListeners(); // Notify listeners about state changes
//   }
// }
//
// // Main App
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => CounterModel(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CounterScreen(),
//     );
//   }
// }
//
// // UI that consumes the state
// class CounterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final counter = Provider.of<CounterModel>(context);
//     return Scaffold(
//       appBar: AppBar(title: Text('Provider Example')),
//       body: Center(
//         child: Text('Count: ${counter.count}', style: TextStyle(fontSize: 24)),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: counter.increment,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
// Cubit Example: Counter App
// dart
// Copy code
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// // Counter Cubit
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() => emit(state + 1); // Emit a new state
// }
//
// // Main App
// void main() {
//   runApp(
//     BlocProvider(
//       create: (_) => CounterCubit(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CounterScreen(),
//     );
//   }
// }
//
// // UI that consumes the state
// class CounterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Cubit Example')),
//       body: Center(
//         child: BlocBuilder<CounterCubit, int>(
//           builder: (context, count) {
//             return Text('Count: $count', style: TextStyle(fontSize: 24));
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.read<CounterCubit>().increment(),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
// 6. Key Comparisons
// Feature	Provider	Cubit
// Architecture	Dependency Injection, Observables	Streams, Reactive State Management
// Ease of Use	Simple, great for basic apps	Easy for reactive apps with complex states
// Performance	Efficient, rebuilds selective widgets	Efficient but depends on stream emissions
// Reactivity	Optional	Built-in
// Learning Curve	Easy	Moderate
// Immutability	Not required (can use mutable state)	Requires immutable states
// Integration	Works with any architecture	Designed for BLoC pattern integration
// When to Use Which?
// Use Provider if:
//
// You need a lightweight solution.
// Your app is relatively simple.
// You prefer declarative state handling with minimal boilerplate.
// Use Cubit if:
//
// You need a scalable, reactive architecture.
// Your app has complex business logic.
// Predictable state transitions are critical.
// Both tools can coexist in the same project. For instance, you might use Provider for dependency injection and Cubit for handling business logic.