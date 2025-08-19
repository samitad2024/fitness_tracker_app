import 'package:fitness_tracker_app/enums/workout_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/workout.dart';


part 'workout_providers.g.dart';

@Riverpod(
  keepAlive: true,
)
class WorkoutNotifier extends _$WorkoutNotifier {
  final _uuid = const Uuid();
  @override
  List<Workout> build() {
    return [];
  }

  void addWorkout(
      String name, double weight, int reps, int sets, WorkoutType type) {
    state = [
      ...state,
      Workout(
        id: _uuid.v4(),
        name: name,
        weight: weight,
        reps: reps,
        sets: sets,
        type: type,
        createdAt: DateTime.now(),
        isCompleted: false,
        completedAt: null,
      )
    ];
  }

  void toggleCompletion(String id) {
    state = [
      for (final workout in state)
        if (workout.id == id)
          workout.copyWith(
            isCompleted: !workout.isCompleted,
            completedAt: workout.isCompleted ? null : DateTime.now(),
          )
        else
          workout,
    ];
  }

  void removeworkout(String id) {
    state = state.where((workout) => workout.id != id).toList();
  }
}
