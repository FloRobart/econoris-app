import 'package:econoris_app/config/app_config.dart';
import 'package:econoris_app/ui/core/ui/widgets/base_app.dart';
import 'package:econoris_app/ui/profile/view_models/profile_screen_viewmodel.dart';
import 'package:econoris_app/ui/profile/widgets/logout_section.dart';
import 'package:econoris_app/ui/profile/widgets/overview_section.dart';
import 'package:econoris_app/ui/profile/widgets/status_section.dart';
import 'package:econoris_app/ui/profile/widgets/theme_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Écran de profil de l'application.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final viewModel = ref.read(profileScreenViewModelProvider);
    final currentUserAsync = ref.watch(profileCurrentUserProvider);

    return BaseApp(
      onRefresh: () async {
        ref.invalidate(profileCurrentUserProvider);
        await ref.read(profileCurrentUserProvider.future);
      },
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: currentUserAsync.when(
          data: (user) {
            viewModel.setUser = user;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Sélecteur de thème
                  const ThemeSection(),

                  const SizedBox(height: 12),

                  /// Header card with avatar and basic info
                  OverViewSection(
                    pseudo: viewModel.getUserPseudo,
                    email: viewModel.getUserEmail,
                    onPseudoChanged: viewModel.updatePseudo,
                  ),

                  const SizedBox(height: 12),

                  /// Account status section
                  StatusSection(
                    isConnected: viewModel.isUserConnected,
                    isEmailVerified: viewModel.isUserEmailVerified,
                    createdAt: viewModel.getUserCreatedAt,
                  ),

                  const SizedBox(height: 16),

                  /// Logout section
                  LogoutSection(
                    onLogout: viewModel.logout,
                    onLogoutAll: viewModel.logoutAll,
                  ),

                  const SizedBox(height: 16),

                  /// App version
                  Center(
                    child: Text(
                      'Version : ${AppConfig.appVersion}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),

                  const SizedBox(height: 36),
                ],
              ),
            );
          },

          loading: () {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Sélecteur de thème
                  const ThemeSection(),

                  const SizedBox(height: 12),
                  const Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          },

          error: (error, stackTrace) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Sélecteur de thème
                  const ThemeSection(),

                  const SizedBox(height: 12),

                  Center(
                    child: Text(
                      'Impossible de charger votre profil.',
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /* Kept without the profile: a session refused by the server must not keep
                     the user from logging out */
                  LogoutSection(
                    onLogout: viewModel.logout,
                    onLogoutAll: viewModel.logoutAll,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
