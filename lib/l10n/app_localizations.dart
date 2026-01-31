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
  /// **'Esci'**
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
  /// **'Per migliorare la tua esperienza e mostrarti contenuti più rilevanti, aiutaci a mantenere gratuita l\'app.\n\nClicca su Consenti per supportarci.'**
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
  /// **'Analogico'**
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
  /// **'Tutti i modi'**
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

  /// No description provided for @repeaterViewFullDetails.
  ///
  /// In it, this message translates to:
  /// **'Vedi dettagli completi'**
  String get repeaterViewFullDetails;

  /// No description provided for @repeatersMapReturnToLocation.
  ///
  /// In it, this message translates to:
  /// **'Torna alla mia posizione'**
  String get repeatersMapReturnToLocation;

  /// No description provided for @clusterRepeatersTitle.
  ///
  /// In it, this message translates to:
  /// **'{count} ripetitori in questa posizione'**
  String clusterRepeatersTitle(int count);

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

  /// No description provided for @profileWelcomeTitle.
  ///
  /// In it, this message translates to:
  /// **'Benvenuto su HamQRG'**
  String get profileWelcomeTitle;

  /// No description provided for @profileWelcomeDescription.
  ///
  /// In it, this message translates to:
  /// **'Unisciti alla nostra community di radioamatori in Italia.'**
  String get profileWelcomeDescription;

  /// No description provided for @profileEditProfile.
  ///
  /// In it, this message translates to:
  /// **'Modifica Profilo'**
  String get profileEditProfile;

  /// No description provided for @profileChangePhoto.
  ///
  /// In it, this message translates to:
  /// **'Cambia Foto'**
  String get profileChangePhoto;

  /// No description provided for @profileFirstName.
  ///
  /// In it, this message translates to:
  /// **'Nome'**
  String get profileFirstName;

  /// No description provided for @profileLastName.
  ///
  /// In it, this message translates to:
  /// **'Cognome'**
  String get profileLastName;

  /// No description provided for @profileCallsign.
  ///
  /// In it, this message translates to:
  /// **'Nominativo'**
  String get profileCallsign;

  /// No description provided for @profileRestartIdentificationTitle.
  ///
  /// In it, this message translates to:
  /// **'Devi cambiare il tuo stato? Puoi riavviare il processo di identificazione per passare da Operatore Autorizzato a SWL Listener.'**
  String get profileRestartIdentificationTitle;

  /// No description provided for @profileRestartIdentificationButton.
  ///
  /// In it, this message translates to:
  /// **'Riavvia Processo di Identificazione'**
  String get profileRestartIdentificationButton;

  /// No description provided for @profileSaveChanges.
  ///
  /// In it, this message translates to:
  /// **'Salva Modifiche'**
  String get profileSaveChanges;

  /// No description provided for @profileDangerZone.
  ///
  /// In it, this message translates to:
  /// **'Zona Pericolosa'**
  String get profileDangerZone;

  /// No description provided for @profileDeleteAccount.
  ///
  /// In it, this message translates to:
  /// **'Elimina Account'**
  String get profileDeleteAccount;

  /// No description provided for @profileDeleteAccountConfirmTitle.
  ///
  /// In it, this message translates to:
  /// **'Elimina Account'**
  String get profileDeleteAccountConfirmTitle;

  /// No description provided for @profileDeleteAccountConfirmMessage.
  ///
  /// In it, this message translates to:
  /// **'Sei sicuro di voler eliminare il tuo account? Questa azione è irreversibile.'**
  String get profileDeleteAccountConfirmMessage;

  /// No description provided for @profileDeleteAccountCancel.
  ///
  /// In it, this message translates to:
  /// **'Annulla'**
  String get profileDeleteAccountCancel;

  /// No description provided for @profileDeleteAccountConfirm.
  ///
  /// In it, this message translates to:
  /// **'Elimina'**
  String get profileDeleteAccountConfirm;

  /// No description provided for @profileAppVersion.
  ///
  /// In it, this message translates to:
  /// **'App Version {version} (Build {buildNumber})'**
  String profileAppVersion(String version, String buildNumber);

  /// No description provided for @profileSectionCommunity.
  ///
  /// In it, this message translates to:
  /// **'Community & Support'**
  String get profileSectionCommunity;

  /// No description provided for @profileSectionSupport.
  ///
  /// In it, this message translates to:
  /// **'Support'**
  String get profileSectionSupport;

  /// No description provided for @profileVersion.
  ///
  /// In it, this message translates to:
  /// **'Versione: {version}+{buildNumber}'**
  String profileVersion(String version, String buildNumber);

  /// No description provided for @profileVersionFormat.
  ///
  /// In it, this message translates to:
  /// **'Version {version} (Build {buildNumber})'**
  String profileVersionFormat(String version, String buildNumber);

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
  /// **'Allenati in modalità maratona, argomenti e altro.'**
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

  /// No description provided for @commonAppNamePart1.
  ///
  /// In it, this message translates to:
  /// **'Ham'**
  String get commonAppNamePart1;

  /// No description provided for @commonAppNamePart2.
  ///
  /// In it, this message translates to:
  /// **'QRG'**
  String get commonAppNamePart2;

  /// No description provided for @commonAppTagline.
  ///
  /// In it, this message translates to:
  /// **'Scopri i ripetitori che ti circondano'**
  String get commonAppTagline;

  /// No description provided for @commonPoweredBy.
  ///
  /// In it, this message translates to:
  /// **'POWERED BY IU4VRB'**
  String get commonPoweredBy;

  /// No description provided for @homeQuickAccess.
  ///
  /// In it, this message translates to:
  /// **'Accesso rapido'**
  String get homeQuickAccess;

  /// No description provided for @homeRepeaterList.
  ///
  /// In it, this message translates to:
  /// **'Lista ripetitori'**
  String get homeRepeaterList;

  /// No description provided for @homeMyFavorites.
  ///
  /// In it, this message translates to:
  /// **'I miei preferiti'**
  String get homeMyFavorites;

  /// No description provided for @homeNearby.
  ///
  /// In it, this message translates to:
  /// **'Vicino a te'**
  String get homeNearby;

  /// No description provided for @homeViewAll.
  ///
  /// In it, this message translates to:
  /// **'Vedi tutto'**
  String get homeViewAll;

  /// No description provided for @homeStations.
  ///
  /// In it, this message translates to:
  /// **'{count} stazioni'**
  String homeStations(int count);

  /// No description provided for @homeSaved.
  ///
  /// In it, this message translates to:
  /// **'{count} salvati'**
  String homeSaved(int count);

  /// No description provided for @homeActive.
  ///
  /// In it, this message translates to:
  /// **'Attivo'**
  String get homeActive;

  /// No description provided for @homeIdle.
  ///
  /// In it, this message translates to:
  /// **'Inattivo'**
  String get homeIdle;

  /// No description provided for @homeNavHome.
  ///
  /// In it, this message translates to:
  /// **'Home'**
  String get homeNavHome;

  /// No description provided for @homeNavList.
  ///
  /// In it, this message translates to:
  /// **'Lista'**
  String get homeNavList;

  /// No description provided for @homeNavFavorites.
  ///
  /// In it, this message translates to:
  /// **'Preferiti'**
  String get homeNavFavorites;

  /// No description provided for @homeNavProfile.
  ///
  /// In it, this message translates to:
  /// **'Profilo'**
  String get homeNavProfile;

  /// No description provided for @favoritesTitle.
  ///
  /// In it, this message translates to:
  /// **'I miei preferiti'**
  String get favoritesTitle;

  /// No description provided for @favoritesSearchHint.
  ///
  /// In it, this message translates to:
  /// **'Cerca ripetitori salvati...'**
  String get favoritesSearchHint;

  /// No description provided for @favoritesFilterAllSaved.
  ///
  /// In it, this message translates to:
  /// **'Tutti salvati'**
  String get favoritesFilterAllSaved;

  /// No description provided for @favoritesEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessun ripetitore salvato'**
  String get favoritesEmpty;

  /// No description provided for @favoritesEmptyDescription.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi ripetitori ai preferiti per vederli qui'**
  String get favoritesEmptyDescription;

  /// No description provided for @favoritesShowing.
  ///
  /// In it, this message translates to:
  /// **'Mostrando {showing} di {total} stazioni preferite'**
  String favoritesShowing(int showing, int total);

  /// No description provided for @favoritesRemove.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi dai preferiti'**
  String get favoritesRemove;

  /// No description provided for @favoritesAdd.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi ai preferiti'**
  String get favoritesAdd;

  /// No description provided for @repeaterDetailSave.
  ///
  /// In it, this message translates to:
  /// **'Salva'**
  String get repeaterDetailSave;

  /// No description provided for @repeaterDetailShare.
  ///
  /// In it, this message translates to:
  /// **'Condividi'**
  String get repeaterDetailShare;

  /// No description provided for @repeaterDetailReport.
  ///
  /// In it, this message translates to:
  /// **'Segnala'**
  String get repeaterDetailReport;

  /// No description provided for @repeaterDetailTotalLikes.
  ///
  /// In it, this message translates to:
  /// **'Mi piace totali'**
  String get repeaterDetailTotalLikes;

  /// No description provided for @repeaterDetailReports1Yr.
  ///
  /// In it, this message translates to:
  /// **'Segnalazioni (1 anno)'**
  String get repeaterDetailReports1Yr;

  /// No description provided for @repeaterDetailHealthScore.
  ///
  /// In it, this message translates to:
  /// **'Punteggio salute'**
  String get repeaterDetailHealthScore;

  /// No description provided for @repeaterDetailExcellent.
  ///
  /// In it, this message translates to:
  /// **'Eccellente'**
  String get repeaterDetailExcellent;

  /// No description provided for @repeaterDetailGood.
  ///
  /// In it, this message translates to:
  /// **'Buono'**
  String get repeaterDetailGood;

  /// No description provided for @repeaterDetailFair.
  ///
  /// In it, this message translates to:
  /// **'Discreto'**
  String get repeaterDetailFair;

  /// No description provided for @repeaterDetailToVerify.
  ///
  /// In it, this message translates to:
  /// **'Da verificare'**
  String get repeaterDetailToVerify;

  /// No description provided for @repeaterDetailScoreCalculated.
  ///
  /// In it, this message translates to:
  /// **'Punteggio calcolato da {count} segnalazioni negative nell\'ultimo anno'**
  String repeaterDetailScoreCalculated(int count);

  /// No description provided for @repeaterDetailLastLike.
  ///
  /// In it, this message translates to:
  /// **'Ultimo mi piace'**
  String get repeaterDetailLastLike;

  /// No description provided for @repeaterDetailLastDownReport.
  ///
  /// In it, this message translates to:
  /// **'Ultima segnalazione negativa'**
  String get repeaterDetailLastDownReport;

  /// No description provided for @repeaterDetailTechnicalData.
  ///
  /// In it, this message translates to:
  /// **'Dati tecnici'**
  String get repeaterDetailTechnicalData;

  /// No description provided for @repeaterDetailFrequency.
  ///
  /// In it, this message translates to:
  /// **'Frequenza'**
  String get repeaterDetailFrequency;

  /// No description provided for @repeaterDetailShift.
  ///
  /// In it, this message translates to:
  /// **'Shift'**
  String get repeaterDetailShift;

  /// No description provided for @repeaterDetailSubtone.
  ///
  /// In it, this message translates to:
  /// **'Sottotono (SQL)'**
  String get repeaterDetailSubtone;

  /// No description provided for @repeaterDetailMode.
  ///
  /// In it, this message translates to:
  /// **'Modalità'**
  String get repeaterDetailMode;

  /// No description provided for @repeaterDetailLocation.
  ///
  /// In it, this message translates to:
  /// **'Posizione'**
  String get repeaterDetailLocation;

  /// No description provided for @repeaterDetailAway.
  ///
  /// In it, this message translates to:
  /// **'{distance} di distanza'**
  String repeaterDetailAway(String distance);

  /// No description provided for @repeaterDetailCommunityReports.
  ///
  /// In it, this message translates to:
  /// **'Segnalazioni community'**
  String get repeaterDetailCommunityReports;

  /// No description provided for @repeaterDetailUpdateStatusFeedback.
  ///
  /// In it, this message translates to:
  /// **'Aggiorna stato e feedback'**
  String get repeaterDetailUpdateStatusFeedback;

  /// No description provided for @repeaterDetailEquipment.
  ///
  /// In it, this message translates to:
  /// **'Attrezzatura'**
  String get repeaterDetailEquipment;

  /// No description provided for @repeaterDetailEquipmentRequired.
  ///
  /// In it, this message translates to:
  /// **'Attrezzatura *'**
  String get repeaterDetailEquipmentRequired;

  /// No description provided for @repeaterDetailAccessModes.
  ///
  /// In it, this message translates to:
  /// **'Modalità di accesso'**
  String get repeaterDetailAccessModes;

  /// No description provided for @repeaterDetailNetwork.
  ///
  /// In it, this message translates to:
  /// **'Rete'**
  String get repeaterDetailNetwork;

  /// No description provided for @repeaterDetailLocationField.
  ///
  /// In it, this message translates to:
  /// **'Luogo'**
  String get repeaterDetailLocationField;

  /// No description provided for @repeaterDetailLocationRequired.
  ///
  /// In it, this message translates to:
  /// **'Luogo *'**
  String get repeaterDetailLocationRequired;

  /// No description provided for @repeaterDetailComment.
  ///
  /// In it, this message translates to:
  /// **'Commento'**
  String get repeaterDetailComment;

  /// No description provided for @repeaterDetailCommentOptional.
  ///
  /// In it, this message translates to:
  /// **'Commento (Opzionale)'**
  String get repeaterDetailCommentOptional;

  /// No description provided for @repeaterDetailCommentPlaceholder.
  ///
  /// In it, this message translates to:
  /// **'Qualità del segnale, rapporto audio o commenti generali...'**
  String get repeaterDetailCommentPlaceholder;

  /// No description provided for @repeaterDetailReportDown.
  ///
  /// In it, this message translates to:
  /// **'Segnala problema'**
  String get repeaterDetailReportDown;

  /// No description provided for @repeaterDetailCheckinLike.
  ///
  /// In it, this message translates to:
  /// **'Check-in e mi piace'**
  String get repeaterDetailCheckinLike;

  /// No description provided for @repeaterDetailYourFeedback.
  ///
  /// In it, this message translates to:
  /// **'Il tuo feedback'**
  String get repeaterDetailYourFeedback;

  /// No description provided for @repeaterDetailPostedJustNow.
  ///
  /// In it, this message translates to:
  /// **'Pubblicato adesso'**
  String get repeaterDetailPostedJustNow;

  /// No description provided for @repeaterDetailDeleteEntry.
  ///
  /// In it, this message translates to:
  /// **'Elimina voce'**
  String get repeaterDetailDeleteEntry;

  /// No description provided for @repeaterDetailViewAllReports.
  ///
  /// In it, this message translates to:
  /// **'Vedi tutte le {count} segnalazioni'**
  String repeaterDetailViewAllReports(int count);

  /// No description provided for @repeaterDetailStationPortable.
  ///
  /// In it, this message translates to:
  /// **'Portatile'**
  String get repeaterDetailStationPortable;

  /// No description provided for @repeaterDetailStationMobile.
  ///
  /// In it, this message translates to:
  /// **'Mobile'**
  String get repeaterDetailStationMobile;

  /// No description provided for @repeaterDetailStationFixed.
  ///
  /// In it, this message translates to:
  /// **'Fisso'**
  String get repeaterDetailStationFixed;

  /// No description provided for @repeaterDetailLike.
  ///
  /// In it, this message translates to:
  /// **'Mi piace'**
  String get repeaterDetailLike;

  /// No description provided for @repeaterDetailReportLabel.
  ///
  /// In it, this message translates to:
  /// **'Segnalazione'**
  String get repeaterDetailReportLabel;

  /// No description provided for @repeaterDetailSaved.
  ///
  /// In it, this message translates to:
  /// **'Salvato'**
  String get repeaterDetailSaved;

  /// No description provided for @repeaterDetailShareMessage.
  ///
  /// In it, this message translates to:
  /// **'Scopri questo ripetitore su HamQRG!'**
  String get repeaterDetailShareMessage;

  /// No description provided for @repeaterDetailReportDescription.
  ///
  /// In it, this message translates to:
  /// **'La funzionalità di segnalazione sarà disponibile a breve. Potrai segnalare informazioni errate o problemi con questo ripetitore.'**
  String get repeaterDetailReportDescription;

  /// No description provided for @commonClose.
  ///
  /// In it, this message translates to:
  /// **'Chiudi'**
  String get commonClose;

  /// No description provided for @favorite.
  ///
  /// In it, this message translates to:
  /// **'Preferito'**
  String get favorite;

  /// No description provided for @accessConfiguration.
  ///
  /// In it, this message translates to:
  /// **'Configurazione accesso'**
  String get accessConfiguration;

  /// No description provided for @noAccessConfiguration.
  ///
  /// In it, this message translates to:
  /// **'Nessuna configurazione disponibile'**
  String get noAccessConfiguration;

  /// No description provided for @repeaterDetailAddFeedback.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi feedback'**
  String get repeaterDetailAddFeedback;

  /// No description provided for @repeaterDetailOthersReports.
  ///
  /// In it, this message translates to:
  /// **'Segnalazioni altri utenti'**
  String get repeaterDetailOthersReports;

  /// No description provided for @repeaterDetailRemove.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi'**
  String get repeaterDetailRemove;

  /// No description provided for @repeaterDetailSelectAccess.
  ///
  /// In it, this message translates to:
  /// **'Seleziona accesso'**
  String get repeaterDetailSelectAccess;

  /// No description provided for @repeaterDetailDistanceWarning.
  ///
  /// In it, this message translates to:
  /// **'Devi essere entro {distance} km dal ripetitore per inviare un feedback.'**
  String repeaterDetailDistanceWarning(int distance);

  /// No description provided for @repeaterDetailInteractive.
  ///
  /// In it, this message translates to:
  /// **'Interattivo'**
  String get repeaterDetailInteractive;

  /// No description provided for @repeaterDetailLogYourSignal.
  ///
  /// In it, this message translates to:
  /// **'Registra il tuo segnale'**
  String get repeaterDetailLogYourSignal;

  /// No description provided for @repeaterDetailUsedEquipment.
  ///
  /// In it, this message translates to:
  /// **'Attrezzatura usata'**
  String get repeaterDetailUsedEquipment;

  /// No description provided for @repeaterDetailYourLocation.
  ///
  /// In it, this message translates to:
  /// **'La tua posizione'**
  String get repeaterDetailYourLocation;

  /// No description provided for @repeaterDetailLocationPlaceholder.
  ///
  /// In it, this message translates to:
  /// **'Dove eri? (es. Roma)'**
  String get repeaterDetailLocationPlaceholder;

  /// No description provided for @repeaterDetailLocationSelectHint.
  ///
  /// In it, this message translates to:
  /// **'Seleziona un luogo dai suggerimenti'**
  String get repeaterDetailLocationSelectHint;

  /// No description provided for @feedbackDistanceConfirmTitle.
  ///
  /// In it, this message translates to:
  /// **'Conferma invio'**
  String get feedbackDistanceConfirmTitle;

  /// No description provided for @feedbackDistanceConfirmMessage.
  ///
  /// In it, this message translates to:
  /// **'Il luogo selezionato si trova a {distance} km dal ripetitore. Confermi di voler inviare questo feedback sotto la tua responsabilità?'**
  String feedbackDistanceConfirmMessage(String distance);

  /// No description provided for @feedbackDistanceConfirmButton.
  ///
  /// In it, this message translates to:
  /// **'Conferma'**
  String get feedbackDistanceConfirmButton;

  /// No description provided for @feedbackDistanceConfirmCancel.
  ///
  /// In it, this message translates to:
  /// **'Annulla'**
  String get feedbackDistanceConfirmCancel;

  /// No description provided for @repeaterDetailSelectAccessInstance.
  ///
  /// In it, this message translates to:
  /// **'Seleziona istanza di accesso'**
  String get repeaterDetailSelectAccessInstance;

  /// No description provided for @repeaterDetailSignalObservations.
  ///
  /// In it, this message translates to:
  /// **'Osservazioni sul segnale'**
  String get repeaterDetailSignalObservations;

  /// No description provided for @repeaterDetailSignalObservationsPlaceholder.
  ///
  /// In it, this message translates to:
  /// **'Com\'era la qualità audio?'**
  String get repeaterDetailSignalObservationsPlaceholder;

  /// No description provided for @repeaterDetailSendLike.
  ///
  /// In it, this message translates to:
  /// **'Invia Like'**
  String get repeaterDetailSendLike;

  /// No description provided for @repeaterDetailReportIssue.
  ///
  /// In it, this message translates to:
  /// **'Segnala Problema'**
  String get repeaterDetailReportIssue;

  /// No description provided for @repeaterDetailRecentActivity.
  ///
  /// In it, this message translates to:
  /// **'Attività recente'**
  String get repeaterDetailRecentActivity;

  /// No description provided for @reportIssueTitle.
  ///
  /// In it, this message translates to:
  /// **'Segnala Problema'**
  String get reportIssueTitle;

  /// No description provided for @reportIssueHeadline.
  ///
  /// In it, this message translates to:
  /// **'Aiutaci a mantenere i dati accurati'**
  String get reportIssueHeadline;

  /// No description provided for @reportIssueDescription.
  ///
  /// In it, this message translates to:
  /// **'Hai trovato qualcosa di sbagliato in questo ripetitore? Facci sapere cosa deve essere modificato e lo verificheremo.'**
  String get reportIssueDescription;

  /// No description provided for @reportIssueWhatToCorrect.
  ///
  /// In it, this message translates to:
  /// **'Cosa vorresti correggere?'**
  String get reportIssueWhatToCorrect;

  /// No description provided for @reportIssuePlaceholder.
  ///
  /// In it, this message translates to:
  /// **'Es. Il tono CTCSS è cambiato a 88.5Hz, o la posizione è leggermente più a nord...'**
  String get reportIssuePlaceholder;

  /// No description provided for @reportIssueVerifiedTitle.
  ///
  /// In it, this message translates to:
  /// **'Invii Verificati'**
  String get reportIssueVerifiedTitle;

  /// No description provided for @reportIssueVerifiedDescription.
  ///
  /// In it, this message translates to:
  /// **'La tua segnalazione sarà revisionata dal coordinatore regionale prima che il database pubblico venga aggiornato. Grazie per il tuo contributo alla community.'**
  String get reportIssueVerifiedDescription;

  /// No description provided for @reportIssueConfirmCheckbox.
  ///
  /// In it, this message translates to:
  /// **'Confermo che queste informazioni sono corrette in base alla mia osservazione.'**
  String get reportIssueConfirmCheckbox;

  /// No description provided for @reportIssueSubmit.
  ///
  /// In it, this message translates to:
  /// **'Invia'**
  String get reportIssueSubmit;

  /// No description provided for @reportIssueMinChars.
  ///
  /// In it, this message translates to:
  /// **'Minimo 10 caratteri richiesti'**
  String get reportIssueMinChars;

  /// No description provided for @reportIssueMaxChars.
  ///
  /// In it, this message translates to:
  /// **'Massimo 2000 caratteri'**
  String get reportIssueMaxChars;

  /// No description provided for @reportIssueSuccess.
  ///
  /// In it, this message translates to:
  /// **'Segnalazione inviata con successo'**
  String get reportIssueSuccess;

  /// No description provided for @reportIssueError.
  ///
  /// In it, this message translates to:
  /// **'Errore durante l\'invio della segnalazione'**
  String get reportIssueError;

  /// No description provided for @registrationPromptTitle.
  ///
  /// In it, this message translates to:
  /// **'Sblocca tutto il potenziale'**
  String get registrationPromptTitle;

  /// No description provided for @registrationPromptDescription.
  ///
  /// In it, this message translates to:
  /// **'Unisciti alla community italiana dei radioamatori e porta la tua esperienza al livello successivo.'**
  String get registrationPromptDescription;

  /// No description provided for @registrationBenefitInteractTitle.
  ///
  /// In it, this message translates to:
  /// **'Interagisci'**
  String get registrationBenefitInteractTitle;

  /// No description provided for @registrationBenefitInteractDescription.
  ///
  /// In it, this message translates to:
  /// **'Valuta i ripetitori e lascia commenti per gli altri.'**
  String get registrationBenefitInteractDescription;

  /// No description provided for @registrationBenefitFavoritesTitle.
  ///
  /// In it, this message translates to:
  /// **'Preferiti'**
  String get registrationBenefitFavoritesTitle;

  /// No description provided for @registrationBenefitFavoritesDescription.
  ///
  /// In it, this message translates to:
  /// **'Salva le tue frequenze e ripetitori più usati.'**
  String get registrationBenefitFavoritesDescription;

  /// No description provided for @registrationBenefitLogbookTitle.
  ///
  /// In it, this message translates to:
  /// **'Logbook'**
  String get registrationBenefitLogbookTitle;

  /// No description provided for @registrationBenefitLogbookDescription.
  ///
  /// In it, this message translates to:
  /// **'Tieni traccia dei tuoi QSO e mantieni uno storico personale.'**
  String get registrationBenefitLogbookDescription;

  /// No description provided for @registrationSignInApple.
  ///
  /// In it, this message translates to:
  /// **'Accedi con Apple'**
  String get registrationSignInApple;

  /// No description provided for @registrationSignInGoogle.
  ///
  /// In it, this message translates to:
  /// **'Accedi con Google'**
  String get registrationSignInGoogle;

  /// No description provided for @registrationPromptFooter.
  ///
  /// In it, this message translates to:
  /// **'Registrazione gratuita. Nessuna licenza richiesta per consultare i dati pubblici.'**
  String get registrationPromptFooter;

  /// No description provided for @postLoginOnboardingWelcome.
  ///
  /// In it, this message translates to:
  /// **'Benvenuto in'**
  String get postLoginOnboardingWelcome;

  /// No description provided for @postLoginOnboardingQuestion.
  ///
  /// In it, this message translates to:
  /// **'Sei un radioamatore con licenza?'**
  String get postLoginOnboardingQuestion;

  /// No description provided for @postLoginOnboardingHelpText.
  ///
  /// In it, this message translates to:
  /// **'Ci aiuta a personalizzare la tua esperienza e mostrarti le frequenze giuste.'**
  String get postLoginOnboardingHelpText;

  /// No description provided for @postLoginOnboardingYesLicensed.
  ///
  /// In it, this message translates to:
  /// **'Sì, lo sono'**
  String get postLoginOnboardingYesLicensed;

  /// No description provided for @postLoginOnboardingNoListener.
  ///
  /// In it, this message translates to:
  /// **'No, sono solo un ascoltatore'**
  String get postLoginOnboardingNoListener;

  /// No description provided for @postLoginOnboardingCallsignTitle.
  ///
  /// In it, this message translates to:
  /// **'Identificati'**
  String get postLoginOnboardingCallsignTitle;

  /// No description provided for @postLoginOnboardingCallsignSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Inserisci il tuo nominativo ufficiale per accedere alle funzionalità di rete.'**
  String get postLoginOnboardingCallsignSubtitle;

  /// No description provided for @postLoginOnboardingCallsignLabel.
  ///
  /// In it, this message translates to:
  /// **'Nominativo (Callsign)'**
  String get postLoginOnboardingCallsignLabel;

  /// No description provided for @postLoginOnboardingCallsignHint.
  ///
  /// In it, this message translates to:
  /// **'Es. IU2XYZ'**
  String get postLoginOnboardingCallsignHint;

  /// No description provided for @postLoginOnboardingComplete.
  ///
  /// In it, this message translates to:
  /// **'Completa profilo'**
  String get postLoginOnboardingComplete;

  /// No description provided for @postLoginOnboardingBack.
  ///
  /// In it, this message translates to:
  /// **'Indietro'**
  String get postLoginOnboardingBack;

  /// No description provided for @postLoginOnboardingChangeInSettings.
  ///
  /// In it, this message translates to:
  /// **'Puoi modificarlo in seguito nelle impostazioni.'**
  String get postLoginOnboardingChangeInSettings;

  /// No description provided for @postLoginOnboardingSwlTitle.
  ///
  /// In it, this message translates to:
  /// **'Nominativo SWL'**
  String get postLoginOnboardingSwlTitle;

  /// No description provided for @postLoginOnboardingSwlQuestion.
  ///
  /// In it, this message translates to:
  /// **'Hai un nominativo SWL ufficiale?'**
  String get postLoginOnboardingSwlQuestion;

  /// No description provided for @postLoginOnboardingSwlHelpText.
  ///
  /// In it, this message translates to:
  /// **'I nominativi degli ascoltatori d\'onda corta aiutano a identificarti nella community globale di monitoraggio.'**
  String get postLoginOnboardingSwlHelpText;

  /// No description provided for @postLoginOnboardingSwlYes.
  ///
  /// In it, this message translates to:
  /// **'Si, ne ho uno'**
  String get postLoginOnboardingSwlYes;

  /// No description provided for @postLoginOnboardingSwlNo.
  ///
  /// In it, this message translates to:
  /// **'No, non ne ho uno'**
  String get postLoginOnboardingSwlNo;

  /// No description provided for @postLoginOnboardingSwlEnterCallsign.
  ///
  /// In it, this message translates to:
  /// **'Inserisci nominativo'**
  String get postLoginOnboardingSwlEnterCallsign;

  /// No description provided for @postLoginOnboardingSwlCallsignHint.
  ///
  /// In it, this message translates to:
  /// **'Es. I1-12345-SWL'**
  String get postLoginOnboardingSwlCallsignHint;

  /// No description provided for @timeAgoJustNow.
  ///
  /// In it, this message translates to:
  /// **'adesso'**
  String get timeAgoJustNow;

  /// No description provided for @timeAgoMinutes.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, one{1 minuto fa} other{{count} minuti fa}}'**
  String timeAgoMinutes(int count);

  /// No description provided for @timeAgoHours.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, one{1 ora fa} other{{count} ore fa}}'**
  String timeAgoHours(int count);

  /// No description provided for @timeAgoDays.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, one{1 giorno fa} other{{count} giorni fa}}'**
  String timeAgoDays(int count);

  /// No description provided for @timeAgoWeeks.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, one{1 settimana fa} other{{count} settimane fa}}'**
  String timeAgoWeeks(int count);

  /// No description provided for @timeAgoMonths.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, one{1 mese fa} other{{count} mesi fa}}'**
  String timeAgoMonths(int count);

  /// No description provided for @timeAgoYears.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, one{1 anno fa} other{{count} anni fa}}'**
  String timeAgoYears(int count);

  /// No description provided for @profileThemeMode.
  ///
  /// In it, this message translates to:
  /// **'Tema'**
  String get profileThemeMode;

  /// No description provided for @profileThemeModeSystem.
  ///
  /// In it, this message translates to:
  /// **'Sistema'**
  String get profileThemeModeSystem;

  /// No description provided for @profileThemeModeLight.
  ///
  /// In it, this message translates to:
  /// **'Chiaro'**
  String get profileThemeModeLight;

  /// No description provided for @profileThemeModeDark.
  ///
  /// In it, this message translates to:
  /// **'Scuro'**
  String get profileThemeModeDark;
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
