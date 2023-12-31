// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'training_api.enums.swagger.dart' as enums;

part 'training_api.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class ChangeWorkoutRequest {
  const ChangeWorkoutRequest({
    this.title,
    this.description,
    this.category,
    this.difficulty,
  });

  factory ChangeWorkoutRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeWorkoutRequestFromJson(json);

  static const toJsonFactory = _$ChangeWorkoutRequestToJson;
  Map<String, dynamic> toJson() => _$ChangeWorkoutRequestToJson(this);

  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(
    name: 'category',
    toJson: changeWorkoutRequestCategoryToJson,
    fromJson: changeWorkoutRequestCategoryNullableFromJson,
  )
  final enums.ChangeWorkoutRequestCategory? category;
  @JsonKey(
    name: 'difficulty',
    toJson: changeWorkoutRequestDifficultyToJson,
    fromJson: changeWorkoutRequestDifficultyNullableFromJson,
  )
  final enums.ChangeWorkoutRequestDifficulty? difficulty;
  static const fromJsonFactory = _$ChangeWorkoutRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeWorkoutRequest &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.difficulty, difficulty) ||
                const DeepCollectionEquality()
                    .equals(other.difficulty, difficulty)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(difficulty) ^
      runtimeType.hashCode;
}

extension $ChangeWorkoutRequestExtension on ChangeWorkoutRequest {
  ChangeWorkoutRequest copyWith(
      {String? title,
      String? description,
      enums.ChangeWorkoutRequestCategory? category,
      enums.ChangeWorkoutRequestDifficulty? difficulty}) {
    return ChangeWorkoutRequest(
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        difficulty: difficulty ?? this.difficulty);
  }

  ChangeWorkoutRequest copyWithWrapped(
      {Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<enums.ChangeWorkoutRequestCategory?>? category,
      Wrapped<enums.ChangeWorkoutRequestDifficulty?>? difficulty}) {
    return ChangeWorkoutRequest(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        category: (category != null ? category.value : this.category),
        difficulty: (difficulty != null ? difficulty.value : this.difficulty));
  }
}

@JsonSerializable(explicitToJson: true)
class WorkoutResponse {
  const WorkoutResponse({
    this.workoutId,
    this.userId,
    this.title,
    this.description,
    this.registeredOn,
    this.lastModified,
    this.category,
    this.difficulty,
  });

  factory WorkoutResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkoutResponseFromJson(json);

  static const toJsonFactory = _$WorkoutResponseToJson;
  Map<String, dynamic> toJson() => _$WorkoutResponseToJson(this);

  @JsonKey(name: 'workoutId')
  final int? workoutId;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'registeredOn')
  final DateTime? registeredOn;
  @JsonKey(name: 'lastModified')
  final DateTime? lastModified;
  @JsonKey(
    name: 'category',
    toJson: workoutResponseCategoryToJson,
    fromJson: workoutResponseCategoryNullableFromJson,
  )
  final enums.WorkoutResponseCategory? category;
  @JsonKey(
    name: 'difficulty',
    toJson: workoutResponseDifficultyToJson,
    fromJson: workoutResponseDifficultyNullableFromJson,
  )
  final enums.WorkoutResponseDifficulty? difficulty;
  static const fromJsonFactory = _$WorkoutResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WorkoutResponse &&
            (identical(other.workoutId, workoutId) ||
                const DeepCollectionEquality()
                    .equals(other.workoutId, workoutId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.registeredOn, registeredOn) ||
                const DeepCollectionEquality()
                    .equals(other.registeredOn, registeredOn)) &&
            (identical(other.lastModified, lastModified) ||
                const DeepCollectionEquality()
                    .equals(other.lastModified, lastModified)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.difficulty, difficulty) ||
                const DeepCollectionEquality()
                    .equals(other.difficulty, difficulty)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(workoutId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(registeredOn) ^
      const DeepCollectionEquality().hash(lastModified) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(difficulty) ^
      runtimeType.hashCode;
}

extension $WorkoutResponseExtension on WorkoutResponse {
  WorkoutResponse copyWith(
      {int? workoutId,
      String? userId,
      String? title,
      String? description,
      DateTime? registeredOn,
      DateTime? lastModified,
      enums.WorkoutResponseCategory? category,
      enums.WorkoutResponseDifficulty? difficulty}) {
    return WorkoutResponse(
        workoutId: workoutId ?? this.workoutId,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        description: description ?? this.description,
        registeredOn: registeredOn ?? this.registeredOn,
        lastModified: lastModified ?? this.lastModified,
        category: category ?? this.category,
        difficulty: difficulty ?? this.difficulty);
  }

