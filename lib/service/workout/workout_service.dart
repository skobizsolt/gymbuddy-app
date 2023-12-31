import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddy/global/global_variables.dart';
import 'package:gymbuddy/models/api/training_api.swagger.dart';
import 'package:gymbuddy/models/workout.dart';
import 'package:gymbuddy/models/workout/change_workout.dart';
import 'package:gymbuddy/service/auth/user_service.dart';
import 'package:gymbuddy/service/mapper/workout_mapper.dart';
import 'package:gymbuddy/service/util/response_validator.dart';
import 'package:gymbuddy/service/workout/workout_interaction_service.dart';
import 'package:gymbuddy/service/workout/workout_step_media_service.dart';

class WorkoutService extends StateNotifier<List<Workout>> {
  WorkoutService() : super([]);

  final _workoutMapper = WorkoutModelMapper();
  final _api = TrainingApi.create(baseUrl: Uri.http(GlobalValues.SERVER_URL));
  final _interactionService = WorkoutInteractionService();
  final _mediaService = WorkoutStepMediaService();

  Future<List<Workout>> getWorkouts() async {
    if (state.isNotEmpty) {
      return state;
    }

    final token = await UserService.firebaseUserJwtToken;

    final response = await _api.workoutsGet(
      authorization: token,
    );

    ResponseValidator.validateResponse(response);

    if (response.body == null) {
      state = [];
      return state;
    }

    var workouts = _workoutMapper.toWorkoutList(response.body!);
    state = workouts;
    return workouts;
  }

  Future<WorkoutResponse> createWorkout(ChangeWorkoutDto workout) async {
    var request = ChangeWorkoutRequest.fromJson(workout.toAddWorkoutMap());
    final token = await UserService.firebaseUserJwtToken;
    var response = await _api.workoutsPost(
      authorization: token,
      userId: FirebaseAuth.instance.currentUser!.uid,
      body: request,
    );

    ResponseValidator.validateResponse(response);

    final newWorkout = _workoutMapper.toWorkout(response.body!);
    state = [...state, newWorkout];

    await _interactionService.createLikesDocument(newWorkout.workoutId);

    return response.body!;
  }

  Stream<WorkoutDetailsResponse> getGeneralStepDetails(
      final int workoutId) async* {
    final token = await UserService.firebaseUserJwtToken;
    var response = await _api.workoutsWorkoutIdDetailsGet(
      authorization: token,
      workoutId: workoutId,
    );
    yield response.body!;
  }

  Future<void> editWorkout(
    final int workoutId,
    final ChangeWorkoutDto workout,
  ) async {
    final token = await UserService.firebaseUserJwtToken;
    var response = await _api.workoutsWorkoutIdPut(
      authorization: token,
      workoutId: workoutId,
      body: ChangeWorkoutRequest.fromJson(workout.toEditWorkoutMap()),
    );

    ResponseValidator.validateResponse(response);

    var editedWorkout = _workoutMapper.toWorkout(response.body!);
    final List<Workout> updatedList = state
        .map(
          (e) => e.workoutId == editedWorkout.workoutId ? editedWorkout : e,
        )
        .toList();
    state = updatedList;
  }

  Future<void> deleteWorkout(int workoutId, List<int> stepIds) async {
    final token = await UserService.firebaseUserJwtToken;
    final response = await _api.workoutsWorkoutIdDelete(
      authorization: token,
      workoutId: workoutId,
    );

    ResponseValidator.validateResponse(response);

    state = [...state.where((element) => element.workoutId != workoutId)];

    _interactionService.deleteLikesDocument(workoutId);
    _mediaService.deleteImagesForWorkout(workoutId, stepIds);
  }
}
