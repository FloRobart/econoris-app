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

### Android (recommande): valeurs a la compilation

Exemple:

```bash
flutter build apk --dart-define-from-file=.env
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