  WorkoutResponse copyWithWrapped(
      {Wrapped<int?>? workoutId,
      Wrapped<String?>? userId,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? registeredOn,
      Wrapped<DateTime?>? lastModified,
      Wrapped<enums.WorkoutResponseCategory?>? category,
      Wrapped<enums.WorkoutResponseDifficulty?>? difficulty}) {
    return WorkoutResponse(
        workoutId: (workoutId != null ? workoutId.value : this.workoutId),
        userId: (userId != null ? userId.value : this.userId),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        registeredOn:
            (registeredOn != null ? registeredOn.value : this.registeredOn),
        lastModified:
            (lastModified != null ? lastModified.value : this.lastModified),
        category: (category != null ? category.value : this.category),
        difficulty: (difficulty != null ? difficulty.value : this.difficulty));
  }
}

@JsonSerializable(explicitToJson: true)
class ChangeWorkoutStepRequest {
  const ChangeWorkoutStepRequest({
    this.stepName,
    this.details,
    this.workoutType,
    this.estimatedTime,
  });

  factory ChangeWorkoutStepRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeWorkoutStepRequestFromJson(json);

  static const toJsonFactory = _$ChangeWorkoutStepRequestToJson;
  Map<String, dynamic> toJson() => _$ChangeWorkoutStepRequestToJson(this);

