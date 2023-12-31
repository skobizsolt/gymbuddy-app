import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddy/models/api/training_api.models.swagger.dart';
import 'package:gymbuddy/models/workout.dart';
import 'package:gymbuddy/models/workout_step.dart';
import 'package:gymbuddy/providers/auth_provider.dart';
import 'package:gymbuddy/service/workout/workout_service.dart';
import 'package:gymbuddy/service/workout/workout_step_service.dart';

var workoutStateProvider =
    StateNotifierProvider<WorkoutService, List<Workout>>((ref) {
  ref.watch(authStateChangeProvider);
  return WorkoutService();
});

FutureProvider<List<Workout>> workoutsProvider = FutureProvider((ref) {
  ref.watch(workoutStateProvider);
  return WorkoutService().getWorkouts();
});

var workoutsByCategoryProvider =
    FutureProvider.family<List<Workout>?, WorkoutCategory>(
  (ref, category) {
    var workouts = ref.watch(workoutsProvider).value;
    return workouts == null
        ? []
        : workouts.where((id) => id.category == category).toList();
  },
);

var workoutsByUserProvider = FutureProvider<List<Workout>?>(
  (ref) {
    var workouts = ref.watch(workoutsProvider).value;
    return workouts == null
        ? []
        : workouts
            .where((id) => id.userId == FirebaseAuth.instance.currentUser!.uid)
            .toList();
  },
);

var workoutByIdProvider = FutureProvider.family<Workout?, int>(
  (ref, workoutId) {
    var workouts = ref.watch(workoutsProvider).value;
    return workouts == null
        ? null
        : workouts.firstWhere((id) => id.workoutId == workoutId, orElse: null);
  },
);

var workoutStepStateProvider =
    StateNotifierProvider<WorkoutStepService, List<WorkoutStep>>(
        (ref) => WorkoutStepService());

var workoutStepProvider =
    FutureProvider.family<List<WorkoutStep>, int>((ref, workoutId) {
  ref.watch(workoutStepStateProvider);
  return WorkoutStepService().getSteps(workoutId);
});

var workoutGeneralDetailsProvider =
    StreamProvider.family<WorkoutDetailsResponse, int>((ref, workoutId) {
  ref.watch(workoutStepStateProvider);
  ref.watch(workoutStepProvider(workoutId));
  return WorkoutService().getGeneralStepDetails(workoutId);
});

var filterWorkoutsByIdsProvider =
    FutureProvider.family<List<Workout>, List<int>>((ref, ids) {
  var workouts = ref.watch(workoutsProvider).value ?? [];
  if (workouts.isEmpty) {
    return [];
  }
  List<Workout> likedByUser = [];
  ids.forEach((id) {
    likedByUser.add(workouts.firstWhere((workout) => workout.workoutId == id));
  });
  return likedByUser;
});

var createdWorkoutsProvider = Provider<int>((ref) {
  var workouts = ref.watch(workoutsProvider);
  if (!workouts.hasValue) {
    workouts = ref.refresh(workoutsProvider);
  }
  final now = DateTime.now();
  return ref
      .watch(workoutsByUserProvider)
      .value!
      .where((element) =>
          DateTime(now.year, now.month, now.day).isBefore(element.registeredOn))
      .length;
});
