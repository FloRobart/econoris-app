# Econoris

Econoris est une application mobile de gestion de budget personnel.

## Configuration des environnements

L'application charge la configuration dans cet ordre de priorite:

1. Fichier `.env` optionnel servi au runtime chargé par `flutter_dotenv`
2. Valeurs de compilation via `--dart-define`
3. Valeurs de fallback dans le code

Variables supportees:

- `APP_NAME`
- `AUTH_URL`
- `DATA_URL`
- `LOCALIZATION`

### Android : valeurs de production dans le code

La release Android est construite sans `--dart-define`, par la CI comme par F-Droid,
qui la recompile depuis le code source. Les valeurs de fallback de
`lib/config/app_config.dart` sont donc celles de la production.

Pour viser les services locaux depuis un téléphone ou un émulateur :

```bash
flutter run --dart-define-from-file=.env
```

### Web: override au runtime via `.env`

1. Copier `.env.example` vers `.env`
2. Modifier les valeurs selon l'environnement cible
3. Build/deployer l'app web normalement

Le fichier `.env` est lu au demarrage (requete sur `/assets/.env`) et permet de
changer les URLs sans recompiler le code Dart.

En production, le navigateur ne peut appeler que les adresses listees dans le
`connect-src` de `nginx.conf`. Une nouvelle adresse doit donc aussi y etre ajoutee,
puis publiee avec une nouvelle image. En local, `http://localhost` est toujours autorise.

## Publication Android

La CI publie l'APK signé sur les GitHub Releases, puis Google Play si ses secrets
existent. F-Droid reprend ce même APK tout seul, une fois l'application inscrite.
Les étapes à faire une seule fois, et les commandes, sont dans [PUBLICATION.md](PUBLICATION.md).

La fiche de l'application (textes, icône, captures d'écran) est dans
`fastlane/metadata/android/`, où F-Droid la lit.