  @JsonKey(name: 'stepName')
  final String? stepName;
  @JsonKey(name: 'details')
  final String? details;
  @JsonKey(
    name: 'workoutType',
    toJson: changeWorkoutStepRequestWorkoutTypeToJson,
    fromJson: changeWorkoutStepRequestWorkoutTypeNullableFromJson,
  )
  final enums.ChangeWorkoutStepRequestWorkoutType? workoutType;
  @JsonKey(name: 'estimatedTime')
  final int? estimatedTime;
  static const fromJsonFactory = _$ChangeWorkoutStepRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeWorkoutStepRequest &&
            (identical(other.stepName, stepName) ||
                const DeepCollectionEquality()
                    .equals(other.stepName, stepName)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.workoutType, workoutType) ||
                const DeepCollectionEquality()
                    .equals(other.workoutType, workoutType)) &&
            (identical(other.estimatedTime, estimatedTime) ||
                const DeepCollectionEquality()
                    .equals(other.estimatedTime, estimatedTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(stepName) ^
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(workoutType) ^
      const DeepCollectionEquality().hash(estimatedTime) ^
      runtimeType.hashCode;
}

extension $ChangeWorkoutStepRequestExtension on ChangeWorkoutStepRequest {
  ChangeWorkoutStepRequest copyWith(
      {String? stepName,
      String? details,
      enums.ChangeWorkoutStepRequestWorkoutType? workoutType,
      int? estimatedTime}) {
    return ChangeWorkoutStepRequest(
        stepName: stepName ?? this.stepName,
        details: details ?? this.details,
        workoutType: workoutType ?? this.workoutType,
        estimatedTime: estimatedTime ?? this.estimatedTime);
  }

  ChangeWorkoutStepRequest copyWithWrapped(
      {Wrapped<String?>? stepName,
      Wrapped<String?>? details,
      Wrapped<enums.ChangeWorkoutStepRequestWorkoutType?>? workoutType,
      Wrapped<int?>? estimatedTime}) {
    return ChangeWorkoutStepRequest(
        stepName: (stepName != null ? stepName.value : this.stepName),
        details: (details != null ? details.value : this.details),
        workoutType:
            (workoutType != null ? workoutType.value : this.workoutType),
        estimatedTime:
            (estimatedTime != null ? estimatedTime.value : this.estimatedTime));
  }
}

@JsonSerializable(explicitToJson: true)
class WorkoutStepResponse {
  const WorkoutStepResponse({
    this.stepId,
    this.stepPosition,
    this.stepName,
    this.details,
    this.workoutType,
    this.estimatedTime,
  });

  factory WorkoutStepResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkoutStepResponseFromJson(json);

  static const toJsonFactory = _$WorkoutStepResponseToJson;
  Map<String, dynamic> toJson() => _$WorkoutStepResponseToJson(this);

  @JsonKey(name: 'stepId')
  final int? stepId;
  @JsonKey(name: 'stepPosition')
  final int? stepPosition;
  @JsonKey(name: 'stepName')
  final String? stepName;
  @JsonKey(name: 'details')
  final String? details;
  @JsonKey(
    name: 'workoutType',
    toJson: workoutStepResponseWorkoutTypeToJson,
    fromJson: workoutStepResponseWorkoutTypeNullableFromJson,
  )
  final enums.WorkoutStepResponseWorkoutType? workoutType;
  @JsonKey(name: 'estimatedTime')
  final int? estimatedTime;
  static const fromJsonFactory = _$WorkoutStepResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WorkoutStepResponse &&
            (identical(other.stepId, stepId) ||
                const DeepCollectionEquality().equals(other.stepId, stepId)) &&
            (identical(other.stepPosition, stepPosition) ||
                const DeepCollectionEquality()
                    .equals(other.stepPosition, stepPosition)) &&
            (identical(other.stepName, stepName) ||
                const DeepCollectionEquality()
                    .equals(other.stepName, stepName)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.workoutType, workoutType) ||
                const DeepCollectionEquality()
                    .equals(other.workoutType, workoutType)) &&
            (identical(other.estimatedTime, estimatedTime) ||
                const DeepCollectionEquality()
                    .equals(other.estimatedTime, estimatedTime)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(stepId) ^
      const DeepCollectionEquality().hash(stepPosition) ^
      const DeepCollectionEquality().hash(stepName) ^
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(workoutType) ^
      const DeepCollectionEquality().hash(estimatedTime) ^
      runtimeType.hashCode;
}

extension $WorkoutStepResponseExtension on WorkoutStepResponse {
  WorkoutStepResponse copyWith(
      {int? stepId,
      int? stepPosition,
      String? stepName,
      String? details,
      enums.WorkoutStepResponseWorkoutType? workoutType,
      int? estimatedTime}) {
    return WorkoutStepResponse(
        stepId: stepId ?? this.stepId,
        stepPosition: stepPosition ?? this.stepPosition,
        stepName: stepName ?? this.stepName,
        details: details ?? this.details,
        workoutType: workoutType ?? this.workoutType,
        estimatedTime: estimatedTime ?? this.estimatedTime);
  }

  WorkoutStepResponse copyWithWrapped(
      {Wrapped<int?>? stepId,
      Wrapped<int?>? stepPosition,
      Wrapped<String?>? stepName,
      Wrapped<String?>? details,
      Wrapped<enums.WorkoutStepResponseWorkoutType?>? workoutType,
      Wrapped<int?>? estimatedTime}) {
    return WorkoutStepResponse(
        stepId: (stepId != null ? stepId.value : this.stepId),
        stepPosition:
            (stepPosition != null ? stepPosition.value : this.stepPosition),
        stepName: (stepName != null ? stepName.value : this.stepName),
        details: (details != null ? details.value : this.details),
        workoutType:
            (workoutType != null ? workoutType.value : this.workoutType),
        estimatedTime:
            (estimatedTime != null ? estimatedTime.value : this.estimatedTime));
  }
}

@JsonSerializable(explicitToJson: true)
class WorkoutListResponse {
  const WorkoutListResponse({
    this.workouts,
  });

  factory WorkoutListResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkoutListResponseFromJson(json);

  static const toJsonFactory = _$WorkoutListResponseToJson;
  Map<String, dynamic> toJson() => _$WorkoutListResponseToJson(this);

  @JsonKey(name: 'workouts', defaultValue: <WorkoutResponse>[])
  final List<WorkoutResponse>? workouts;
  static const fromJsonFactory = _$WorkoutListResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WorkoutListResponse &&
            (identical(other.workouts, workouts) ||
                const DeepCollectionEquality()
                    .equals(other.workouts, workouts)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(workouts) ^ runtimeType.hashCode;
}

extension $WorkoutListResponseExtension on WorkoutListResponse {
  WorkoutListResponse copyWith({List<WorkoutResponse>? workouts}) {
    return WorkoutListResponse(workouts: workouts ?? this.workouts);
  }

  WorkoutListResponse copyWithWrapped(
      {Wrapped<List<WorkoutResponse>?>? workouts}) {
    return WorkoutListResponse(
        workouts: (workouts != null ? workouts.value : this.workouts));
  }
}

@JsonSerializable(explicitToJson: true)
class WorkoutDetailsResponse {
  const WorkoutDetailsResponse({
    this.estimatedTimeInMinutes,
    this.totalSteps,
  });

  factory WorkoutDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDetailsResponseFromJson(json);

  static const toJsonFactory = _$WorkoutDetailsResponseToJson;
  Map<String, dynamic> toJson() => _$WorkoutDetailsResponseToJson(this);

  @JsonKey(name: 'estimatedTimeInMinutes')
  final int? estimatedTimeInMinutes;
  @JsonKey(name: 'totalSteps')
  final int? totalSteps;
  static const fromJsonFactory = _$WorkoutDetailsResponseFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WorkoutDetailsResponse &&
            (identical(other.estimatedTimeInMinutes, estimatedTimeInMinutes) ||
                const DeepCollectionEquality().equals(
                    other.estimatedTimeInMinutes, estimatedTimeInMinutes)) &&
            (identical(other.totalSteps, totalSteps) ||
                const DeepCollectionEquality()
                    .equals(other.totalSteps, totalSteps)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(estimatedTimeInMinutes) ^
      const DeepCollectionEquality().hash(totalSteps) ^
      runtimeType.hashCode;
}

extension $WorkoutDetailsResponseExtension on WorkoutDetailsResponse {
  WorkoutDetailsResponse copyWith(
      {int? estimatedTimeInMinutes, int? totalSteps}) {
    return WorkoutDetailsResponse(
        estimatedTimeInMinutes:
            estimatedTimeInMinutes ?? this.estimatedTimeInMinutes,
        totalSteps: totalSteps ?? this.totalSteps);
  }

  WorkoutDetailsResponse copyWithWrapped(
      {Wrapped<int?>? estimatedTimeInMinutes, Wrapped<int?>? totalSteps}) {
    return WorkoutDetailsResponse(
        estimatedTimeInMinutes: (estimatedTimeInMinutes != null
            ? estimatedTimeInMinutes.value
            : this.estimatedTimeInMinutes),
        totalSteps: (totalSteps != null ? totalSteps.value : this.totalSteps));
  }
}

String? changeWorkoutRequestCategoryToJson(
    enums.ChangeWorkoutRequestCategory? changeWorkoutRequestCategory) {
  return changeWorkoutRequestCategory?.value;
}

enums.ChangeWorkoutRequestCategory changeWorkoutRequestCategoryFromJson(
  Object? changeWorkoutRequestCategory, [
  enums.ChangeWorkoutRequestCategory? defaultValue,
]) {
  return enums.ChangeWorkoutRequestCategory.values.firstWhereOrNull((e) =>
          e.value.toString().toLowerCase() ==
          changeWorkoutRequestCategory?.toString().toLowerCase()) ??
      defaultValue ??
      enums.ChangeWorkoutRequestCategory.swaggerGeneratedUnknown;
}

enums.ChangeWorkoutRequestCategory?
    changeWorkoutRequestCategoryNullableFromJson(
  Object? changeWorkoutRequestCategory, [
  enums.ChangeWorkoutRequestCategory? defaultValue,
]) {
  if (changeWorkoutRequestCategory == null) {
    return null;
  }
  return enums.ChangeWorkoutRequestCategory.values
          .firstWhereOrNull((e) => e.value == changeWorkoutRequestCategory) ??
      defaultValue;
}

List<String> changeWorkoutRequestCategoryListToJson(
    List<enums.ChangeWorkoutRequestCategory>? changeWorkoutRequestCategory) {
  if (changeWorkoutRequestCategory == null) {
    return [];
  }

  return changeWorkoutRequestCategory.map((e) => e.value!).toList();
}

List<enums.ChangeWorkoutRequestCategory>
    changeWorkoutRequestCategoryListFromJson(
  List? changeWorkoutRequestCategory, [
  List<enums.ChangeWorkoutRequestCategory>? defaultValue,
]) {
  if (changeWorkoutRequestCategory == null) {
    return defaultValue ?? [];
  }

  return changeWorkoutRequestCategory
      .map((e) => changeWorkoutRequestCategoryFromJson(e.toString()))
      .toList();
}

List<enums.ChangeWorkoutRequestCategory>?
    changeWorkoutRequestCategoryNullableListFromJson(
  List? changeWorkoutRequestCategory, [
  List<enums.ChangeWorkoutRequestCategory>? defaultValue,
]) {
  if (changeWorkoutRequestCategory == null) {
    return defaultValue;
  }

  return changeWorkoutRequestCategory
      .map((e) => changeWorkoutRequestCategoryFromJson(e.toString()))
      .toList();
}

String? changeWorkoutRequestDifficultyToJson(
    enums.ChangeWorkoutRequestDifficulty? changeWorkoutRequestDifficulty) {
  return changeWorkoutRequestDifficulty?.value;
}

enums.ChangeWorkoutRequestDifficulty changeWorkoutRequestDifficultyFromJson(
  Object? changeWorkoutRequestDifficulty, [
  enums.ChangeWorkoutRequestDifficulty? defaultValue,
]) {
  return enums.ChangeWorkoutRequestDifficulty.values.firstWhereOrNull((e) =>
          e.value.toString().toLowerCase() ==
          changeWorkoutRequestDifficulty?.toString().toLowerCase()) ??
      defaultValue ??
      enums.ChangeWorkoutRequestDifficulty.swaggerGeneratedUnknown;
}

enums.ChangeWorkoutRequestDifficulty?
    changeWorkoutRequestDifficultyNullableFromJson(
  Object? changeWorkoutRequestDifficulty, [
  enums.ChangeWorkoutRequestDifficulty? defaultValue,
]) {
  if (changeWorkoutRequestDifficulty == null) {
    return null;
  }
  return enums.ChangeWorkoutRequestDifficulty.values
          .firstWhereOrNull((e) => e.value == changeWorkoutRequestDifficulty) ??
      defaultValue;
}

List<String> changeWorkoutRequestDifficultyListToJson(
    List<enums.ChangeWorkoutRequestDifficulty>?
        changeWorkoutRequestDifficulty) {
  if (changeWorkoutRequestDifficulty == null) {
    return [];
  }

  return changeWorkoutRequestDifficulty.map((e) => e.value!).toList();
}

List<enums.ChangeWorkoutRequestDifficulty>
    changeWorkoutRequestDifficultyListFromJson(
  List? changeWorkoutRequestDifficulty, [
  List<enums.ChangeWorkoutRequestDifficulty>? defaultValue,
]) {
  if (changeWorkoutRequestDifficulty == null) {
    return defaultValue ?? [];
  }

  return changeWorkoutRequestDifficulty
      .map((e) => changeWorkoutRequestDifficultyFromJson(e.toString()))
      .toList();
}

List<enums.ChangeWorkoutRequestDifficulty>?
    changeWorkoutRequestDifficultyNullableListFromJson(
  List? changeWorkoutRequestDifficulty, [
  List<enums.ChangeWorkoutRequestDifficulty>? defaultValue,
]) {
  if (changeWorkoutRequestDifficulty == null) {
    return defaultValue;
  }

  return changeWorkoutRequestDifficulty
      .map((e) => changeWorkoutRequestDifficultyFromJson(e.toString()))
      .toList();
}

String? workoutResponseCategoryToJson(
    enums.WorkoutResponseCategory? workoutResponseCategory) {
  return workoutResponseCategory?.value;
}

enums.WorkoutResponseCategory workoutResponseCategoryFromJson(
  Object? workoutResponseCategory, [
  enums.WorkoutResponseCategory? defaultValue,
]) {
  return enums.WorkoutResponseCategory.values.firstWhereOrNull((e) =>
          e.value.toString().toLowerCase() ==
          workoutResponseCategory?.toString().toLowerCase()) ??
      defaultValue ??
      enums.WorkoutResponseCategory.swaggerGeneratedUnknown;
}

enums.WorkoutResponseCategory? workoutResponseCategoryNullableFromJson(
  Object? workoutResponseCategory, [
  enums.WorkoutResponseCategory? defaultValue,
]) {
  if (workoutResponseCategory == null) {
    return null;
  }
  return enums.WorkoutResponseCategory.values
          .firstWhereOrNull((e) => e.value == workoutResponseCategory) ??
      defaultValue;
}

List<String> workoutResponseCategoryListToJson(
    List<enums.WorkoutResponseCategory>? workoutResponseCategory) {
  if (workoutResponseCategory == null) {
    return [];
  }

  return workoutResponseCategory.map((e) => e.value!).toList();
}

List<enums.WorkoutResponseCategory> workoutResponseCategoryListFromJson(
  List? workoutResponseCategory, [
  List<enums.WorkoutResponseCategory>? defaultValue,
]) {
  if (workoutResponseCategory == null) {
    return defaultValue ?? [];
  }

  return workoutResponseCategory
      .map((e) => workoutResponseCategoryFromJson(e.toString()))
      .toList();
}

List<enums.WorkoutResponseCategory>?
    workoutResponseCategoryNullableListFromJson(
  List? workoutResponseCategory, [
  List<enums.WorkoutResponseCategory>? defaultValue,
]) {
  if (workoutResponseCategory == null) {
    return defaultValue;
  }

  return workoutResponseCategory
      .map((e) => workoutResponseCategoryFromJson(e.toString()))
      .toList();
}

String? workoutResponseDifficultyToJson(
    enums.WorkoutResponseDifficulty? workoutResponseDifficulty) {
  return workoutResponseDifficulty?.value;
}

enums.WorkoutResponseDifficulty workoutResponseDifficultyFromJson(
  Object? workoutResponseDifficulty, [
  enums.WorkoutResponseDifficulty? defaultValue,
]) {
  return enums.WorkoutResponseDifficulty.values.firstWhereOrNull((e) =>
          e.value.toString().toLowerCase() ==
          workoutResponseDifficulty?.toString().toLowerCase()) ??
      defaultValue ??
      enums.WorkoutResponseDifficulty.swaggerGeneratedUnknown;
}

enums.WorkoutResponseDifficulty? workoutResponseDifficultyNullableFromJson(
  Object? workoutResponseDifficulty, [
  enums.WorkoutResponseDifficulty? defaultValue,
]) {
  if (workoutResponseDifficulty == null) {
    return null;
  }
  return enums.WorkoutResponseDifficulty.values
          .firstWhereOrNull((e) => e.value == workoutResponseDifficulty) ??
      defaultValue;
}

List<String> workoutResponseDifficultyListToJson(
    List<enums.WorkoutResponseDifficulty>? workoutResponseDifficulty) {
  if (workoutResponseDifficulty == null) {
    return [];
  }

  return workoutResponseDifficulty.map((e) => e.value!).toList();
}

List<enums.WorkoutResponseDifficulty> workoutResponseDifficultyListFromJson(
  List? workoutResponseDifficulty, [
  List<enums.WorkoutResponseDifficulty>? defaultValue,
]) {
  if (workoutResponseDifficulty == null) {
    return defaultValue ?? [];
  }

  return workoutResponseDifficulty
      .map((e) => workoutResponseDifficultyFromJson(e.toString()))
      .toList();
}

List<enums.WorkoutResponseDifficulty>?
    workoutResponseDifficultyNullableListFromJson(
  List? workoutResponseDifficulty, [
  List<enums.WorkoutResponseDifficulty>? defaultValue,
]) {
  if (workoutResponseDifficulty == null) {
    return defaultValue;
  }

  return workoutResponseDifficulty
      .map((e) => workoutResponseDifficultyFromJson(e.toString()))
      .toList();
}

String? changeWorkoutStepRequestWorkoutTypeToJson(
    enums.ChangeWorkoutStepRequestWorkoutType?
        changeWorkoutStepRequestWorkoutType) {
  return changeWorkoutStepRequestWorkoutType?.value;
}

enums.ChangeWorkoutStepRequestWorkoutType
    changeWorkoutStepRequestWorkoutTypeFromJson(
  Object? changeWorkoutStepRequestWorkoutType, [
  enums.ChangeWorkoutStepRequestWorkoutType? defaultValue,
]) {
  return enums.ChangeWorkoutStepRequestWorkoutType.values.firstWhereOrNull(
          (e) =>
              e.value.toString().toLowerCase() ==
              changeWorkoutStepRequestWorkoutType?.toString().toLowerCase()) ??
      defaultValue ??
      enums.ChangeWorkoutStepRequestWorkoutType.swaggerGeneratedUnknown;
}

enums.ChangeWorkoutStepRequestWorkoutType?
    changeWorkoutStepRequestWorkoutTypeNullableFromJson(
  Object? changeWorkoutStepRequestWorkoutType, [
  enums.ChangeWorkoutStepRequestWorkoutType? defaultValue,
]) {
  if (changeWorkoutStepRequestWorkoutType == null) {
    return null;
  }
  return enums.ChangeWorkoutStepRequestWorkoutType.values.firstWhereOrNull(
          (e) => e.value == changeWorkoutStepRequestWorkoutType) ??
      defaultValue;
}

List<String> changeWorkoutStepRequestWorkoutTypeListToJson(
    List<enums.ChangeWorkoutStepRequestWorkoutType>?
        changeWorkoutStepRequestWorkoutType) {
  if (changeWorkoutStepRequestWorkoutType == null) {
    return [];
  }

  return changeWorkoutStepRequestWorkoutType.map((e) => e.value!).toList();
}

List<enums.ChangeWorkoutStepRequestWorkoutType>
    changeWorkoutStepRequestWorkoutTypeListFromJson(
  List? changeWorkoutStepRequestWorkoutType, [
  List<enums.ChangeWorkoutStepRequestWorkoutType>? defaultValue,
]) {
  if (changeWorkoutStepRequestWorkoutType == null) {
    return defaultValue ?? [];
  }

  return changeWorkoutStepRequestWorkoutType
      .map((e) => changeWorkoutStepRequestWorkoutTypeFromJson(e.toString()))
      .toList();
}

List<enums.ChangeWorkoutStepRequestWorkoutType>?
    changeWorkoutStepRequestWorkoutTypeNullableListFromJson(
  List? changeWorkoutStepRequestWorkoutType, [
  List<enums.ChangeWorkoutStepRequestWorkoutType>? defaultValue,
]) {
  if (changeWorkoutStepRequestWorkoutType == null) {
    return defaultValue;
  }

  return changeWorkoutStepRequestWorkoutType
      .map((e) => changeWorkoutStepRequestWorkoutTypeFromJson(e.toString()))
      .toList();
}

String? workoutStepResponseWorkoutTypeToJson(
    enums.WorkoutStepResponseWorkoutType? workoutStepResponseWorkoutType) {
  return workoutStepResponseWorkoutType?.value;
}

enums.WorkoutStepResponseWorkoutType workoutStepResponseWorkoutTypeFromJson(
  Object? workoutStepResponseWorkoutType, [
  enums.WorkoutStepResponseWorkoutType? defaultValue,
]) {
  return enums.WorkoutStepResponseWorkoutType.values.firstWhereOrNull((e) =>
          e.value.toString().toLowerCase() ==
          workoutStepResponseWorkoutType?.toString().toLowerCase()) ??
      defaultValue ??
      enums.WorkoutStepResponseWorkoutType.swaggerGeneratedUnknown;
}

enums.WorkoutStepResponseWorkoutType?
    workoutStepResponseWorkoutTypeNullableFromJson(
  Object? workoutStepResponseWorkoutType, [
  enums.WorkoutStepResponseWorkoutType? defaultValue,
]) {
  if (workoutStepResponseWorkoutType == null) {
    return null;
  }
  return enums.WorkoutStepResponseWorkoutType.values
          .firstWhereOrNull((e) => e.value == workoutStepResponseWorkoutType) ??
      defaultValue;
}

List<String> workoutStepResponseWorkoutTypeListToJson(
    List<enums.WorkoutStepResponseWorkoutType>?
        workoutStepResponseWorkoutType) {
  if (workoutStepResponseWorkoutType == null) {
    return [];
  }

  return workoutStepResponseWorkoutType.map((e) => e.value!).toList();
}

List<enums.WorkoutStepResponseWorkoutType>
    workoutStepResponseWorkoutTypeListFromJson(
  List? workoutStepResponseWorkoutType, [
  List<enums.WorkoutStepResponseWorkoutType>? defaultValue,
]) {
  if (workoutStepResponseWorkoutType == null) {
    return defaultValue ?? [];
  }

  return workoutStepResponseWorkoutType
      .map((e) => workoutStepResponseWorkoutTypeFromJson(e.toString()))
      .toList();
}

List<enums.WorkoutStepResponseWorkoutType>?
    workoutStepResponseWorkoutTypeNullableListFromJson(
  List? workoutStepResponseWorkoutType, [
  List<enums.WorkoutStepResponseWorkoutType>? defaultValue,
]) {
  if (workoutStepResponseWorkoutType == null) {
    return defaultValue;
  }

  return workoutStepResponseWorkoutType
      .map((e) => workoutStepResponseWorkoutTypeFromJson(e.toString()))
      .toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
