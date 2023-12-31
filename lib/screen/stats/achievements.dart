import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddy/providers/workout_runner_provider.dart';
import 'package:gymbuddy/screen/stats/chart_widgets.dart';
import 'package:gymbuddy/screen/stats/last_session_widget.dart';
import 'package:gymbuddy/widgets/utils/no_content_text.dart';
import 'package:gymbuddy/widgets/utils/waiting_spinner_widget.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsRef = ref.watch(activityByUserProvider);

    return sessionsRef.when(
      data: (sessions) {
        if (sessions.isEmpty) {
          return const NoContentText(title: "No telemetry found yet!");
        }
        return RefreshIndicator(
          onRefresh: () async => ref.refresh(activityByUserProvider),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                LastSessionWidget(
                  data: sessions.first,
                ),
                AchievementCharts(data: sessions),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: NoContentText(title: "Couldn't load your achievements 💔"),
      ),
      loading: () => const Center(
        child: WaitingSpinner(title: "Loading sessions telemetry..."),
      ),
    );
  }
}
