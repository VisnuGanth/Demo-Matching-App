# demo_matching_apps

A flutter application to showcase a few of the front-end pages made using Dart for a job search and networking application.

**Note:**
- This repository has been made strictly for demonstration purposes. So, end cases like field validation are not implemented. Although a language switch to Japanese functionality is present, the option to switch has not been provided.

The first registration page [ind_profile_1.dart](https://github.com/VisnuGanth/Demo-Matching-App/blob/master/lib/ind_profile_1.dart) has a set of fields for user registration and a **field switch** implemented using a toggle button which swaps the current set of fields to a new set designed for students. This page also has **dynamic field addition** for the user to enter multiple sets of data.

The [app_localization.dart](https://github.com/VisnuGanth/Demo-Matching-App/blob/master/lib/locale/app_localization.dart) file has the code required to map the text in the app to a key required for translation. The [l10n folder](https://github.com/VisnuGanth/Demo-Matching-App/tree/master/lib/l10n) has the files that have the translations required for the English text in the app.

[ind_profile_view.dart](https://github.com/VisnuGanth/Demo-Matching-App/blob/master/lib/ind_profile_view.dart) and [ind_profile_view_1.dart](https://github.com/VisnuGanth/Demo-Matching-App/blob/master/lib/ind_profile_view_1.dart) pages are the profile pages of a user where the data can be edited. The accordion tabs in it have been made using a custom Exapansion Tile widget which is the [custom_expansion_tile.dart](https://github.com/VisnuGanth/Demo-Matching-App/blob/master/lib/custom_expansion_tile.dartcustom_expansion_tile.dart).
