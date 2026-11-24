# Publication Android d'Econoris

Ce guide décrit ce qu'il faut faire **une seule fois** pour publier Econoris sur les GitHub Releases, F-Droid et plus tard Google Play. Ensuite, chaque version finale (merge sur `main`) est publiée partout sans action manuelle.

Le fonctionnement de la CI est décrit dans [github-ci → flutter/README.md → Android](https://github.com/FloRobart/github-ci/blob/main/flutter/README.md#android).

## Ce que fait la CI à chaque version finale

1. Elle construit l'APK dans l'image du serveur de build de F-Droid, dans le même dossier que F-Droid (`/home/vagrant/build/fr.econoris.app`), avec le Flutter du `pubspec.yaml`.
2. Elle le signe avec ta clé et l'attache à la GitHub Release : `econoris-app-vX.Y.Z.apk`.
3. Elle envoie l'AAB sur Google Play, si le secret `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON` existe.

F-Droid ne reçoit rien de la CI. Son robot voit le nouveau tag `vX.Y.Z`, recompile l'application depuis le code source, la compare à l'APK de la GitHub Release, et publie **cet APK, signé avec ta clé**, s'ils sont identiques. La même application, avec la même signature, est donc installée depuis GitHub, F-Droid et plus tard Google Play.

| Ce que tu configures | Effet |
|---|---|
| Rien | APK signé avec la clé de debug sur la GitHub Release : installable, refusé par les stores et par F-Droid |
| Les 4 secrets `ANDROID_*` ([étape 1](#1-créer-la-clé-de-signature)) | APK signé avec ta clé sur la GitHub Release, et AAB signé |
| Le secret `F_DROID_ENABLE` = `true` ([étape 3](#3-inscrire-econoris-sur-f-droid)) | Clé de signature obligatoire, et vérification que F-Droid reconstruit le même APK. Une fois l'application inscrite sur F-Droid, chaque version finale y arrive quelques jours après sa GitHub Release |
| Le secret `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON` ([étape 4](#4-google-play-plus-tard)) | Clé de signature obligatoire, et chaque version finale est envoyée sur Google Play |

Si `F_DROID_ENABLE` vaut `true` ou si `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON` existe sans les 4 secrets `ANDROID_*`, la CI s'arrête avec une erreur avant de publier quoi que ce soit. `F_DROID_ENABLE` à `false` revient à ne pas avoir le secret.

Les release candidates (`vX.Y.Z-rc.N`) ne vont que sur les pre-releases GitHub, jamais sur F-Droid ni Google Play.

## 1. Créer la clé de signature

À faire une seule fois, sur ton poste, **hors du dossier du dépôt**.

```bash
keytool -genkeypair -v -keystore release-keystore.jks -storetype PKCS12 -keyalg RSA -keysize 4096 -validity 10000 -alias release
```

`keytool` demande un mot de passe (le même sert au keystore et à la clé) et un nom : `Floris Robart` suffit, le reste peut rester vide.

**Sauvegarde `release-keystore.jks` et son mot de passe** dans ton gestionnaire de mots de passe (KeePass), avec une copie hors ligne. Android refuse toute mise à jour signée avec une autre clé : si tu la perds, plus aucune mise à jour n'est possible, ni sur GitHub ni sur F-Droid, sauf à changer d'`applicationId` et à faire réinstaller l'application à tout le monde.

Enregistre ensuite les quatre secrets dans le dépôt `econoris-app`, sur GitHub : Settings → Secrets and variables → Actions → New repository secret.

| Secret | Valeur |
|---|---|
| `ANDROID_KEYSTORE_BASE64` | La sortie de `base64 --wrap=0 release-keystore.jks` |
| `ANDROID_KEYSTORE_PASSWORD` | Le mot de passe |
| `ANDROID_KEY_ALIAS` | `release` |
| `ANDROID_KEY_PASSWORD` | Le même mot de passe |

Ou avec la CLI GitHub, qui demande chaque mot de passe sans l'écrire dans l'historique du terminal :

```bash
base64 --wrap=0 release-keystore.jks | gh secret set ANDROID_KEYSTORE_BASE64 --repo FloRobart/econoris-app
gh secret set ANDROID_KEYSTORE_PASSWORD --repo FloRobart/econoris-app
gh secret set ANDROID_KEY_ALIAS --repo FloRobart/econoris-app --body release
gh secret set ANDROID_KEY_PASSWORD --repo FloRobart/econoris-app
```

L'empreinte SHA-256 du certificat, demandée par F-Droid, s'obtient ainsi. Elle est aussi affichée dans le résumé du job Android de chaque release :

```bash
keytool -list -v -keystore release-keystore.jks -alias release | sed -n 's/^.*SHA256: //p' | tr -d ':' | tr 'A-F' 'a-f'
```

## 2. Publier une première version finale signée

1. Pousser les modifications de [github-ci](https://github.com/FloRobart/github-ci) jusqu'à sa branche `main` : le `ci.yml` d'Econoris appelle `auto.yml@main`.
2. Pousser les modifications d'`econoris-app` (signature Gradle, URLs de production, fiche `fastlane/`) jusqu'à `dev`, par une pull request.
3. Onglet **Actions** → **CI** → **Run workflow** sur `dev` : la CI crée la release candidate et la branche `release/vX.Y.Z`, avec `version: X.Y.Z+<versionCode>` écrit dans le `pubspec.yaml`. Installer son APK pour vérifier que l'application se connecte bien aux serveurs.
4. Merger la pull request `release/vX.Y.Z` → `main` : la CI publie la version finale, avec `econoris-app-vX.Y.Z.apk` signé.
5. Dans le résumé du run, le job **Android** affiche l'empreinte SHA-256 du certificat : vérifier qu'elle est identique à celle de l'étape 1.

Les personnes qui ont installé une ancienne version (signée avec la clé de debug) doivent la **désinstaller une fois** : Android refuse la mise à jour vers une autre signature. Leurs données sont sur le serveur, elles se reconnectent simplement.

Le `versionCode` vaut `X × 1 000 000 + Y × 1 000 + Z` : `4.1.0` donne `4001000`.

## 3. Inscrire Econoris sur F-Droid

À faire une seule fois, après l'étape 2. Ensuite, chaque version finale arrive sur F-Droid toute seule.

### 3.0 Activer F-Droid dans la CI

```bash
gh secret set F_DROID_ENABLE --repo FloRobart/econoris-app --body true
```

À chaque release, la CI vérifie alors que la clé de signature existe, et que F-Droid reconstruira exactement le même APK. Sinon, elle s'arrête avant de publier. Le résumé du run indique « APK reproductible » quand tout va bien.

Ce secret ne retire pas l'application de F-Droid une fois qu'elle y est inscrite : c'est sa recette dans fdroiddata (ci-dessous) qui fait suivre les tags. Pour la retirer, il faut une merge request dans fdroiddata.

### 3.1 Créer le compte et le fork

1. Créer un compte sur [gitlab.com](https://gitlab.com/users/sign_up), et activer la double authentification. GitLab peut demander une vérification (téléphone ou carte bancaire, sans débit) avant de lancer la CI d'un fork.
2. Forker [fdroid/fdroiddata](https://gitlab.com/fdroid/fdroiddata) : bouton **Fork**, dans ton espace personnel.
3. Cloner le fork et créer la branche :

```bash
git clone --depth=1 https://gitlab.com/<ton-compte-gitlab>/fdroiddata.git ~/fdroiddata
```

```bash
cd ~/fdroiddata && git checkout -b fr.econoris.app
```

### 3.2 Écrire la recette

Créer `~/fdroiddata/metadata/fr.econoris.app.yml`, puis remplacer les quatre valeurs en `<…>` par celles de la version finale de l'étape 2 :

| Valeur | Où la trouver |
|---|---|
| `<X.Y.Z>` | La version finale, sans le `v` |
| `<versionCode>` | `X × 1 000 000 + Y × 1 000 + Z`, ou la ligne `version:` du `pubspec.yaml` du tag : `git show vX.Y.Z:pubspec.yaml \| grep '^version:'` |
| `<hash du commit>` | `git rev-list -n 1 vX.Y.Z`, dans `econoris-app` après `git fetch --tags` (le hash complet : F-Droid refuse un nom de tag) |
| `<empreinte SHA-256>` | L'empreinte de l'étape 1, en minuscules, sans `:` |

```yaml
AntiFeatures:
  TetheredNet:
    en-US: The app only works with the servers of its developer (api.econoris.fr and api.floraccess.florobart.fr), whose address cannot be changed in the app.
    fr-FR: L'application ne fonctionne qu'avec les serveurs de son développeur (api.econoris.fr et api.floraccess.florobart.fr), dont l'adresse ne peut pas être changée dans l'application.
Categories:
  - Finance Manager
License: GPL-3.0-only
AuthorName: Floris Robart
AuthorWebSite: https://florobart.fr
WebSite: https://econoris.fr
SourceCode: https://github.com/FloRobart/econoris-app
IssueTracker: https://github.com/FloRobart/econoris-app/issues
Changelog: https://github.com/FloRobart/econoris-app/releases

AutoName: Econoris

RepoType: git
Repo: https://github.com/FloRobart/econoris-app.git
Binaries: https://github.com/FloRobart/econoris-app/releases/download/v%v/econoris-app-v%v.apk

Builds:
  - versionName: <X.Y.Z>
    versionCode: <versionCode>
    commit: <hash du commit>
    output: build/app/outputs/flutter-apk/app-release.apk
    srclibs:
      - flutter@stable
    prebuild:
      - flutterVersion=$(sed -n -E 's/^ +flutter:[ "]*([0-9]+[.][0-9]+[.][0-9]+).*/\1/p' pubspec.yaml)
      - '[[ $flutterVersion ]]'
      - git -C $$flutter$$ checkout -f $flutterVersion
      - export PUB_CACHE=$(pwd)/.pub-cache
      - $$flutter$$/bin/flutter config --no-analytics
      - $$flutter$$/bin/flutter pub get --enforce-lockfile
    scandelete:
      - .pub-cache
    build:
      - export PUB_CACHE=$(pwd)/.pub-cache
      - $$flutter$$/bin/flutter build apk --release

AllowedAPKSigningKeys: <empreinte SHA-256>

AutoUpdateMode: Version
UpdateCheckMode: Tags ^v[0-9]+\.[0-9]+\.[0-9]+$
UpdateCheckData: pubspec.yaml|version:\s.+\+(\d+)|.|version:\s(.+)\+
CurrentVersion: <X.Y.Z>
CurrentVersionCode: <versionCode>
```

Ce que font les lignes importantes :

- **`Binaries` et `AllowedAPKSigningKeys`** : F-Droid télécharge `econoris-app-vX.Y.Z.apk` de la GitHub Release, vérifie qu'il est signé avec ta clé et identique à son propre build, puis publie ton APK. S'ils diffèrent, cette version n'est pas publiée sur F-Droid.
- **`prebuild` et `build`** : les mêmes étapes que la CI. La version de Flutter est lue dans le `pubspec.yaml` : changer de Flutter dans le projet suffit, la recette suit.
- **`AutoUpdateMode`, `UpdateCheckMode` et `UpdateCheckData`** : chaque jour, le robot de F-Droid cherche un nouveau tag `vX.Y.Z` (les release candidates sont ignorées), lit la version et le `versionCode` dans son `pubspec.yaml`, et ajoute la version à la recette tout seul.
- **`AntiFeatures: TetheredNet`** : F-Droid signale les applications liées aux serveurs de leur développeur, quand leur adresse ne peut pas être changée. Les relecteurs l'ajouteraient de toute façon ; l'indiquer d'emblée accélère la relecture. Les deux serveurs sont libres (GPL-3.0), ce n'est donc pas `NonFreeNet`.
- **`License`** : `GPL-3.0-only`, puisque les sources ne disent pas « ou toute version ultérieure ». Si tu veux autoriser les versions ultérieures, l'écrire dans le README et mettre `GPL-3.0-or-later`.

La fiche (titre, descriptions, icône, captures d'écran) est lue dans `fastlane/metadata/android/` du dépôt `econoris-app` : rien à mettre dans la recette.

### 3.3 Tester la recette (facultatif)

La CI du fork GitLab teste la recette dès que la branche est poussée ([3.4](#34-ouvrir-la-merge-request)). Pour tester avant, en local, avec Docker :

```bash
git clone --depth=1 https://gitlab.com/fdroid/fdroidserver ~/fdroidserver
```

```bash
docker run --rm -itu vagrant --entrypoint /bin/bash -v ~/fdroiddata:/build:z -v ~/fdroidserver:/home/vagrant/fdroidserver:Z registry.gitlab.com/fdroid/fdroidserver:buildserver-trixie
```

Puis, dans le conteneur :

```bash
. /etc/profile
export PATH="$fdroidserver:$PATH" PYTHONPATH="$fdroidserver"
export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | awk -F'=' '{print $2}' | tr -d ' ')
cd /build
fdroid readmeta
fdroid rewritemeta fr.econoris.app
fdroid lint fr.econoris.app
fdroid build --verbose fr.econoris.app
```

`fdroid rewritemeta` remet en forme le fichier : garder sa version. `fdroid build` compile l'application, puis, grâce à `Binaries`, télécharge l'APK de la GitHub Release et le compare à son build. Le message `compared built binary to supplied reference binary successfully` confirme que F-Droid publiera ton APK.

### 3.4 Ouvrir la merge request

```bash
cd ~/fdroiddata && git add metadata/fr.econoris.app.yml && git commit -m "New App: fr.econoris.app"
```

```bash
git push origin fr.econoris.app
```

Sur GitLab, ouvrir une merge request de la branche `fr.econoris.app` de ton fork vers `master` de `fdroid/fdroiddata`, intitulée `New App: fr.econoris.app`. Cocher les points du modèle qui s'appliquent : licence libre, auteur prévenu (c'est toi), fiche fastlane dans le dépôt, pipelines au vert.

Les relecteurs sont bénévoles : la relecture peut prendre de quelques jours à quelques semaines. Répondre à leurs questions sur la merge request. Ils peuvent demander par exemple si FlorAccess est libre : lien vers [floraccess-api](https://github.com/FloRobart/floraccess-api).

### 3.5 Après le merge

- La première version apparaît sur [f-droid.org/packages/fr.econoris.app](https://f-droid.org/packages/fr.econoris.app/) en général sous quelques jours.
- Les versions finales suivantes y arrivent seules, quelques jours après leur GitHub Release. Rien à faire de ton côté.
- Un build en échec est visible sur [monitor.f-droid.org](https://monitor.f-droid.org/builds) : un APK non identique, une version de Flutter introuvable…
- Une fois l'application publiée, ajouter le lien F-Droid sur le site vitrine (`econoris-vitrine/src/config/site.ts`).

## 4. Google Play (plus tard)

1. Créer un compte développeur sur la [Play Console](https://play.google.com/console) (25 $, une fois). Un compte personnel récent doit faire passer un test fermé à au moins 12 testeurs pendant 14 jours avant d'accéder à la production : mettre `google-play-track: alpha` dans le `ci.yml` pendant ce temps.
2. Créer l'application `fr.econoris.app`. À la configuration de **Play App Signing**, choisir **d'importer ta propre clé** (exporter et importer une clé depuis un Java KeyStore, avec l'outil PEPK que fournit la Play Console) et lui donner `release-keystore.jks`. Sinon, Google signe l'application avec sa propre clé, et personne ne pourra passer de Google Play à F-Droid ou à GitHub sans désinstaller. **Ce choix est définitif.**
3. Envoyer à la main l'AAB `econoris-app-vX.Y.Z.aab` de la dernière GitHub Release finale : l'API de Google Play ne met à jour qu'une application qui existe déjà.
4. Dans [Google Cloud](https://console.cloud.google.com) : activer l'API **Google Play Android Developer**, créer un **compte de service**, puis une **clé JSON**.
5. Play Console → **Utilisateurs et autorisations** → **Inviter un utilisateur** → l'adresse du compte de service, avec les droits de publication sur Econoris.
6. Enregistrer tout le contenu du fichier JSON dans le secret `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON` du dépôt, puis supprimer le fichier :

```bash
gh secret set GOOGLE_PLAY_SERVICE_ACCOUNT_JSON --repo FloRobart/econoris-app < cle-compte-de-service.json
```

À partir de là, chaque version finale part aussi sur Google Play, après validation par Google.

## Bon à savoir

- **Version de Flutter** : `environment: flutter:` du `pubspec.yaml`. La CI comme F-Droid l'utilisent : la changer (avec le `pubspec.lock` qui va avec) suffit.
- **URLs des serveurs** : la release Android utilise les valeurs de production de `lib/config/app_config.dart`. F-Droid recompile ce code : une URL changée ailleurs que dans ce fichier n'arriverait pas sur F-Droid.
- **`android/app/build.gradle.kts`** : garder la signature avec la clé de debug à défaut (F-Droid n'a pas ta clé) et `dependenciesInfo { includeInApk = false }` (F-Droid refuse le bloc de dépendances chiffré pour Google).
- **Nouvelles notes de version sur F-Droid** (facultatif) : un fichier `fastlane/metadata/android/fr-FR/changelogs/<versionCode>.txt` (500 caractères au plus), commité avant le tag.
