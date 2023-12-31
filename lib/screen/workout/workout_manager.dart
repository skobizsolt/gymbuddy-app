import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddy/components/crud/form_category.dart';
import 'package:gymbuddy/components/custom_snackbars.dart';
import 'package:gymbuddy/components/inputs/default_text_form_field.dart';
import 'package:gymbuddy/components/inputs/multiline_text_form_field.dart';
import 'package:gymbuddy/global/global_variables.dart';
import 'package:gymbuddy/layout/input_layout.dart';
import 'package:gymbuddy/models/workout.dart';
import 'package:gymbuddy/models/workout/change_workout.dart';
import 'package:gymbuddy/providers/workout_provider.dart';
import 'package:gymbuddy/screen/workout/workout_details_screen.dart';
import 'package:gymbuddy/service/util/format_utils.dart';
import 'package:gymbuddy/service/util/keyboard_service.dart';
import 'package:gymbuddy/widgets/utils/information_tag.dart';
import 'package:gymbuddy/widgets/utils/save_icon.dart';

class WorkoutManager extends ConsumerStatefulWidget {
  WorkoutManager({super.key, required this.type, this.workout});

  final CrudType type;
  final Workout? workout;

  @override
  ConsumerState<WorkoutManager> createState() => _WorkoutManagerState();
}

class _WorkoutManagerState extends ConsumerState<WorkoutManager> {
  static const DAILY_LIMIT = 2;

  late ChangeWorkoutDto _workout = ChangeWorkoutDto(
    steps: [],
  );
  final _formkey = GlobalKey<FormState>();
  bool _isSaveButtonVisible = false;

  _saveForm() async {
    var isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formkey.currentState!.save();
    setState(() {
      _isSaveButtonVisible = true;
    });
    KeyboardService.closeKeyboard();
    await performOperation().whenComplete(
      () => setState(() {
        _isSaveButtonVisible = false;
      }),
    );
  }

  Future<void> performOperation() async {
    switch (widget.type) {
      case CrudType.add:
        try {
          await ref
              .read(workoutStateProvider.notifier)
              .createWorkout(_workout)
              .then((value) async {
            showSuccessSnackBar(context, "Workout ${value.title} created!");
            await Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetailsScreen(
                      workoutId: value.workoutId!,
                    ),
                  ),
                )
                .then((value) => Navigator.of(context).pop());
          });
        } on Exception {
          if (mounted) {
            showErrorSnackBar(context,
                "Failed to create this workout, please try again later!");
          }
        }
        break;
      case CrudType.edit:
        try {
          await ref
              .read(workoutStateProvider.notifier)
              .editWorkout(widget.workout!.workoutId, _workout)
              .then(
            (value) {
              showSuccessSnackBar(context, "Workout edited successfully!");
              Navigator.of(context).pop();
            },
          );
        } on Exception {
          if (mounted) {
            showErrorSnackBar(
                context, "Failed to save changes, please try again later!");
          }
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: KeyboardService.closeKeyboard,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${FormatUtils.toCapitalized(widget.type.name)} workout"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  _checkDailyLimit(context),
                  FormCategory(
                    title: "Basic information",
                    children: [
                      // Name of the workout
                      DefaultTextFormField(
                        initialValue: CrudType.edit == widget.type
                            ? widget.workout!.title
                            : null,
                        hintText: "Title",
                        onSaved: (value) => _workout.title = value!.trim(),
                      ),

                      // Details about the workout
                      MultiLineTextFormField(
                        initialValue: CrudType.edit == widget.type
                            ? widget.workout!.description
                            : null,
                        hintText: "Describe your workout",
                        maxLines: 30,
                        validator: (p0) => null,
                        onSaved: (value) => _workout.description =
                            value == null ? null : value.trim(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // Workout categorization
                  FormCategory(
                    title: "Categorize your workout",
                    children: [
                      // Workout category dropdown
                      _buildWorkoutCategoryList(),

                      // Workout difficulty dropdown
                      _buildWorkoutDifficulty(),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SaveButton(
          onPressed: _saveForm,
          isSaving: _isSaveButtonVisible,
        ),
      ),
    );
  }

  _buildWorkoutCategoryList() {
    return InputLayout(
      child: DropdownButtonFormField(
        items: WorkoutCategory.values
            .map(
              (e) => DropdownMenuItem(
                child: Text(
                    "${workoutCategoryIcon[e]} ${FormatUtils.toCapitalized(e.name)}"),
                value: e.name,
              ),
            )
            .toList(),
        value: CrudType.edit == widget.type
            ? widget.workout!.category.name
            : WorkoutCategory.values[0].name,
        onChanged: (value) =>
            _workout.category = WorkoutCategory.values.byName(value!),
        onSaved: (newValue) =>
            _workout.category = WorkoutCategory.values.byName(newValue!),
        decoration: const InputDecoration(border: InputBorder.none),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  _buildWorkoutDifficulty() {
    return InputLayout(
      child: DropdownButtonFormField(
        items: WorkoutDifficulty.values
            .map(
              (e) => DropdownMenuItem(
                child: Row(children: [
                  workoutDifficultyRating[e] as Widget,
                  const SizedBox(
                    width: 8,
                  ),
                  Text("${FormatUtils.toCapitalized(e.name)}")
                ]),
                value: e.name,
              ),
            )
            .toList(),
        value: CrudType.edit == widget.type
            ? widget.workout!.difficulty.name
            : WorkoutDifficulty.values[0].name,
        onChanged: (value) =>
            _workout.difficulty = WorkoutDifficulty.values.byName(value!),
        onSaved: (newValue) =>
            _workout.difficulty = WorkoutDifficulty.values.byName(newValue!),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  _checkDailyLimit(BuildContext context) {
    final createdToday = ref.watch(createdWorkoutsProvider);
    if (widget.type == CrudType.add && createdToday >= DAILY_LIMIT) {
      setState(() {
        _isSaveButtonVisible = true;
      });
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: InformationTag(
            child: Text(
              "You have reached the daily limit!\nThe limit was: $DAILY_LIMIT",
              textAlign: TextAlign.center,
              style: const TextStyle().copyWith(
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      );
    }
    return Container();
  }
}
