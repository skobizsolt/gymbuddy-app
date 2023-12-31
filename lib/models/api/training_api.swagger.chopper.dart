// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TrainingApi extends TrainingApi {
  _$TrainingApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TrainingApi;

  @override
  Future<Response<WorkoutResponse>> _workoutsWorkoutIdGet({
    String? authorization,
    required int? workoutId,
  }) {
    final Uri $url = Uri.parse('/workouts/${workoutId}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<WorkoutResponse, WorkoutResponse>($request);
  }

  @override
  Future<Response<WorkoutResponse>> _workoutsWorkoutIdPut({
    String? authorization,
    required int? workoutId,
    required ChangeWorkoutRequest? body,
  }) {
    final Uri $url = Uri.parse('/workouts/${workoutId}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<WorkoutResponse, WorkoutResponse>($request);
  }

  @override
  Future<Response<dynamic>> _workoutsWorkoutIdDelete({
    String? authorization,
    required int? workoutId,
  }) {
    final Uri $url = Uri.parse('/workouts/${workoutId}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<WorkoutStepResponse>> _workoutsWorkoutIdStepsStepIdGet({
    String? authorization,
    required int? workoutId,
    required int? stepId,
  }) {
    final Uri $url = Uri.parse('/workouts/${workoutId}/steps/${stepId}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<WorkoutStepResponse, WorkoutStepResponse>($request);
  }

  @override
  Future<Response<WorkoutStepResponse>> _workoutsWorkoutIdStepsStepIdPut({
    String? authorization,
    required int? workoutId,
    required int? stepId,
    required ChangeWorkoutStepRequest? body,
  }) {
    final Uri $url = Uri.parse('/workouts/${workoutId}/steps/${stepId}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<WorkoutStepResponse, WorkoutStepResponse>($request);
  }

  @override
  Future<Response<dynamic>> _workoutsWorkoutIdStepsStepIdDelete({
    String? authorization,
    required int? workoutId,
    required int? stepId,
  }) {
    final Uri $url = Uri.parse('/workouts/${workoutId}/steps/${stepId}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<WorkoutListResponse>> _workoutsGet({String? authorization}) {
    final Uri $url = Uri.parse('/workouts');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<WorkoutListResponse, WorkoutListResponse>($request);
  }

  @override
  Future<Response<WorkoutResponse>> _workoutsPost({
    String? authorization,
    required String? userId,
    required ChangeWorkoutRequest? body,
  }) {
    final Uri $url = Uri.parse('/workouts');
    final Map<String, dynamic> $params = <String, dynamic>{'userId': userId};
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      headers: $headers,
    );
    return client.send<WorkoutResponse, WorkoutResponse>($request);
  }

  @override
  Future<Response<List<WorkoutStepResponse>>> _workoutsWorkoutIdStepsGet({
    String? authorization,
    required int? workoutId,
  }) {
    final Uri $url = Uri.parse('/workouts/${workoutId}/steps');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client
        .send<List<WorkoutStepResponse>, WorkoutStepResponse>($request);
  }

  @override
  Future<Response<WorkoutStepResponse>> _workoutsWorkoutIdStepsPost({
    String? authorization,
    required int? workoutId,
    required ChangeWorkoutStepRequest? body,
  }) {
    final Uri $url = Uri.parse('/workouts/${workoutId}/steps');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<WorkoutStepResponse, WorkoutStepResponse>($request);
  }

  @override
  Future<Response<WorkoutDetailsResponse>> _workoutsWorkoutIdDetailsGet({
    String? authorization,
    required int? workoutId,
  }) {
    final Uri $url = Uri.parse('/workouts/${workoutId}/details');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client
        .send<WorkoutDetailsResponse, WorkoutDetailsResponse>($request);
  }
}
