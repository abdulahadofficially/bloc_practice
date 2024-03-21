import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EqutableTesting extends StatelessWidget {
  const EqutableTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person person = const Person(name: 'abdulahad', age: 23);
          Person person1 = const Person(name: 'abdulahad', age: 23);

          if (kDebugMode) {
            print('both objects are: ${person == person1}');
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Person extends Equatable {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
  List<Object?> get props => [
        name,
        age,
      ];
}
