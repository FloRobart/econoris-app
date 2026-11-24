import 'package:econoris_app/config/assets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Centralizes authentication endpoints used by the application.
abstract class CompiledAppConfig {
  /*
   * Production values: the Android release is built without any --dart-define, by the CI as by
   * F-Droid, which rebuilds it from the source code. A local build targets the local services
   * with `--dart-define-from-file=.env`, and the web image with the `.env` file it serves.
   */
  static const String fallbackAppName = 'Econoris';
  static const String fallbackAuthUrl = 'https://api.floraccess.florobart.fr';
  static const String fallbackDataUrl = 'https://api.econoris.fr';
  static const String fallbackLocalization = 'fr_FR';

  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: fallbackAppName,
  );
  static const String authUrl = String.fromEnvironment(
    'AUTH_URL',
    defaultValue: fallbackAuthUrl,
  );
  static const String dataUrl = String.fromEnvironment(
    'DATA_URL',
    defaultValue: fallbackDataUrl,
  );
  static const String localization = String.fromEnvironment(
    'LOCALIZATION',
    defaultValue: fallbackLocalization,
  );
}

/// Configuration globale de l'application, chargée à partir du fichier .env.
class AppConfig {
  static late final String appName;
  static late final String dataUrl;
  static late final String authUrl;
  static late final String localization;
  static String appVersion = 'Inconnu';
  static late final String currency;

  /// Charge les variables de configuration dans cet ordre de priorité :
  /// 1) fichier `.env` optionnel servi à runtime et chargé par flutter_dotenv
  /// 2) valeurs passées à la compilation avec `--dart-define`
  /// 3) valeurs de fallback codées en dur
  static Future<void> load() async {
    final overrides = await _loadRuntimeOverrides();

    appName = _resolveConfigValue(
      key: 'APP_NAME',
      compileTimeValue: CompiledAppConfig.appName,
      overrides: overrides,
    );
    authUrl = _resolveConfigValue(
      key: 'AUTH_URL',
      compileTimeValue: CompiledAppConfig.authUrl,
      overrides: overrides,
    );
    dataUrl = _resolveConfigValue(
      key: 'DATA_URL',
      compileTimeValue: CompiledAppConfig.dataUrl,
      overrides: overrides,
    );
    localization = _resolveConfigValue(
      key: 'LOCALIZATION',
      compileTimeValue: CompiledAppConfig.localization,
      overrides: overrides,
    );

    currency = localization.contains('fr') ? '€' : '\$';

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      appVersion = '${packageInfo.version}+${packageInfo.buildNumber}';
    } catch (e) {
      debugPrint('Erreur lors du chargement des informations de version: $e');
    }
  }

  /// Charge les variables de configuration à partir de différentes sources au runtime.
  static Future<Map<String, String>> _loadRuntimeOverrides() async {
    final overrides = <String, String>{};

    try {
      await dotenv.load(fileName: Assets.webDotEnvPath, isOptional: true);
      overrides.addAll(dotenv.env);
    } catch (e) {
      debugPrint('Erreur lors du chargement du fichier .env: $e');
    }

    return overrides;
  }

  /// Résout la valeur de configuration finale en respectant l'ordre de priorité.
  static String _resolveConfigValue({
    required String key,
    required String compileTimeValue,
    required Map<String, String> overrides,
  }) {
    final runtimeValue = overrides[key]?.trim();
    if (runtimeValue != null && runtimeValue.isNotEmpty) {
      return runtimeValue;
    }
    return compileTimeValue;
  }
}
