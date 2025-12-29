import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('it')];

  /// No description provided for @error.
  ///
  /// In it, this message translates to:
  /// **'Errore'**
  String get error;

  /// No description provided for @error_message.
  ///
  /// In it, this message translates to:
  /// **'Si è verificato un errore durante il caricamento'**
  String get error_message;

  /// No description provided for @error_message_retry.
  ///
  /// In it, this message translates to:
  /// **'Si è verificato un errore durante il caricamento. Riprova più tardi'**
  String get error_message_retry;

  /// No description provided for @retry.
  ///
  /// In it, this message translates to:
  /// **'Riprova'**
  String get retry;

  /// No description provided for @back.
  ///
  /// In it, this message translates to:
  /// **'Indietro'**
  String get back;

  /// No description provided for @loading.
  ///
  /// In it, this message translates to:
  /// **'Caricamento'**
  String get loading;

  /// No description provided for @details.
  ///
  /// In it, this message translates to:
  /// **'Dettagli'**
  String get details;

  /// No description provided for @pages_number.
  ///
  /// In it, this message translates to:
  /// **'{number} pagine d\'approfondire'**
  String pages_number(Object number);

  /// No description provided for @january.
  ///
  /// In it, this message translates to:
  /// **'Gennaio'**
  String get january;

  /// No description provided for @february.
  ///
  /// In it, this message translates to:
  /// **'Febbraio'**
  String get february;

  /// No description provided for @march.
  ///
  /// In it, this message translates to:
  /// **'Marzo'**
  String get march;

  /// No description provided for @april.
  ///
  /// In it, this message translates to:
  /// **'Aprile'**
  String get april;

  /// No description provided for @may.
  ///
  /// In it, this message translates to:
  /// **'Maggio'**
  String get may;

  /// No description provided for @june.
  ///
  /// In it, this message translates to:
  /// **'Giugno'**
  String get june;

  /// No description provided for @july.
  ///
  /// In it, this message translates to:
  /// **'Luglio'**
  String get july;

  /// No description provided for @august.
  ///
  /// In it, this message translates to:
  /// **'Agosto'**
  String get august;

  /// No description provided for @september.
  ///
  /// In it, this message translates to:
  /// **'Settembre'**
  String get september;

  /// No description provided for @october.
  ///
  /// In it, this message translates to:
  /// **'Ottobre'**
  String get october;

  /// No description provided for @november.
  ///
  /// In it, this message translates to:
  /// **'Novembre'**
  String get november;

  /// No description provided for @december.
  ///
  /// In it, this message translates to:
  /// **'Dicembre'**
  String get december;

  /// No description provided for @logout.
  ///
  /// In it, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @profile.
  ///
  /// In it, this message translates to:
  /// **'Profilo'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In it, this message translates to:
  /// **'Impostazioni'**
  String get settings;

  /// No description provided for @contact_us.
  ///
  /// In it, this message translates to:
  /// **'Contattaci'**
  String get contact_us;

  /// No description provided for @error_opening_email.
  ///
  /// In it, this message translates to:
  /// **'Si è verificato un errore durante l\'apertura dell\'email'**
  String get error_opening_email;

  /// No description provided for @register_now.
  ///
  /// In it, this message translates to:
  /// **'Registrati ora'**
  String get register_now;

  /// No description provided for @tracking_permission_title.
  ///
  /// In it, this message translates to:
  /// **'Supporta l\'App'**
  String get tracking_permission_title;

  /// No description provided for @tracking_permission_message.
  ///
  /// In it, this message translates to:
  /// **'Per migliorare la tua esperienza e mostrarti contenuti più rilevanti, aiutaci a mantenere gratuita l\'app.\n\nClicca su Allow per supportarci.'**
  String get tracking_permission_message;

  /// No description provided for @tracking_permission_next.
  ///
  /// In it, this message translates to:
  /// **'Avanti'**
  String get tracking_permission_next;

  /// No description provided for @skip.
  ///
  /// In it, this message translates to:
  /// **'Salta'**
  String get skip;

  /// No description provided for @done.
  ///
  /// In it, this message translates to:
  /// **'Fatto'**
  String get done;

  /// No description provided for @next.
  ///
  /// In it, this message translates to:
  /// **'Avanti'**
  String get next;

  /// No description provided for @joinCommunityTitle.
  ///
  /// In it, this message translates to:
  /// **'Unisciti alla nostra Community!'**
  String get joinCommunityTitle;

  /// No description provided for @joinCommunityDescription.
  ///
  /// In it, this message translates to:
  /// **'Scopri i vantaggi di entrare nella community Telegram:'**
  String get joinCommunityDescription;

  /// No description provided for @benefitSupportMembers.
  ///
  /// In it, this message translates to:
  /// **'Supporto dai membri'**
  String get benefitSupportMembers;

  /// No description provided for @benefitSuggestFeatures.
  ///
  /// In it, this message translates to:
  /// **'Proponi nuove funzionalità'**
  String get benefitSuggestFeatures;

  /// No description provided for @benefitContactDevelopers.
  ///
  /// In it, this message translates to:
  /// **'Contatto con gli sviluppatori'**
  String get benefitContactDevelopers;

  /// No description provided for @benefitActiveCommunity.
  ///
  /// In it, this message translates to:
  /// **'Community attiva'**
  String get benefitActiveCommunity;

  /// No description provided for @joinNowButton.
  ///
  /// In it, this message translates to:
  /// **'Unisciti ora!'**
  String get joinNowButton;

  /// No description provided for @laterButton.
  ///
  /// In it, this message translates to:
  /// **'Più tardi'**
  String get laterButton;

  /// No description provided for @errorOpenTelegram.
  ///
  /// In it, this message translates to:
  /// **'Errore durante l\'apertura di Telegram'**
  String get errorOpenTelegram;

  /// No description provided for @repeatersMapTitle.
  ///
  /// In it, this message translates to:
  /// **'Mappa ripetitori'**
  String get repeatersMapTitle;

  /// No description provided for @repeatersListTitle.
  ///
  /// In it, this message translates to:
  /// **'Lista ripetitori'**
  String get repeatersListTitle;

  /// No description provided for @repeatersMapLoading.
  ///
  /// In it, this message translates to:
  /// **'Caricamento mappa dei ripetitori…'**
  String get repeatersMapLoading;

  /// No description provided for @repeatersMapGenericError.
  ///
  /// In it, this message translates to:
  /// **'Impossibile caricare i ripetitori.'**
  String get repeatersMapGenericError;

  /// No description provided for @repeatersMapEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessun ripetitore trovato vicino a te.'**
  String get repeatersMapEmpty;

  /// No description provided for @repeatersSearchHint.
  ///
  /// In it, this message translates to:
  /// **'Cerca ripetitori…'**
  String get repeatersSearchHint;

  /// No description provided for @repeatersSearchEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessun ripetitore trovato.'**
  String get repeatersSearchEmpty;

  /// No description provided for @repeatersMapRetry.
  ///
  /// In it, this message translates to:
  /// **'Riprova'**
  String get repeatersMapRetry;

  /// No description provided for @repeatersMapOpenSettings.
  ///
  /// In it, this message translates to:
  /// **'Apri impostazioni'**
  String get repeatersMapOpenSettings;

  /// No description provided for @repeatersMapPermissionMessage.
  ///
  /// In it, this message translates to:
  /// **'Consenti l\'accesso alla posizione per mostrare i ripetitori vicino a te.'**
  String get repeatersMapPermissionMessage;

  /// No description provided for @repeatersMapPermissionPermanentlyDenied.
  ///
  /// In it, this message translates to:
  /// **'Permesso posizione negato in modo permanente. Abilitalo dalle impostazioni di sistema.'**
  String get repeatersMapPermissionPermanentlyDenied;

  /// No description provided for @repeatersMapLocationServicesDisabled.
  ///
  /// In it, this message translates to:
  /// **'Attiva i servizi di localizzazione per trovare i ripetitori vicini.'**
  String get repeatersMapLocationServicesDisabled;

  /// No description provided for @repeatersMapFound.
  ///
  /// In it, this message translates to:
  /// **'{count} ripetitori trovati'**
  String repeatersMapFound(int count);

  /// No description provided for @repeaterMode.
  ///
  /// In it, this message translates to:
  /// **'Modalità'**
  String get repeaterMode;

  /// No description provided for @repeaterModeAnalog.
  ///
  /// In it, this message translates to:
  /// **'Analog'**
  String get repeaterModeAnalog;

  /// No description provided for @repeaterModeC4fm.
  ///
  /// In it, this message translates to:
  /// **'C4FM'**
  String get repeaterModeC4fm;

  /// No description provided for @repeaterModeDstar.
  ///
  /// In it, this message translates to:
  /// **'D-STAR'**
  String get repeaterModeDstar;

  /// No description provided for @repeaterModeDmr.
  ///
  /// In it, this message translates to:
  /// **'DMR'**
  String get repeaterModeDmr;

  /// No description provided for @repeaterModeAllmode.
  ///
  /// In it, this message translates to:
  /// **'ALLMODE'**
  String get repeaterModeAllmode;

  /// No description provided for @repeaterModeEcholink.
  ///
  /// In it, this message translates to:
  /// **'Echolink'**
  String get repeaterModeEcholink;

  /// No description provided for @repeaterModeWinlink.
  ///
  /// In it, this message translates to:
  /// **'Winlink'**
  String get repeaterModeWinlink;

  /// No description provided for @repeaterFrequency.
  ///
  /// In it, this message translates to:
  /// **'Frequenza'**
  String get repeaterFrequency;

  /// No description provided for @repeaterShift.
  ///
  /// In it, this message translates to:
  /// **'Shift'**
  String get repeaterShift;

  /// No description provided for @repeaterCtcss.
  ///
  /// In it, this message translates to:
  /// **'CTCSS'**
  String get repeaterCtcss;

  /// No description provided for @repeaterLocation.
  ///
  /// In it, this message translates to:
  /// **'Posizione'**
  String get repeaterLocation;

  /// No description provided for @repeaterDistance.
  ///
  /// In it, this message translates to:
  /// **'Distanza'**
  String get repeaterDistance;

  /// No description provided for @repeatersMapReturnToLocation.
  ///
  /// In it, this message translates to:
  /// **'Torna alla mia posizione'**
  String get repeatersMapReturnToLocation;

  /// No description provided for @profileUnlockFeatures.
  ///
  /// In it, this message translates to:
  /// **'Sblocca tutte le funzionalità'**
  String get profileUnlockFeatures;

  /// No description provided for @profileUnlockFeaturesDescription.
  ///
  /// In it, this message translates to:
  /// **'Registrati per utilizzare le funzioni di recensione, salvataggio preferiti e accedere a statistiche dettagliate.'**
  String get profileUnlockFeaturesDescription;

  /// No description provided for @profileSignUpOrLogin.
  ///
  /// In it, this message translates to:
  /// **'Registrati o Accedi'**
  String get profileSignUpOrLogin;

  /// No description provided for @profileErrorOpeningEmail.
  ///
  /// In it, this message translates to:
  /// **'Errore durante l\'apertura della mail'**
  String get profileErrorOpeningEmail;

  /// No description provided for @profileJoinTelegramCommunity.
  ///
  /// In it, this message translates to:
  /// **'Entra nella community Telegram'**
  String get profileJoinTelegramCommunity;

  /// No description provided for @profileVersion.
  ///
  /// In it, this message translates to:
  /// **'Versione: {version}+{buildNumber}'**
  String profileVersion(String version, String buildNumber);

  /// No description provided for @profileError.
  ///
  /// In it, this message translates to:
  /// **'Errore: {error}'**
  String profileError(String error);

  /// No description provided for @authJoinTitle.
  ///
  /// In it, this message translates to:
  /// **'Unisciti a HamQRG'**
  String get authJoinTitle;

  /// No description provided for @authUnlockFeatures.
  ///
  /// In it, this message translates to:
  /// **'Accedi per sbloccare tutte le funzionalità!'**
  String get authUnlockFeatures;

  /// No description provided for @authWhatYouGet.
  ///
  /// In it, this message translates to:
  /// **'Cosa otterrai:'**
  String get authWhatYouGet;

  /// No description provided for @authBenefitStatsTitle.
  ///
  /// In it, this message translates to:
  /// **'Statistiche dettagliate'**
  String get authBenefitStatsTitle;

  /// No description provided for @authBenefitStatsDescription.
  ///
  /// In it, this message translates to:
  /// **'Monitora i tuoi progressi e migliora'**
  String get authBenefitStatsDescription;

  /// No description provided for @authBenefitQuizTitle.
  ///
  /// In it, this message translates to:
  /// **'Diverse modalità di quiz'**
  String get authBenefitQuizTitle;

  /// No description provided for @authBenefitQuizDescription.
  ///
  /// In it, this message translates to:
  /// **'Allenati in modalità maratona, topics e altro.'**
  String get authBenefitQuizDescription;

  /// No description provided for @authBenefitSyncTitle.
  ///
  /// In it, this message translates to:
  /// **'Sincronizzazione'**
  String get authBenefitSyncTitle;

  /// No description provided for @authBenefitSyncDescription.
  ///
  /// In it, this message translates to:
  /// **'Accedi da qualsiasi dispositivo'**
  String get authBenefitSyncDescription;

  /// No description provided for @authOrSignInWithEmail.
  ///
  /// In it, this message translates to:
  /// **'Oppure accedi con email'**
  String get authOrSignInWithEmail;

  /// No description provided for @authEnterEmail.
  ///
  /// In it, this message translates to:
  /// **'Inserisci l\'email'**
  String get authEnterEmail;

  /// No description provided for @authEnterPassword.
  ///
  /// In it, this message translates to:
  /// **'Inserisci la password'**
  String get authEnterPassword;

  /// No description provided for @authForgotPassword.
  ///
  /// In it, this message translates to:
  /// **'Password dimenticata?'**
  String get authForgotPassword;

  /// No description provided for @authSignIn.
  ///
  /// In it, this message translates to:
  /// **'Accedi'**
  String get authSignIn;

  /// No description provided for @authSignUp.
  ///
  /// In it, this message translates to:
  /// **'Registrati'**
  String get authSignUp;

  /// No description provided for @authPasswordLengthError.
  ///
  /// In it, this message translates to:
  /// **'La password deve essere più lunga'**
  String get authPasswordLengthError;

  /// No description provided for @authDontHaveAccount.
  ///
  /// In it, this message translates to:
  /// **'Non hai un account? Registrati'**
  String get authDontHaveAccount;

  /// No description provided for @authHaveAccount.
  ///
  /// In it, this message translates to:
  /// **'Hai già un account? Accedi'**
  String get authHaveAccount;

  /// No description provided for @authBackToSignIn.
  ///
  /// In it, this message translates to:
  /// **'Torna all\'accesso'**
  String get authBackToSignIn;

  /// No description provided for @authUnexpectedError.
  ///
  /// In it, this message translates to:
  /// **'Errore inaspettato'**
  String get authUnexpectedError;

  /// No description provided for @authValidEmailError.
  ///
  /// In it, this message translates to:
  /// **'Inserisci un\'email valida'**
  String get authValidEmailError;

  /// No description provided for @authSendPasswordReset.
  ///
  /// In it, this message translates to:
  /// **'Invia reset password'**
  String get authSendPasswordReset;

  /// No description provided for @authPasswordResetSent.
  ///
  /// In it, this message translates to:
  /// **'Reset password inviato'**
  String get authPasswordResetSent;

  /// No description provided for @authVerifyEmailMessage.
  ///
  /// In it, this message translates to:
  /// **'Verifica la tua email per completare la registrazione, controlla la tua casella.'**
  String get authVerifyEmailMessage;

  /// No description provided for @authInvalidCredentials.
  ///
  /// In it, this message translates to:
  /// **'Email o password errati'**
  String get authInvalidCredentials;

  /// No description provided for @authEmailNotConfirmed.
  ///
  /// In it, this message translates to:
  /// **'Verifica la tua email per accedere'**
  String get authEmailNotConfirmed;

  /// No description provided for @authFirstName.
  ///
  /// In it, this message translates to:
  /// **'Nome'**
  String get authFirstName;

  /// No description provided for @authFirstNameRequired.
  ///
  /// In it, this message translates to:
  /// **'Il nome è obbligatorio'**
  String get authFirstNameRequired;

  /// No description provided for @authLastName.
  ///
  /// In it, this message translates to:
  /// **'Cognome'**
  String get authLastName;

  /// No description provided for @authLastNameRequired.
  ///
  /// In it, this message translates to:
  /// **'Il cognome è obbligatorio'**
  String get authLastNameRequired;

  /// No description provided for @authContinueAsGuest.
  ///
  /// In it, this message translates to:
  /// **'Continua come ospite'**
  String get authContinueAsGuest;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
