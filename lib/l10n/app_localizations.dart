import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_it.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sr.dart';

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hr'),
    Locale('hu'),
    Locale('it'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('sk'),
    Locale('sl'),
    Locale('sr')
  ];

  /// No description provided for @proSectionTitle.
  ///
  /// In it, this message translates to:
  /// **'Abbonamento'**
  String get proSectionTitle;

  /// No description provided for @proCardUpgradeTitle.
  ///
  /// In it, this message translates to:
  /// **'Scopri cosa raggiungi'**
  String get proCardUpgradeTitle;

  /// No description provided for @proCardUpgradeSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Copertura, ponti e mappe offline'**
  String get proCardUpgradeSubtitle;

  /// No description provided for @proCardActiveTitle.
  ///
  /// In it, this message translates to:
  /// **'HamQRG Pro attivo'**
  String get proCardActiveTitle;

  /// No description provided for @proCardActiveSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Grazie per il supporto!'**
  String get proCardActiveSubtitle;

  /// No description provided for @proPriceFromMonth.
  ///
  /// In it, this message translates to:
  /// **'Da {price} al mese · Annulla quando vuoi'**
  String proPriceFromMonth(String price);

  /// No description provided for @proPriceTrialThenMonth.
  ///
  /// In it, this message translates to:
  /// **'Prova gratis, poi {price} al mese · Annulla quando vuoi'**
  String proPriceTrialThenMonth(String price);

  /// No description provided for @proPriceLifetime.
  ///
  /// In it, this message translates to:
  /// **'{price} una volta sola · Per sempre'**
  String proPriceLifetime(String price);

  /// No description provided for @proPriceFromMonthUpfront.
  ///
  /// In it, this message translates to:
  /// **'Da {price} al mese · {total} in anticipo · Annulla quando vuoi'**
  String proPriceFromMonthUpfront(String price, String total);

  /// No description provided for @proPriceTrialThenMonthUpfront.
  ///
  /// In it, this message translates to:
  /// **'Prova gratis, poi {price} al mese · {total} in anticipo · Annulla quando vuoi'**
  String proPriceTrialThenMonthUpfront(String price, String total);

  /// No description provided for @proRestoreSuccess.
  ///
  /// In it, this message translates to:
  /// **'Acquisti ripristinati: HamQRG Pro è attivo'**
  String get proRestoreSuccess;

  /// No description provided for @proRestoreNone.
  ///
  /// In it, this message translates to:
  /// **'Nessun acquisto da ripristinare'**
  String get proRestoreNone;

  /// No description provided for @proManageSubscription.
  ///
  /// In it, this message translates to:
  /// **'Gestisci abbonamento'**
  String get proManageSubscription;

  /// No description provided for @proLinkAccountTitle.
  ///
  /// In it, this message translates to:
  /// **'Collega il tuo account'**
  String get proLinkAccountTitle;

  /// No description provided for @proLinkAccountBody.
  ///
  /// In it, this message translates to:
  /// **'Collega HamQRG Pro a un account per ritrovarlo su ogni dispositivo, anche dopo una reinstallazione.'**
  String get proLinkAccountBody;

  /// No description provided for @stationsShowcaseTitle.
  ///
  /// In it, this message translates to:
  /// **'Le tue postazioni, anche senza rete'**
  String get stationsShowcaseTitle;

  /// No description provided for @stationsShowcaseBody.
  ///
  /// In it, this message translates to:
  /// **'Salva casa, il rifugio, il sito di attivazione: ritrovi cosa raggiungi anche quando la rete non c\'è.'**
  String get stationsShowcaseBody;

  /// No description provided for @offlineMapsUpsellTitle.
  ///
  /// In it, this message translates to:
  /// **'La mappa resta nel telefono 🗺️'**
  String get offlineMapsUpsellTitle;

  /// No description provided for @offlineMapsUpsellBody.
  ///
  /// In it, this message translates to:
  /// **'Scarica le zone che ti servono e aprile dove il segnale non arriva: in cresta, in galleria, all\'estero senza dati.'**
  String get offlineMapsUpsellBody;

  /// No description provided for @offlineMapsBenefitRegions.
  ///
  /// In it, this message translates to:
  /// **'Scegli tu le zone da scaricare'**
  String get offlineMapsBenefitRegions;

  /// No description provided for @reachUpsellBenefitSignal.
  ///
  /// In it, this message translates to:
  /// **'Segnale previsto per ogni ponte'**
  String get reachUpsellBenefitSignal;

  /// No description provided for @reachUpsellBenefitTerrain.
  ///
  /// In it, this message translates to:
  /// **'Profilo del terreno fra te e il ponte'**
  String get reachUpsellBenefitTerrain;

  /// No description provided for @proRestoreCta.
  ///
  /// In it, this message translates to:
  /// **'Ripristina acquisti'**
  String get proRestoreCta;

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

  /// No description provided for @benefitExclusivePreviews.
  ///
  /// In it, this message translates to:
  /// **'Anteprime e beta esclusive'**
  String get benefitExclusivePreviews;

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

  /// No description provided for @alreadyMemberButton.
  ///
  /// In it, this message translates to:
  /// **'Sono già membro'**
  String get alreadyMemberButton;

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

  /// No description provided for @disclaimerTitle.
  ///
  /// In it, this message translates to:
  /// **'Fonte dei dati'**
  String get disclaimerTitle;

  /// No description provided for @disclaimerDescription.
  ///
  /// In it, this message translates to:
  /// **'I dati dei ponti radio presenti in questa app provengono da IZ8WNH.\n\nPer informazioni aggiuntive, scaricare i file CSV per programmare le radio o consultare dati non presenti in quest\'app, visita il sito ufficiale.'**
  String get disclaimerDescription;

  /// No description provided for @disclaimerVisitSite.
  ///
  /// In it, this message translates to:
  /// **'Visita iz8wnh.it'**
  String get disclaimerVisitSite;

  /// No description provided for @disclaimerUnderstood.
  ///
  /// In it, this message translates to:
  /// **'Ho capito'**
  String get disclaimerUnderstood;

  /// No description provided for @errorOpenDisclaimerSite.
  ///
  /// In it, this message translates to:
  /// **'Errore durante l\'apertura del sito'**
  String get errorOpenDisclaimerSite;

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
  /// **'Cerca per nome, nominativo o frequenza MHz…'**
  String get repeatersSearchHint;

  /// No description provided for @repeatersSearchEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessun ripetitore trovato.'**
  String get repeatersSearchEmpty;

  /// No description provided for @repeatersSortDistance.
  ///
  /// In it, this message translates to:
  /// **'Distanza'**
  String get repeatersSortDistance;

  /// No description provided for @repeatersSortLikes.
  ///
  /// In it, this message translates to:
  /// **'Likes'**
  String get repeatersSortLikes;

  /// No description provided for @repeatersSortFrequency.
  ///
  /// In it, this message translates to:
  /// **'Frequenza'**
  String get repeatersSortFrequency;

  /// No description provided for @repeatersNearbyCount.
  ///
  /// In it, this message translates to:
  /// **'{count} ripetitori vicini'**
  String repeatersNearbyCount(int count);

  /// No description provided for @repeatersResultsCount.
  ///
  /// In it, this message translates to:
  /// **'{count} risultati'**
  String repeatersResultsCount(int count);

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

  /// No description provided for @repeaterModeAllstar.
  ///
  /// In it, this message translates to:
  /// **'AllStar'**
  String get repeaterModeAllstar;

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
  /// **'Errore nell\'autenticazione: '**
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

  /// No description provided for @dashboardTabRepeaters.
  ///
  /// In it, this message translates to:
  /// **'Ripetitori'**
  String get dashboardTabRepeaters;

  /// No description provided for @dashboardTabPota.
  ///
  /// In it, this message translates to:
  /// **'POTA'**
  String get dashboardTabPota;

  /// No description provided for @dashboardNearbyEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessun ripetitore nelle vicinanze'**
  String get dashboardNearbyEmpty;

  /// No description provided for @dashboardViewAllRepeaters.
  ///
  /// In it, this message translates to:
  /// **'Vedi tutti i ripetitori'**
  String get dashboardViewAllRepeaters;

  /// No description provided for @dashboardViewAllPotaSpots.
  ///
  /// In it, this message translates to:
  /// **'Vedi tutti gli spot POTA'**
  String get dashboardViewAllPotaSpots;

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

  /// No description provided for @homeNavMap.
  ///
  /// In it, this message translates to:
  /// **'Mappa'**
  String get homeNavMap;

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
  /// **'Devi essere entro {distance} dal ripetitore per inviare un feedback.'**
  String repeaterDetailDistanceWarning(String distance);

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
  /// **'Il luogo selezionato si trova a {distance} dal ripetitore. Confermi di voler inviare questo feedback sotto la tua responsabilità?'**
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
  /// **'Segnalazione'**
  String get reportIssueTitle;

  /// No description provided for @reportIssueHeadline.
  ///
  /// In it, this message translates to:
  /// **'Aiutaci a mantenere i dati accurati'**
  String get reportIssueHeadline;

  /// No description provided for @reportIssueDescription.
  ///
  /// In it, this message translates to:
  /// **'Hai trovato qualcosa di sbagliato o mancante in questo ripetitore? Facci sapere cosa deve essere modificato e lo verificheremo.'**
  String get reportIssueDescription;

  /// No description provided for @reportIssueWhatToCorrect.
  ///
  /// In it, this message translates to:
  /// **'Cosa vorresti correggere o inserire?'**
  String get reportIssueWhatToCorrect;

  /// No description provided for @reportIssuePlaceholder.
  ///
  /// In it, this message translates to:
  /// **'Es. Il tono CTCSS è cambiato a 88.5Hz, o la posizione è leggermente più a nord, il gestore è...'**
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

  /// No description provided for @repeaterDetailBeFirstFeedback.
  ///
  /// In it, this message translates to:
  /// **'Sii il primo a lasciare un feedback su questo ripetitore!'**
  String get repeaterDetailBeFirstFeedback;

  /// No description provided for @repeaterDetailDistanceFromYou.
  ///
  /// In it, this message translates to:
  /// **'Distanza da te'**
  String get repeaterDetailDistanceFromYou;

  /// No description provided for @repeaterDistanceMapNoLocation.
  ///
  /// In it, this message translates to:
  /// **'Posizione non disponibile'**
  String get repeaterDistanceMapNoLocation;

  /// No description provided for @repeaterDetailNever.
  ///
  /// In it, this message translates to:
  /// **'Mai'**
  String get repeaterDetailNever;

  /// No description provided for @repeaterDetailInfo.
  ///
  /// In it, this message translates to:
  /// **'Informazioni'**
  String get repeaterDetailInfo;

  /// No description provided for @repeaterDetailSource.
  ///
  /// In it, this message translates to:
  /// **'Fonte'**
  String get repeaterDetailSource;

  /// No description provided for @repeaterDetailManager.
  ///
  /// In it, this message translates to:
  /// **'Gestore'**
  String get repeaterDetailManager;

  /// No description provided for @repeaterDetailSuggestManager.
  ///
  /// In it, this message translates to:
  /// **'Conosci il gestore del ponte? Segnalalo!'**
  String get repeaterDetailSuggestManager;

  /// No description provided for @repeaterDetailViewFeedbackMap.
  ///
  /// In it, this message translates to:
  /// **'Mappa feedback'**
  String get repeaterDetailViewFeedbackMap;

  /// No description provided for @repeaterDetailViewFeedbackMapSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Visualizza dove sono stati registrati i like e le segnalazioni'**
  String get repeaterDetailViewFeedbackMapSubtitle;

  /// No description provided for @repeaterDetailAltimetricProfile.
  ///
  /// In it, this message translates to:
  /// **'Profilo altimetrico'**
  String get repeaterDetailAltimetricProfile;

  /// No description provided for @repeaterDetailAltimetricProfileSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Visualizza il profilo del terreno tra te e il ripetitore'**
  String get repeaterDetailAltimetricProfileSubtitle;

  /// No description provided for @repeaterCoverageTitle.
  ///
  /// In it, this message translates to:
  /// **'Copertura'**
  String get repeaterCoverageTitle;

  /// No description provided for @repeaterCoverageCardTitle.
  ///
  /// In it, this message translates to:
  /// **'Mappa di copertura'**
  String get repeaterCoverageCardTitle;

  /// No description provided for @repeaterCoverageCardSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Stima il segnale del ripetitore sul territorio'**
  String get repeaterCoverageCardSubtitle;

  /// No description provided for @repeaterCoverageLoading.
  ///
  /// In it, this message translates to:
  /// **'Calcolo della copertura in corso…'**
  String get repeaterCoverageLoading;

  /// No description provided for @repeaterCoverageError.
  ///
  /// In it, this message translates to:
  /// **'Impossibile calcolare la copertura'**
  String get repeaterCoverageError;

  /// No description provided for @repeaterCoverageRetry.
  ///
  /// In it, this message translates to:
  /// **'Riprova'**
  String get repeaterCoverageRetry;

  /// No description provided for @repeaterCoverageLegendTitle.
  ///
  /// In it, this message translates to:
  /// **'Segnale stimato (dBm)'**
  String get repeaterCoverageLegendTitle;

  /// No description provided for @repeaterCoverageCta.
  ///
  /// In it, this message translates to:
  /// **'Visualizza la copertura'**
  String get repeaterCoverageCta;

  /// No description provided for @repeaterDetailLosClear.
  ///
  /// In it, this message translates to:
  /// **'Visione ottica libera tra te e il ripetitore'**
  String get repeaterDetailLosClear;

  /// No description provided for @repeaterDetailLosObstructed.
  ///
  /// In it, this message translates to:
  /// **'Visione ottica ostruita dal terreno'**
  String get repeaterDetailLosObstructed;

  /// No description provided for @repeaterDetailTerrainProfile.
  ///
  /// In it, this message translates to:
  /// **'Profilo terreno'**
  String get repeaterDetailTerrainProfile;

  /// No description provided for @repeaterDetailLineOfSight.
  ///
  /// In it, this message translates to:
  /// **'Visione ottica'**
  String get repeaterDetailLineOfSight;

  /// No description provided for @repeaterDetailTotalDistance.
  ///
  /// In it, this message translates to:
  /// **'Distanza'**
  String get repeaterDetailTotalDistance;

  /// No description provided for @repeaterDetailRepeaterElevation.
  ///
  /// In it, this message translates to:
  /// **'Quota ripetitore'**
  String get repeaterDetailRepeaterElevation;

  /// No description provided for @repeaterDetailYourElevation.
  ///
  /// In it, this message translates to:
  /// **'Quota tua'**
  String get repeaterDetailYourElevation;

  /// No description provided for @repeaterDetailYou.
  ///
  /// In it, this message translates to:
  /// **'Tu'**
  String get repeaterDetailYou;

  /// No description provided for @repeaterDetailRepeaterLabel.
  ///
  /// In it, this message translates to:
  /// **'Ripetitore'**
  String get repeaterDetailRepeaterLabel;

  /// No description provided for @repeaterDetailFunFacts.
  ///
  /// In it, this message translates to:
  /// **'Lo sapevi?'**
  String get repeaterDetailFunFacts;

  /// No description provided for @repeaterDetailWavelength.
  ///
  /// In it, this message translates to:
  /// **'Lunghezza d\'onda'**
  String get repeaterDetailWavelength;

  /// No description provided for @repeaterDetailWavelengthValue.
  ///
  /// In it, this message translates to:
  /// **'La lunghezza d\'onda di questo ripetitore è {value}'**
  String repeaterDetailWavelengthValue(String value);

  /// No description provided for @repeaterDetailOscillations.
  ///
  /// In it, this message translates to:
  /// **'Oscillazioni al secondo'**
  String get repeaterDetailOscillations;

  /// No description provided for @repeaterDetailOscillationsValue.
  ///
  /// In it, this message translates to:
  /// **'Il segnale oscilla {value} volte al secondo'**
  String repeaterDetailOscillationsValue(String value);

  /// No description provided for @repeaterDetailPropagationTime.
  ///
  /// In it, this message translates to:
  /// **'Tempo di propagazione'**
  String get repeaterDetailPropagationTime;

  /// No description provided for @repeaterDetailPropagationTimeValue.
  ///
  /// In it, this message translates to:
  /// **'Il tuo segnale impiega {value} ad arrivare al ripetitore'**
  String repeaterDetailPropagationTimeValue(String value);

  /// No description provided for @repeaterDetailWaveCycles.
  ///
  /// In it, this message translates to:
  /// **'Cicli nel tragitto'**
  String get repeaterDetailWaveCycles;

  /// No description provided for @repeaterDetailWaveCyclesValue.
  ///
  /// In it, this message translates to:
  /// **'L\'onda compie {value} cicli completi nel tragitto'**
  String repeaterDetailWaveCyclesValue(String value);

  /// No description provided for @userReportsTitle.
  ///
  /// In it, this message translates to:
  /// **'Le mie attività'**
  String get userReportsTitle;

  /// No description provided for @userReportsTabReports.
  ///
  /// In it, this message translates to:
  /// **'Segnalazioni'**
  String get userReportsTabReports;

  /// No description provided for @userReportsTabSubmissions.
  ///
  /// In it, this message translates to:
  /// **'Nuovi ponti'**
  String get userReportsTabSubmissions;

  /// No description provided for @userReportsFilterAll.
  ///
  /// In it, this message translates to:
  /// **'Tutti'**
  String get userReportsFilterAll;

  /// No description provided for @userReportsFilterOpen.
  ///
  /// In it, this message translates to:
  /// **'Aperte'**
  String get userReportsFilterOpen;

  /// No description provided for @userReportsFilterClosed.
  ///
  /// In it, this message translates to:
  /// **'Chiuse'**
  String get userReportsFilterClosed;

  /// No description provided for @userReportsEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessuna segnalazione inviata'**
  String get userReportsEmpty;

  /// No description provided for @userReportsEmptyDescription.
  ///
  /// In it, this message translates to:
  /// **'Le tue segnalazioni sui ripetitori appariranno qui'**
  String get userReportsEmptyDescription;

  /// No description provided for @userReportsEmptyFiltered.
  ///
  /// In it, this message translates to:
  /// **'Nessuna segnalazione con questo filtro'**
  String get userReportsEmptyFiltered;

  /// No description provided for @userReportsStatusPending.
  ///
  /// In it, this message translates to:
  /// **'In attesa'**
  String get userReportsStatusPending;

  /// No description provided for @userReportsStatusReviewed.
  ///
  /// In it, this message translates to:
  /// **'In revisione'**
  String get userReportsStatusReviewed;

  /// No description provided for @userReportsStatusResolved.
  ///
  /// In it, this message translates to:
  /// **'Risolto'**
  String get userReportsStatusResolved;

  /// No description provided for @userReportsStatusRejected.
  ///
  /// In it, this message translates to:
  /// **'Rifiutato'**
  String get userReportsStatusRejected;

  /// No description provided for @userReportsRetryBanner.
  ///
  /// In it, this message translates to:
  /// **'Impossibile aggiornare l\'elenco'**
  String get userReportsRetryBanner;

  /// No description provided for @userReportsProfileTile.
  ///
  /// In it, this message translates to:
  /// **'I miei report'**
  String get userReportsProfileTile;

  /// No description provided for @userReportsProfileTileSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Visualizza lo stato delle tue segnalazioni'**
  String get userReportsProfileTileSubtitle;

  /// No description provided for @userReportsError.
  ///
  /// In it, this message translates to:
  /// **'Errore durante il caricamento dei report'**
  String get userReportsError;

  /// No description provided for @userReportsCoordinatorResponse.
  ///
  /// In it, this message translates to:
  /// **'Risposta coordinatore'**
  String get userReportsCoordinatorResponse;

  /// No description provided for @userSubmissionsEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessun ponte segnalato'**
  String get userSubmissionsEmpty;

  /// No description provided for @userSubmissionsEmptyDescription.
  ///
  /// In it, this message translates to:
  /// **'I ponti che proponi appariranno qui'**
  String get userSubmissionsEmptyDescription;

  /// No description provided for @userSubmissionsEmptyFiltered.
  ///
  /// In it, this message translates to:
  /// **'Nessun ponte con questo filtro'**
  String get userSubmissionsEmptyFiltered;

  /// No description provided for @userSubmissionsStatusPending.
  ///
  /// In it, this message translates to:
  /// **'In attesa'**
  String get userSubmissionsStatusPending;

  /// No description provided for @userSubmissionsStatusApproved.
  ///
  /// In it, this message translates to:
  /// **'Approvato'**
  String get userSubmissionsStatusApproved;

  /// No description provided for @userSubmissionsStatusRejected.
  ///
  /// In it, this message translates to:
  /// **'Rifiutato'**
  String get userSubmissionsStatusRejected;

  /// No description provided for @userSubmissionsCoordinatorResponse.
  ///
  /// In it, this message translates to:
  /// **'Risposta coordinatore'**
  String get userSubmissionsCoordinatorResponse;

  /// No description provided for @userSubmissionsFrequency.
  ///
  /// In it, this message translates to:
  /// **'Frequenza'**
  String get userSubmissionsFrequency;

  /// No description provided for @potaTitle.
  ///
  /// In it, this message translates to:
  /// **'POTA Spots'**
  String get potaTitle;

  /// No description provided for @potaSearchHint.
  ///
  /// In it, this message translates to:
  /// **'Cerca per attivatore, parco o modo…'**
  String get potaSearchHint;

  /// No description provided for @potaNoSpots.
  ///
  /// In it, this message translates to:
  /// **'Nessuno spot POTA attivo al momento.'**
  String get potaNoSpots;

  /// No description provided for @potaLoadError.
  ///
  /// In it, this message translates to:
  /// **'Impossibile caricare gli spot POTA'**
  String get potaLoadError;

  /// No description provided for @potaRetry.
  ///
  /// In it, this message translates to:
  /// **'Riprova'**
  String get potaRetry;

  /// No description provided for @potaViewAll.
  ///
  /// In it, this message translates to:
  /// **'Vedi tutto'**
  String get potaViewAll;

  /// No description provided for @potaActivator.
  ///
  /// In it, this message translates to:
  /// **'Attivatore'**
  String get potaActivator;

  /// No description provided for @potaFrequency.
  ///
  /// In it, this message translates to:
  /// **'Frequenza'**
  String get potaFrequency;

  /// No description provided for @potaMode.
  ///
  /// In it, this message translates to:
  /// **'Modo'**
  String get potaMode;

  /// No description provided for @potaPark.
  ///
  /// In it, this message translates to:
  /// **'Parco'**
  String get potaPark;

  /// No description provided for @potaReference.
  ///
  /// In it, this message translates to:
  /// **'Riferimento'**
  String get potaReference;

  /// No description provided for @potaSpotter.
  ///
  /// In it, this message translates to:
  /// **'Spottato da'**
  String get potaSpotter;

  /// No description provided for @potaComments.
  ///
  /// In it, this message translates to:
  /// **'Commenti'**
  String get potaComments;

  /// No description provided for @potaLastSpotted.
  ///
  /// In it, this message translates to:
  /// **'Ultimo spot'**
  String get potaLastSpotted;

  /// No description provided for @potaOpenQrz.
  ///
  /// In it, this message translates to:
  /// **'QRZ.com'**
  String get potaOpenQrz;

  /// No description provided for @potaQrzError.
  ///
  /// In it, this message translates to:
  /// **'Impossibile aprire QRZ.com'**
  String get potaQrzError;

  /// No description provided for @potaParkWebsite.
  ///
  /// In it, this message translates to:
  /// **'Sito parco'**
  String get potaParkWebsite;

  /// No description provided for @potaParkType.
  ///
  /// In it, this message translates to:
  /// **'Tipo parco'**
  String get potaParkType;

  /// No description provided for @potaLocation.
  ///
  /// In it, this message translates to:
  /// **'Posizione'**
  String get potaLocation;

  /// No description provided for @potaCountry.
  ///
  /// In it, this message translates to:
  /// **'Paese'**
  String get potaCountry;

  /// No description provided for @potaFirstActivation.
  ///
  /// In it, this message translates to:
  /// **'Prima attivazione'**
  String get potaFirstActivation;

  /// No description provided for @potaBand.
  ///
  /// In it, this message translates to:
  /// **'Banda'**
  String get potaBand;

  /// No description provided for @potaDistanceAway.
  ///
  /// In it, this message translates to:
  /// **'{distance} di distanza'**
  String potaDistanceAway(String distance);

  /// No description provided for @potaSpotsCount.
  ///
  /// In it, this message translates to:
  /// **'{count} spot'**
  String potaSpotsCount(int count);

  /// No description provided for @potaFilterAll.
  ///
  /// In it, this message translates to:
  /// **'Tutte'**
  String get potaFilterAll;

  /// No description provided for @potaFilterBand.
  ///
  /// In it, this message translates to:
  /// **'Banda'**
  String get potaFilterBand;

  /// No description provided for @potaFilterMode.
  ///
  /// In it, this message translates to:
  /// **'Modo'**
  String get potaFilterMode;

  /// No description provided for @potaSortByTime.
  ///
  /// In it, this message translates to:
  /// **'Più recenti'**
  String get potaSortByTime;

  /// No description provided for @potaSortByDistance.
  ///
  /// In it, this message translates to:
  /// **'Più vicini'**
  String get potaSortByDistance;

  /// No description provided for @profileLanguage.
  ///
  /// In it, this message translates to:
  /// **'Lingua'**
  String get profileLanguage;

  /// No description provided for @profileUnitSystem.
  ///
  /// In it, this message translates to:
  /// **'Unità di misura'**
  String get profileUnitSystem;

  /// No description provided for @profileUnitSystemAuto.
  ///
  /// In it, this message translates to:
  /// **'Automatico'**
  String get profileUnitSystemAuto;

  /// No description provided for @profileUnitSystemMetric.
  ///
  /// In it, this message translates to:
  /// **'Metrico'**
  String get profileUnitSystemMetric;

  /// No description provided for @profileUnitSystemImperial.
  ///
  /// In it, this message translates to:
  /// **'Imperiale'**
  String get profileUnitSystemImperial;

  /// No description provided for @profileLanguageSystem.
  ///
  /// In it, this message translates to:
  /// **'Sistema'**
  String get profileLanguageSystem;

  /// No description provided for @profileLanguageItalian.
  ///
  /// In it, this message translates to:
  /// **'Italiano'**
  String get profileLanguageItalian;

  /// No description provided for @profileLanguageEnglish.
  ///
  /// In it, this message translates to:
  /// **'English'**
  String get profileLanguageEnglish;

  /// No description provided for @profileLanguageSpanish.
  ///
  /// In it, this message translates to:
  /// **'Español'**
  String get profileLanguageSpanish;

  /// No description provided for @profileLanguageFrench.
  ///
  /// In it, this message translates to:
  /// **'Français'**
  String get profileLanguageFrench;

  /// No description provided for @profileLanguageGerman.
  ///
  /// In it, this message translates to:
  /// **'Deutsch'**
  String get profileLanguageGerman;

  /// No description provided for @profileLanguagePortuguese.
  ///
  /// In it, this message translates to:
  /// **'Português'**
  String get profileLanguagePortuguese;

  /// No description provided for @profileLanguageDutch.
  ///
  /// In it, this message translates to:
  /// **'Nederlands'**
  String get profileLanguageDutch;

  /// No description provided for @profileLanguagePolish.
  ///
  /// In it, this message translates to:
  /// **'Polski'**
  String get profileLanguagePolish;

  /// No description provided for @profileLanguageRomanian.
  ///
  /// In it, this message translates to:
  /// **'Română'**
  String get profileLanguageRomanian;

  /// No description provided for @profileLanguageSlovenian.
  ///
  /// In it, this message translates to:
  /// **'Slovenščina'**
  String get profileLanguageSlovenian;

  /// No description provided for @profileLanguageCroatian.
  ///
  /// In it, this message translates to:
  /// **'Hrvatski'**
  String get profileLanguageCroatian;

  /// No description provided for @profileLanguageHungarian.
  ///
  /// In it, this message translates to:
  /// **'Magyar'**
  String get profileLanguageHungarian;

  /// No description provided for @profileLanguageCzech.
  ///
  /// In it, this message translates to:
  /// **'Čeština'**
  String get profileLanguageCzech;

  /// No description provided for @profileLanguageSlovak.
  ///
  /// In it, this message translates to:
  /// **'Slovenčina'**
  String get profileLanguageSlovak;

  /// No description provided for @profileLanguageSerbian.
  ///
  /// In it, this message translates to:
  /// **'Srpski'**
  String get profileLanguageSerbian;

  /// No description provided for @onboardingSkip.
  ///
  /// In it, this message translates to:
  /// **'Salta'**
  String get onboardingSkip;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In it, this message translates to:
  /// **'Inizia'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingNext.
  ///
  /// In it, this message translates to:
  /// **'Avanti'**
  String get onboardingNext;

  /// No description provided for @onboardingWelcomeTitle1.
  ///
  /// In it, this message translates to:
  /// **'Trova i ripetitori vicino a te'**
  String get onboardingWelcomeTitle1;

  /// No description provided for @onboardingWelcomeSubtitle1.
  ///
  /// In it, this message translates to:
  /// **'Scopri i ponti radio attivi nella tua zona, con frequenze, toni e dettagli tecnici.'**
  String get onboardingWelcomeSubtitle1;

  /// No description provided for @onboardingWelcomeCredits.
  ///
  /// In it, this message translates to:
  /// **'Dati dei ponti radio forniti da IZ8WNH'**
  String get onboardingWelcomeCredits;

  /// No description provided for @onboardingWelcomeTitle2.
  ///
  /// In it, this message translates to:
  /// **'Filtra per modo'**
  String get onboardingWelcomeTitle2;

  /// No description provided for @onboardingWelcomeSubtitle2.
  ///
  /// In it, this message translates to:
  /// **'Analogico, DMR, C4FM, D-STAR — trova subito il ripetitore che fa per te.'**
  String get onboardingWelcomeSubtitle2;

  /// No description provided for @onboardingWelcomeTitle3.
  ///
  /// In it, this message translates to:
  /// **'Spot POTA in tempo reale'**
  String get onboardingWelcomeTitle3;

  /// No description provided for @onboardingWelcomeSubtitle3.
  ///
  /// In it, this message translates to:
  /// **'Segui le attivazioni Parks on the Air con aggiornamenti live, filtri per banda e distanza.'**
  String get onboardingWelcomeSubtitle3;

  /// No description provided for @onboardingWelcomeTitle4.
  ///
  /// In it, this message translates to:
  /// **'Salva i preferiti'**
  String get onboardingWelcomeTitle4;

  /// No description provided for @onboardingWelcomeSubtitle4.
  ///
  /// In it, this message translates to:
  /// **'Tieni a portata di mano i ripetitori che usi di più per accesso rapido.'**
  String get onboardingWelcomeSubtitle4;

  /// No description provided for @onboardingLocationTitle.
  ///
  /// In it, this message translates to:
  /// **'Posizione'**
  String get onboardingLocationTitle;

  /// No description provided for @onboardingLocationSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Usiamo la tua posizione per mostrarti i ripetitori e le attivazioni POTA vicine.'**
  String get onboardingLocationSubtitle;

  /// No description provided for @onboardingLocationEnable.
  ///
  /// In it, this message translates to:
  /// **'Attiva Posizione'**
  String get onboardingLocationEnable;

  /// No description provided for @onboardingLocationSkip.
  ///
  /// In it, this message translates to:
  /// **'Non ora'**
  String get onboardingLocationSkip;

  /// No description provided for @onboardingDiscoveryTitle.
  ///
  /// In it, this message translates to:
  /// **'Il tuo primo ripetitore'**
  String get onboardingDiscoveryTitle;

  /// No description provided for @onboardingDiscoverySubtitle.
  ///
  /// In it, this message translates to:
  /// **'Ecco cosa c\'è vicino a te!'**
  String get onboardingDiscoverySubtitle;

  /// No description provided for @onboardingDiscoveryViewDetails.
  ///
  /// In it, this message translates to:
  /// **'Vedi Dettagli'**
  String get onboardingDiscoveryViewDetails;

  /// No description provided for @onboardingDiscoveryViewSpot.
  ///
  /// In it, this message translates to:
  /// **'Vedi Spot'**
  String get onboardingDiscoveryViewSpot;

  /// No description provided for @onboardingDiscoveryExploreMap.
  ///
  /// In it, this message translates to:
  /// **'Esplora la Mappa'**
  String get onboardingDiscoveryExploreMap;

  /// No description provided for @onboardingDiscoveryNoLocation.
  ///
  /// In it, this message translates to:
  /// **'Esplora la mappa per trovare ripetitori e attivazioni POTA'**
  String get onboardingDiscoveryNoLocation;

  /// No description provided for @onboardingDiscoveryNearbyRepeater.
  ///
  /// In it, this message translates to:
  /// **'Ripetitore vicino'**
  String get onboardingDiscoveryNearbyRepeater;

  /// No description provided for @onboardingDiscoveryLivePota.
  ///
  /// In it, this message translates to:
  /// **'Spot POTA attivo'**
  String get onboardingDiscoveryLivePota;

  /// No description provided for @onboardingDiscoveryNoRepeaters.
  ///
  /// In it, this message translates to:
  /// **'Nessun ripetitore trovato nelle vicinanze'**
  String get onboardingDiscoveryNoRepeaters;

  /// No description provided for @onboardingTelegramTitle.
  ///
  /// In it, this message translates to:
  /// **'Unisciti alla community'**
  String get onboardingTelegramTitle;

  /// No description provided for @onboardingTelegramSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Entra nel gruppo Telegram di HamQRG per ricevere aggiornamenti, segnalare ripetitori e conoscere altri radioamatori.'**
  String get onboardingTelegramSubtitle;

  /// No description provided for @onboardingTelegramJoin.
  ///
  /// In it, this message translates to:
  /// **'Unisciti al Gruppo Telegram'**
  String get onboardingTelegramJoin;

  /// No description provided for @onboardingTelegramLater.
  ///
  /// In it, this message translates to:
  /// **'Forse dopo'**
  String get onboardingTelegramLater;

  /// No description provided for @onboardingTelegramAlreadyMember.
  ///
  /// In it, this message translates to:
  /// **'Sono già membro'**
  String get onboardingTelegramAlreadyMember;

  /// No description provided for @addRepeaterProfileTile.
  ///
  /// In it, this message translates to:
  /// **'Proponi nuovo ripetitore'**
  String get addRepeaterProfileTile;

  /// No description provided for @addRepeaterProfileTileSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Segnala un ripetitore non ancora presente'**
  String get addRepeaterProfileTileSubtitle;

  /// No description provided for @addRepeaterTitle.
  ///
  /// In it, this message translates to:
  /// **'Nuovo Ripetitore'**
  String get addRepeaterTitle;

  /// No description provided for @addRepeaterHeadline.
  ///
  /// In it, this message translates to:
  /// **'Segnala un ripetitore mancante'**
  String get addRepeaterHeadline;

  /// No description provided for @addRepeaterDescription.
  ///
  /// In it, this message translates to:
  /// **'Compila i dati del ripetitore che vorresti aggiungere. La segnalazione verrà revisionata prima della pubblicazione.'**
  String get addRepeaterDescription;

  /// No description provided for @addRepeaterSectionRepeater.
  ///
  /// In it, this message translates to:
  /// **'Dati ripetitore'**
  String get addRepeaterSectionRepeater;

  /// No description provided for @addRepeaterSectionAccesses.
  ///
  /// In it, this message translates to:
  /// **'Accessi'**
  String get addRepeaterSectionAccesses;

  /// No description provided for @addRepeaterSectionLocation.
  ///
  /// In it, this message translates to:
  /// **'Posizione'**
  String get addRepeaterSectionLocation;

  /// No description provided for @addRepeaterSectionNotes.
  ///
  /// In it, this message translates to:
  /// **'Note'**
  String get addRepeaterSectionNotes;

  /// No description provided for @addRepeaterName.
  ///
  /// In it, this message translates to:
  /// **'Nome'**
  String get addRepeaterName;

  /// No description provided for @addRepeaterNameHint.
  ///
  /// In it, this message translates to:
  /// **'Es. Monte Cimone'**
  String get addRepeaterNameHint;

  /// No description provided for @addRepeaterCallsign.
  ///
  /// In it, this message translates to:
  /// **'Nominativo'**
  String get addRepeaterCallsign;

  /// No description provided for @addRepeaterCallsignHint.
  ///
  /// In it, this message translates to:
  /// **'Es. IR4AB'**
  String get addRepeaterCallsignHint;

  /// No description provided for @addRepeaterNameOrCallsignRequired.
  ///
  /// In it, this message translates to:
  /// **'Inserisci almeno il nome o il nominativo'**
  String get addRepeaterNameOrCallsignRequired;

  /// No description provided for @addRepeaterFrequency.
  ///
  /// In it, this message translates to:
  /// **'Frequenza (MHz)'**
  String get addRepeaterFrequency;

  /// No description provided for @addRepeaterFrequencyHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 145.000 o 145,000'**
  String get addRepeaterFrequencyHint;

  /// No description provided for @addRepeaterFrequencyRequired.
  ///
  /// In it, this message translates to:
  /// **'Frequenza obbligatoria'**
  String get addRepeaterFrequencyRequired;

  /// No description provided for @addRepeaterFrequencyInvalid.
  ///
  /// In it, this message translates to:
  /// **'Frequenza non valida'**
  String get addRepeaterFrequencyInvalid;

  /// No description provided for @addRepeaterShift.
  ///
  /// In it, this message translates to:
  /// **'Shift (MHz)'**
  String get addRepeaterShift;

  /// No description provided for @addRepeaterShiftHint.
  ///
  /// In it, this message translates to:
  /// **'Es. -0.600 o -0,600'**
  String get addRepeaterShiftHint;

  /// No description provided for @addRepeaterRegion.
  ///
  /// In it, this message translates to:
  /// **'Regione'**
  String get addRepeaterRegion;

  /// No description provided for @addRepeaterRegionHint.
  ///
  /// In it, this message translates to:
  /// **'Es. Emilia-Romagna'**
  String get addRepeaterRegionHint;

  /// No description provided for @addRepeaterProvinceCode.
  ///
  /// In it, this message translates to:
  /// **'Provincia'**
  String get addRepeaterProvinceCode;

  /// No description provided for @addRepeaterProvinceCodeHint.
  ///
  /// In it, this message translates to:
  /// **'Es. MO'**
  String get addRepeaterProvinceCodeHint;

  /// No description provided for @addRepeaterLocality.
  ///
  /// In it, this message translates to:
  /// **'Località'**
  String get addRepeaterLocality;

  /// No description provided for @addRepeaterLocalityHint.
  ///
  /// In it, this message translates to:
  /// **'Es. Fanano'**
  String get addRepeaterLocalityHint;

  /// No description provided for @addRepeaterLatitude.
  ///
  /// In it, this message translates to:
  /// **'Latitudine'**
  String get addRepeaterLatitude;

  /// No description provided for @addRepeaterLatitudeHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 44.2100'**
  String get addRepeaterLatitudeHint;

  /// No description provided for @addRepeaterLongitude.
  ///
  /// In it, this message translates to:
  /// **'Longitudine'**
  String get addRepeaterLongitude;

  /// No description provided for @addRepeaterLongitudeHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 10.7900'**
  String get addRepeaterLongitudeHint;

  /// No description provided for @addRepeaterLocator.
  ///
  /// In it, this message translates to:
  /// **'Locator'**
  String get addRepeaterLocator;

  /// No description provided for @addRepeaterLocatorHint.
  ///
  /// In it, this message translates to:
  /// **'Es. JN54QF'**
  String get addRepeaterLocatorHint;

  /// No description provided for @addRepeaterNotes.
  ///
  /// In it, this message translates to:
  /// **'Note aggiuntive'**
  String get addRepeaterNotes;

  /// No description provided for @addRepeaterNotesHint.
  ///
  /// In it, this message translates to:
  /// **'Informazioni aggiuntive sul ripetitore...'**
  String get addRepeaterNotesHint;

  /// No description provided for @addRepeaterAddAccess.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi accesso'**
  String get addRepeaterAddAccess;

  /// No description provided for @addRepeaterRemoveAccess.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi'**
  String get addRepeaterRemoveAccess;

  /// No description provided for @addRepeaterAccessMode.
  ///
  /// In it, this message translates to:
  /// **'Modo'**
  String get addRepeaterAccessMode;

  /// No description provided for @addRepeaterAccessCtcssTx.
  ///
  /// In it, this message translates to:
  /// **'CTCSS TX (Hz)'**
  String get addRepeaterAccessCtcssTx;

  /// No description provided for @addRepeaterAccessCtcssTxHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 88.5'**
  String get addRepeaterAccessCtcssTxHint;

  /// No description provided for @addRepeaterAccessCtcssRx.
  ///
  /// In it, this message translates to:
  /// **'CTCSS RX (Hz)'**
  String get addRepeaterAccessCtcssRx;

  /// No description provided for @addRepeaterAccessCtcssRxHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 88.5'**
  String get addRepeaterAccessCtcssRxHint;

  /// No description provided for @addRepeaterAccessDcsCode.
  ///
  /// In it, this message translates to:
  /// **'Codice DCS'**
  String get addRepeaterAccessDcsCode;

  /// No description provided for @addRepeaterAccessDcsCodeHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 23'**
  String get addRepeaterAccessDcsCodeHint;

  /// No description provided for @addRepeaterAccessColorCode.
  ///
  /// In it, this message translates to:
  /// **'Color Code'**
  String get addRepeaterAccessColorCode;

  /// No description provided for @addRepeaterAccessColorCodeHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 1'**
  String get addRepeaterAccessColorCodeHint;

  /// No description provided for @addRepeaterAccessTalkgroup.
  ///
  /// In it, this message translates to:
  /// **'Talkgroup'**
  String get addRepeaterAccessTalkgroup;

  /// No description provided for @addRepeaterAccessTalkgroupHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 222801'**
  String get addRepeaterAccessTalkgroupHint;

  /// No description provided for @addRepeaterAccessDgId.
  ///
  /// In it, this message translates to:
  /// **'DG-ID'**
  String get addRepeaterAccessDgId;

  /// No description provided for @addRepeaterAccessDgIdHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 0'**
  String get addRepeaterAccessDgIdHint;

  /// No description provided for @addRepeaterAccessNodeId.
  ///
  /// In it, this message translates to:
  /// **'Node ID'**
  String get addRepeaterAccessNodeId;

  /// No description provided for @addRepeaterAccessNodeIdHint.
  ///
  /// In it, this message translates to:
  /// **'Es. 1234'**
  String get addRepeaterAccessNodeIdHint;

  /// No description provided for @addRepeaterAccessNetworkName.
  ///
  /// In it, this message translates to:
  /// **'Nome rete'**
  String get addRepeaterAccessNetworkName;

  /// No description provided for @addRepeaterAccessNetworkNameHint.
  ///
  /// In it, this message translates to:
  /// **'Es. BM Italia'**
  String get addRepeaterAccessNetworkNameHint;

  /// No description provided for @addRepeaterAccessNotes.
  ///
  /// In it, this message translates to:
  /// **'Note accesso'**
  String get addRepeaterAccessNotes;

  /// No description provided for @addRepeaterAccessNotesHint.
  ///
  /// In it, this message translates to:
  /// **'Note specifiche per questo accesso...'**
  String get addRepeaterAccessNotesHint;

  /// No description provided for @addRepeaterConfirmCheckbox.
  ///
  /// In it, this message translates to:
  /// **'Confermo che queste informazioni sono corrette in base alla mia conoscenza.'**
  String get addRepeaterConfirmCheckbox;

  /// No description provided for @addRepeaterVerifiedTitle.
  ///
  /// In it, this message translates to:
  /// **'Segnalazione verificata'**
  String get addRepeaterVerifiedTitle;

  /// No description provided for @addRepeaterVerifiedDescription.
  ///
  /// In it, this message translates to:
  /// **'La tua segnalazione sarà revisionata dal team prima di essere pubblicata nel database.'**
  String get addRepeaterVerifiedDescription;

  /// No description provided for @addRepeaterSubmit.
  ///
  /// In it, this message translates to:
  /// **'Invia'**
  String get addRepeaterSubmit;

  /// No description provided for @addRepeaterSuccess.
  ///
  /// In it, this message translates to:
  /// **'Segnalazione inviata con successo!'**
  String get addRepeaterSuccess;

  /// No description provided for @addRepeaterError.
  ///
  /// In it, this message translates to:
  /// **'Errore durante l\'invio della segnalazione'**
  String get addRepeaterError;

  /// No description provided for @addRepeaterAtLeastOneAccess.
  ///
  /// In it, this message translates to:
  /// **'Aggiungi almeno un accesso'**
  String get addRepeaterAtLeastOneAccess;

  /// No description provided for @addRepeaterAccessNumber.
  ///
  /// In it, this message translates to:
  /// **'Accesso {number}'**
  String addRepeaterAccessNumber(int number);

  /// No description provided for @changelog1017PotaSpots.
  ///
  /// In it, this message translates to:
  /// **'Spot POTA in tempo reale con mappa e dettagli parco'**
  String get changelog1017PotaSpots;

  /// No description provided for @changelog1017SubmitRepeater.
  ///
  /// In it, this message translates to:
  /// **'Proponi un nuovo ripetitore direttamente dall\'app'**
  String get changelog1017SubmitRepeater;

  /// No description provided for @changelog1017MultiLanguage.
  ///
  /// In it, this message translates to:
  /// **'App disponibile in inglese, spagnolo e francese'**
  String get changelog1017MultiLanguage;

  /// No description provided for @changelog1017Onboarding.
  ///
  /// In it, this message translates to:
  /// **'Nuova esperienza di primo avvio'**
  String get changelog1017Onboarding;

  /// No description provided for @changelog1017ReportAnonymous.
  ///
  /// In it, this message translates to:
  /// **'Segnalazioni disponibili anche senza registrazione'**
  String get changelog1017ReportAnonymous;

  /// No description provided for @changelog1020ClusterSpots.
  ///
  /// In it, this message translates to:
  /// **'Cluster spot in tempo reale: vedi chi è in ascolto sui ripetitori, con notifiche e preferenze'**
  String get changelog1020ClusterSpots;

  /// No description provided for @changelog1020DetailTabs.
  ///
  /// In it, this message translates to:
  /// **'Pagina ripetitore con tab Info, Cluster e Community'**
  String get changelog1020DetailTabs;

  /// No description provided for @changelog1020TabletLayout.
  ///
  /// In it, this message translates to:
  /// **'Layout ottimizzato per tablet'**
  String get changelog1020TabletLayout;

  /// No description provided for @changelog110Coverage.
  ///
  /// In it, this message translates to:
  /// **'Mappa di copertura dei ripetitori: vedi il segnale stimato direttamente sulla mappa (PRO)'**
  String get changelog110Coverage;

  /// No description provided for @changelog110Reachable.
  ///
  /// In it, this message translates to:
  /// **'Cosa raggiungi da qui: scopri i ponti che prendi dalla tua posizione, con segnale e profilo del terreno (PRO)'**
  String get changelog110Reachable;

  /// No description provided for @changelogTitle.
  ///
  /// In it, this message translates to:
  /// **'Novità'**
  String get changelogTitle;

  /// No description provided for @changelogSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Ecco cosa c\'è di nuovo in questa versione'**
  String get changelogSubtitle;

  /// No description provided for @changelogCategoryAdded.
  ///
  /// In it, this message translates to:
  /// **'Nuovo'**
  String get changelogCategoryAdded;

  /// No description provided for @changelogCategoryImproved.
  ///
  /// In it, this message translates to:
  /// **'Migliorato'**
  String get changelogCategoryImproved;

  /// No description provided for @changelogCategoryFixed.
  ///
  /// In it, this message translates to:
  /// **'Corretto'**
  String get changelogCategoryFixed;

  /// No description provided for @changelogDismiss.
  ///
  /// In it, this message translates to:
  /// **'Ho capito!'**
  String get changelogDismiss;

  /// No description provided for @spotCreateTitle.
  ///
  /// In it, this message translates to:
  /// **'Spottati'**
  String get spotCreateTitle;

  /// No description provided for @spotCreateOtherTitle.
  ///
  /// In it, this message translates to:
  /// **'Spotta un OM'**
  String get spotCreateOtherTitle;

  /// No description provided for @spotCreateDuration.
  ///
  /// In it, this message translates to:
  /// **'Durata'**
  String get spotCreateDuration;

  /// No description provided for @spotCreateAccess.
  ///
  /// In it, this message translates to:
  /// **'Modalità (opzionale)'**
  String get spotCreateAccess;

  /// No description provided for @spotCreateCallsign.
  ///
  /// In it, this message translates to:
  /// **'Callsign dell\'OM sentito'**
  String get spotCreateCallsign;

  /// No description provided for @spotCreateCallsignHint.
  ///
  /// In it, this message translates to:
  /// **'Es. IZ0ABC'**
  String get spotCreateCallsignHint;

  /// No description provided for @spotCreateConfirm.
  ///
  /// In it, this message translates to:
  /// **'Conferma'**
  String get spotCreateConfirm;

  /// No description provided for @spotCreateSuccessSelf.
  ///
  /// In it, this message translates to:
  /// **'Spot creato!'**
  String get spotCreateSuccessSelf;

  /// No description provided for @spotCreateSuccessOther.
  ///
  /// In it, this message translates to:
  /// **'OM spottato!'**
  String get spotCreateSuccessOther;

  /// No description provided for @spotActiveYou.
  ///
  /// In it, this message translates to:
  /// **'Sei spottato'**
  String get spotActiveYou;

  /// No description provided for @spotActiveClose.
  ///
  /// In it, this message translates to:
  /// **'Chiudi spot'**
  String get spotActiveClose;

  /// No description provided for @spotActiveOn.
  ///
  /// In it, this message translates to:
  /// **'su {repeaterName}'**
  String spotActiveOn(String repeaterName);

  /// No description provided for @spotActiveNone.
  ///
  /// In it, this message translates to:
  /// **'Nessuno spottato al momento'**
  String get spotActiveNone;

  /// No description provided for @spotActiveCta.
  ///
  /// In it, this message translates to:
  /// **'Spottati tu!'**
  String get spotActiveCta;

  /// No description provided for @spotActiveSection.
  ///
  /// In it, this message translates to:
  /// **'Spot attivi'**
  String get spotActiveSection;

  /// No description provided for @spotHistorySection.
  ///
  /// In it, this message translates to:
  /// **'Storico spot'**
  String get spotHistorySection;

  /// No description provided for @spotListTitle.
  ///
  /// In it, this message translates to:
  /// **'Ultimi spot'**
  String get spotListTitle;

  /// No description provided for @spotListViewAll.
  ///
  /// In it, this message translates to:
  /// **'Vedi tutti'**
  String get spotListViewAll;

  /// No description provided for @spotListBadgeActive.
  ///
  /// In it, this message translates to:
  /// **'In ascolto'**
  String get spotListBadgeActive;

  /// No description provided for @spotListBadgeClosed.
  ///
  /// In it, this message translates to:
  /// **'Concluso'**
  String get spotListBadgeClosed;

  /// No description provided for @spotListBadgeReport.
  ///
  /// In it, this message translates to:
  /// **'Segnalazione'**
  String get spotListBadgeReport;

  /// No description provided for @spotListEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessuno spot nelle ultime 24 ore'**
  String get spotListEmpty;

  /// No description provided for @spotListSpottedBy.
  ///
  /// In it, this message translates to:
  /// **'Segnalato da {callsign}'**
  String spotListSpottedBy(String callsign);

  /// No description provided for @spotNotificationToggle.
  ///
  /// In it, this message translates to:
  /// **'Notifiche cluster'**
  String get spotNotificationToggle;

  /// No description provided for @spotNotificationDisabled.
  ///
  /// In it, this message translates to:
  /// **'Notifiche cluster disattivate nelle impostazioni profilo'**
  String get spotNotificationDisabled;

  /// No description provided for @spotNotificationPerFavorite.
  ///
  /// In it, this message translates to:
  /// **'Notifiche spot'**
  String get spotNotificationPerFavorite;

  /// No description provided for @spotPreviousClosed.
  ///
  /// In it, this message translates to:
  /// **'Il tuo spot precedente non è più attivo'**
  String get spotPreviousClosed;

  /// No description provided for @spotErrorAuthRequired.
  ///
  /// In it, this message translates to:
  /// **'Devi effettuare l\'accesso.'**
  String get spotErrorAuthRequired;

  /// No description provided for @spotErrorCallsignRequired.
  ///
  /// In it, this message translates to:
  /// **'Imposta il tuo callsign nel profilo per usare il cluster.'**
  String get spotErrorCallsignRequired;

  /// No description provided for @spotErrorInvalidDuration.
  ///
  /// In it, this message translates to:
  /// **'La durata deve essere tra 5 e 60 minuti.'**
  String get spotErrorInvalidDuration;

  /// No description provided for @spotErrorRepeaterNotFound.
  ///
  /// In it, this message translates to:
  /// **'Ponte non trovato.'**
  String get spotErrorRepeaterNotFound;

  /// No description provided for @spotErrorInvalidAccess.
  ///
  /// In it, this message translates to:
  /// **'Modalità di accesso non valida per questo ponte.'**
  String get spotErrorInvalidAccess;

  /// No description provided for @spotErrorSpotNotFound.
  ///
  /// In it, this message translates to:
  /// **'Spot non trovato.'**
  String get spotErrorSpotNotFound;

  /// No description provided for @spotErrorForbidden.
  ///
  /// In it, this message translates to:
  /// **'Non puoi chiudere uno spot che non è tuo.'**
  String get spotErrorForbidden;

  /// No description provided for @spotErrorAlreadyClosed.
  ///
  /// In it, this message translates to:
  /// **'Lo spot è già stato chiuso.'**
  String get spotErrorAlreadyClosed;

  /// No description provided for @spotErrorGeneric.
  ///
  /// In it, this message translates to:
  /// **'Errore nella creazione dello spot. Riprova.'**
  String get spotErrorGeneric;

  /// No description provided for @spotAccessUnavailable.
  ///
  /// In it, this message translates to:
  /// **'(modalità non più disponibile)'**
  String get spotAccessUnavailable;

  /// No description provided for @spotDurationMinutes.
  ///
  /// In it, this message translates to:
  /// **'{minutes} min'**
  String spotDurationMinutes(int minutes);

  /// No description provided for @sotaTitle.
  ///
  /// In it, this message translates to:
  /// **'SOTA Spots'**
  String get sotaTitle;

  /// No description provided for @sotaListEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessuno spot SOTA al momento'**
  String get sotaListEmpty;

  /// No description provided for @sotaLoadError.
  ///
  /// In it, this message translates to:
  /// **'Errore nel caricamento spot SOTA'**
  String get sotaLoadError;

  /// No description provided for @sotaRetry.
  ///
  /// In it, this message translates to:
  /// **'Riprova'**
  String get sotaRetry;

  /// No description provided for @sotaSummitPursuit.
  ///
  /// In it, this message translates to:
  /// **'Vista verso la cima'**
  String get sotaSummitPursuit;

  /// No description provided for @sotaLosClear.
  ///
  /// In it, this message translates to:
  /// **'Vista libera'**
  String get sotaLosClear;

  /// No description provided for @sotaLosObstructed.
  ///
  /// In it, this message translates to:
  /// **'Possibile ostruzione'**
  String get sotaLosObstructed;

  /// No description provided for @sotaLosObstructionAt.
  ///
  /// In it, this message translates to:
  /// **'Ostacolo a {distance}, +{height}'**
  String sotaLosObstructionAt(String distance, String height);

  /// No description provided for @sotaPointsBadge.
  ///
  /// In it, this message translates to:
  /// **'{count} pt'**
  String sotaPointsBadge(int count);

  /// No description provided for @sotaFilterAll.
  ///
  /// In it, this message translates to:
  /// **'Tutti'**
  String get sotaFilterAll;

  /// No description provided for @spotsFiltersTitle.
  ///
  /// In it, this message translates to:
  /// **'Filtri'**
  String get spotsFiltersTitle;

  /// No description provided for @spotsFilterBand.
  ///
  /// In it, this message translates to:
  /// **'Banda'**
  String get spotsFilterBand;

  /// No description provided for @spotsFilterMode.
  ///
  /// In it, this message translates to:
  /// **'Modo'**
  String get spotsFilterMode;

  /// No description provided for @spotsFilterAll.
  ///
  /// In it, this message translates to:
  /// **'Tutti'**
  String get spotsFilterAll;

  /// No description provided for @spotsFiltersReset.
  ///
  /// In it, this message translates to:
  /// **'Azzera filtri'**
  String get spotsFiltersReset;

  /// No description provided for @sotaSortByTime.
  ///
  /// In it, this message translates to:
  /// **'Tempo'**
  String get sotaSortByTime;

  /// No description provided for @sotaSortByDistance.
  ///
  /// In it, this message translates to:
  /// **'Distanza'**
  String get sotaSortByDistance;

  /// No description provided for @sotaFilterPoints.
  ///
  /// In it, this message translates to:
  /// **'Punti'**
  String get sotaFilterPoints;

  /// No description provided for @sotaFilterAssociation.
  ///
  /// In it, this message translates to:
  /// **'Paese'**
  String get sotaFilterAssociation;

  /// No description provided for @sotaSpotQrt.
  ///
  /// In it, this message translates to:
  /// **'QRT'**
  String get sotaSpotQrt;

  /// No description provided for @sotaSummitInvalidFrom.
  ///
  /// In it, this message translates to:
  /// **'Cima non più valida dal {date}'**
  String sotaSummitInvalidFrom(String date);

  /// No description provided for @sotaSummitRestrictions.
  ///
  /// In it, this message translates to:
  /// **'Accesso con restrizioni'**
  String get sotaSummitRestrictions;

  /// No description provided for @sotaPursuitNoLocation.
  ///
  /// In it, this message translates to:
  /// **'Attiva la posizione per vedere il profilo verso la cima'**
  String get sotaPursuitNoLocation;

  /// No description provided for @sotaPursuitTooClose.
  ///
  /// In it, this message translates to:
  /// **'Sei praticamente sulla cima'**
  String get sotaPursuitTooClose;

  /// No description provided for @sotaPursuitTooFar.
  ///
  /// In it, this message translates to:
  /// **'Cima troppo distante per il profilo di terreno'**
  String get sotaPursuitTooFar;

  /// No description provided for @sotaPursuitError.
  ///
  /// In it, this message translates to:
  /// **'Impossibile calcolare il profilo. Riprova.'**
  String get sotaPursuitError;

  /// No description provided for @sotaPursuitLoading.
  ///
  /// In it, this message translates to:
  /// **'Calcolo profilo altimetrico…'**
  String get sotaPursuitLoading;

  /// No description provided for @sotaCopyFrequency.
  ///
  /// In it, this message translates to:
  /// **'Copia frequenza'**
  String get sotaCopyFrequency;

  /// No description provided for @sotaOpenOnMap.
  ///
  /// In it, this message translates to:
  /// **'Apri sulla mappa'**
  String get sotaOpenOnMap;

  /// No description provided for @sotaShare.
  ///
  /// In it, this message translates to:
  /// **'Condividi'**
  String get sotaShare;

  /// No description provided for @sotaViewAll.
  ///
  /// In it, this message translates to:
  /// **'Vedi tutti'**
  String get sotaViewAll;

  /// No description provided for @sotaTabDashboard.
  ///
  /// In it, this message translates to:
  /// **'SOTA'**
  String get sotaTabDashboard;

  /// No description provided for @sotaIntroEmpty.
  ///
  /// In it, this message translates to:
  /// **'SOTA: Summits On The Air. Insegui i radioamatori che attivano cime montane.'**
  String get sotaIntroEmpty;

  /// No description provided for @sotaSpotCount.
  ///
  /// In it, this message translates to:
  /// **'{count} spot'**
  String sotaSpotCount(int count);

  /// No description provided for @sotaActivator.
  ///
  /// In it, this message translates to:
  /// **'Attivatore'**
  String get sotaActivator;

  /// No description provided for @sotaSummit.
  ///
  /// In it, this message translates to:
  /// **'Cima'**
  String get sotaSummit;

  /// No description provided for @sotaAssociation.
  ///
  /// In it, this message translates to:
  /// **'Associazione'**
  String get sotaAssociation;

  /// No description provided for @sotaRegion.
  ///
  /// In it, this message translates to:
  /// **'Regione'**
  String get sotaRegion;

  /// No description provided for @sotaLocator.
  ///
  /// In it, this message translates to:
  /// **'Locatore'**
  String get sotaLocator;

  /// No description provided for @sotaDistance.
  ///
  /// In it, this message translates to:
  /// **'Distanza'**
  String get sotaDistance;

  /// No description provided for @sotaBearing.
  ///
  /// In it, this message translates to:
  /// **'Direzione'**
  String get sotaBearing;

  /// No description provided for @sotaElevationDelta.
  ///
  /// In it, this message translates to:
  /// **'Dislivello'**
  String get sotaElevationDelta;

  /// No description provided for @sotaRemoveFilters.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi filtri'**
  String get sotaRemoveFilters;

  /// No description provided for @sotaPointsTitle.
  ///
  /// In it, this message translates to:
  /// **'Punti'**
  String get sotaPointsTitle;

  /// No description provided for @sotaSpotInfo.
  ///
  /// In it, this message translates to:
  /// **'Info spot'**
  String get sotaSpotInfo;

  /// No description provided for @sotaTime.
  ///
  /// In it, this message translates to:
  /// **'Orario'**
  String get sotaTime;

  /// No description provided for @sotaCopiedToClipboard.
  ///
  /// In it, this message translates to:
  /// **'Frequenza copiata'**
  String get sotaCopiedToClipboard;

  /// No description provided for @sotaPointsAbove.
  ///
  /// In it, this message translates to:
  /// **'{count}+ pt'**
  String sotaPointsAbove(int count);

  /// No description provided for @sotaFilterPointsAll.
  ///
  /// In it, this message translates to:
  /// **'Punti: tutti'**
  String get sotaFilterPointsAll;

  /// No description provided for @reachSheetError.
  ///
  /// In it, this message translates to:
  /// **'Impossibile calcolare i ponti raggiungibili.'**
  String get reachSheetError;

  /// No description provided for @reachSheetCount.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, =1{Raggiungi 1 ponte} other{Raggiungi {count} ponti}}'**
  String reachSheetCount(int count);

  /// No description provided for @reachSheetSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Dalla tua posizione, ordinati per segnale'**
  String get reachSheetSubtitle;

  /// No description provided for @reachSheetEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessun ponte raggiungibile nei dintorni.'**
  String get reachSheetEmpty;

  /// No description provided for @reachBadgeTitle.
  ///
  /// In it, this message translates to:
  /// **'Lo raggiungi da qui?'**
  String get reachBadgeTitle;

  /// No description provided for @reachBadgeSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Scopri se questo ponte ti copre e con che segnale'**
  String get reachBadgeSubtitle;

  /// No description provided for @reachDiscoverCta.
  ///
  /// In it, this message translates to:
  /// **'Scoprilo con PRO'**
  String get reachDiscoverCta;

  /// No description provided for @reachReachable.
  ///
  /// In it, this message translates to:
  /// **'Lo raggiungi'**
  String get reachReachable;

  /// No description provided for @reachOutOfCoverage.
  ///
  /// In it, this message translates to:
  /// **'Fuori copertura'**
  String get reachOutOfCoverage;

  /// No description provided for @reachReachableDetail.
  ///
  /// In it, this message translates to:
  /// **'{signal} · {distance} · tocca per il profilo'**
  String reachReachableDetail(String signal, String distance);

  /// No description provided for @reachDistanceFromHere.
  ///
  /// In it, this message translates to:
  /// **'{distance} da qui'**
  String reachDistanceFromHere(String distance);

  /// No description provided for @reachComputing.
  ///
  /// In it, this message translates to:
  /// **'Calcolo copertura…'**
  String get reachComputing;

  /// No description provided for @reachRepeaterFallback.
  ///
  /// In it, this message translates to:
  /// **'Ponte'**
  String get reachRepeaterFallback;

  /// No description provided for @reachMapButton.
  ///
  /// In it, this message translates to:
  /// **'Cosa raggiungi?'**
  String get reachMapButton;

  /// No description provided for @reachUpsellTitle.
  ///
  /// In it, this message translates to:
  /// **'Cosa raggiungi da qui? 📡'**
  String get reachUpsellTitle;

  /// No description provided for @reachUpsellBody.
  ///
  /// In it, this message translates to:
  /// **'Scopri in tempo reale TUTTI i ponti che prendi dalla tua posizione — con segnale previsto e profilo del terreno. Quanti ne raggiungi davvero da dove sei adesso?'**
  String get reachUpsellBody;

  /// No description provided for @reachUpsellLater.
  ///
  /// In it, this message translates to:
  /// **'Più tardi'**
  String get reachUpsellLater;

  /// No description provided for @linkProfileObstructed.
  ///
  /// In it, this message translates to:
  /// **'Ostacolo sul percorso (segnale per diffrazione)'**
  String get linkProfileObstructed;

  /// No description provided for @linkProfileClear.
  ///
  /// In it, this message translates to:
  /// **'Vista diretta libera'**
  String get linkProfileClear;

  /// No description provided for @linkProfileCaption.
  ///
  /// In it, this message translates to:
  /// **'Profilo del terreno e linea di vista · TX {tx} · RX {rx}'**
  String linkProfileCaption(String tx, String rx);

  /// No description provided for @proUnlockCta.
  ///
  /// In it, this message translates to:
  /// **'Sblocca con PRO'**
  String get proUnlockCta;

  /// No description provided for @proWelcomeTitle.
  ///
  /// In it, this message translates to:
  /// **'Benvenuto in PRO! 🎉'**
  String get proWelcomeTitle;

  /// No description provided for @proWelcomeBody.
  ///
  /// In it, this message translates to:
  /// **'Hai sbloccato la mappa di copertura, i ponti che raggiungi dalla tua posizione e tutte le funzioni PRO. 📡'**
  String get proWelcomeBody;

  /// No description provided for @proWelcomeCta.
  ///
  /// In it, this message translates to:
  /// **'Inizia a esplorare'**
  String get proWelcomeCta;

  /// No description provided for @commonCancel.
  ///
  /// In it, this message translates to:
  /// **'Annulla'**
  String get commonCancel;

  /// No description provided for @commonDelete.
  ///
  /// In it, this message translates to:
  /// **'Cancella'**
  String get commonDelete;

  /// No description provided for @commonEdit.
  ///
  /// In it, this message translates to:
  /// **'Modifica'**
  String get commonEdit;

  /// No description provided for @commonOpenSettings.
  ///
  /// In it, this message translates to:
  /// **'Apri impostazioni'**
  String get commonOpenSettings;

  /// No description provided for @commonFieldRequired.
  ///
  /// In it, this message translates to:
  /// **'Campo obbligatorio'**
  String get commonFieldRequired;

  /// No description provided for @fieldName.
  ///
  /// In it, this message translates to:
  /// **'Nome'**
  String get fieldName;

  /// No description provided for @fieldAddress.
  ///
  /// In it, this message translates to:
  /// **'Indirizzo'**
  String get fieldAddress;

  /// No description provided for @fieldCity.
  ///
  /// In it, this message translates to:
  /// **'Città'**
  String get fieldCity;

  /// No description provided for @fieldDescription.
  ///
  /// In it, this message translates to:
  /// **'Descrizione'**
  String get fieldDescription;

  /// No description provided for @fieldYear.
  ///
  /// In it, this message translates to:
  /// **'Anno'**
  String get fieldYear;

  /// No description provided for @fieldSelectDateHint.
  ///
  /// In it, this message translates to:
  /// **'Seleziona una data'**
  String get fieldSelectDateHint;

  /// No description provided for @validationInvalidYear.
  ///
  /// In it, this message translates to:
  /// **'Seleziona un anno valido'**
  String get validationInvalidYear;

  /// No description provided for @validationPasswordMinLength.
  ///
  /// In it, this message translates to:
  /// **'La password deve essere lunga almeno 6 caratteri'**
  String get validationPasswordMinLength;

  /// No description provided for @permissionsMissingTitle.
  ///
  /// In it, this message translates to:
  /// **'Mancano i permessi!'**
  String get permissionsMissingTitle;

  /// No description provided for @imageUploadError.
  ///
  /// In it, this message translates to:
  /// **'Errore durante il caricamento dell\'immagine'**
  String get imageUploadError;

  /// No description provided for @uploadImageLabel.
  ///
  /// In it, this message translates to:
  /// **'Carica immagine'**
  String get uploadImageLabel;

  /// No description provided for @sourceGallery.
  ///
  /// In it, this message translates to:
  /// **'Galleria'**
  String get sourceGallery;

  /// No description provided for @sourceCamera.
  ///
  /// In it, this message translates to:
  /// **'Fotocamera'**
  String get sourceCamera;

  /// No description provided for @changePasswordTitle.
  ///
  /// In it, this message translates to:
  /// **'Cambia Password'**
  String get changePasswordTitle;

  /// No description provided for @fieldNewPassword.
  ///
  /// In it, this message translates to:
  /// **'Nuova Password'**
  String get fieldNewPassword;

  /// No description provided for @fieldConfirmNewPassword.
  ///
  /// In it, this message translates to:
  /// **'Conferma Nuova Password'**
  String get fieldConfirmNewPassword;

  /// No description provided for @validationPasswordsNoMatch.
  ///
  /// In it, this message translates to:
  /// **'Le password non corrispondono'**
  String get validationPasswordsNoMatch;

  /// No description provided for @passwordChangedSuccess.
  ///
  /// In it, this message translates to:
  /// **'Password cambiata con successo'**
  String get passwordChangedSuccess;

  /// No description provided for @errorWithMessage.
  ///
  /// In it, this message translates to:
  /// **'Errore: {message}'**
  String errorWithMessage(String message);

  /// No description provided for @updateRequiredTitle.
  ///
  /// In it, this message translates to:
  /// **'Aggiornamento richiesto'**
  String get updateRequiredTitle;

  /// No description provided for @updateRequiredAction.
  ///
  /// In it, this message translates to:
  /// **'Aggiorna ora'**
  String get updateRequiredAction;

  /// No description provided for @yearPickerTitle.
  ///
  /// In it, this message translates to:
  /// **'Seleziona l\'anno'**
  String get yearPickerTitle;

  /// No description provided for @repeaterTabInfo.
  ///
  /// In it, this message translates to:
  /// **'Info'**
  String get repeaterTabInfo;

  /// No description provided for @repeaterTabCluster.
  ///
  /// In it, this message translates to:
  /// **'Cluster'**
  String get repeaterTabCluster;

  /// No description provided for @repeaterTabCommunity.
  ///
  /// In it, this message translates to:
  /// **'Community'**
  String get repeaterTabCommunity;

  /// No description provided for @updateRequiredBody.
  ///
  /// In it, this message translates to:
  /// **'È disponibile una nuova versione dell\'app. Aggiorna per continuare a utilizzare l\'applicazione.'**
  String get updateRequiredBody;

  /// No description provided for @errorOpeningStore.
  ///
  /// In it, this message translates to:
  /// **'Errore durante l\'apertura dello store'**
  String get errorOpeningStore;

  /// No description provided for @deleteConfirmTitle.
  ///
  /// In it, this message translates to:
  /// **'Conferma cancellazione'**
  String get deleteConfirmTitle;

  /// No description provided for @deleteConfirmContent.
  ///
  /// In it, this message translates to:
  /// **'Sei sicuro di voler cancellare?'**
  String get deleteConfirmContent;

  /// No description provided for @cameraPermissionRationale.
  ///
  /// In it, this message translates to:
  /// **'Per scattare una foto, consenti l\'accesso alla fotocamera dalle impostazioni.'**
  String get cameraPermissionRationale;

  /// No description provided for @coverageSearchHint.
  ///
  /// In it, this message translates to:
  /// **'Cerca una località o incolla coordinate'**
  String get coverageSearchHint;

  /// No description provided for @coverageSearchRecentTitle.
  ///
  /// In it, this message translates to:
  /// **'Ricerche recenti'**
  String get coverageSearchRecentTitle;

  /// No description provided for @coverageSearchNoResults.
  ///
  /// In it, this message translates to:
  /// **'Nessun luogo trovato'**
  String get coverageSearchNoResults;

  /// No description provided for @coverageSearchTip.
  ///
  /// In it, this message translates to:
  /// **'Puoi incollare coordinate (46.4879, 11.8123) o tenere premuto sulla mappa'**
  String get coverageSearchTip;

  /// No description provided for @coverageSearchErrorOutOfRange.
  ///
  /// In it, this message translates to:
  /// **'Coordinate fuori intervallo: latitudine ±90, longitudine ±180'**
  String get coverageSearchErrorOutOfRange;

  /// No description provided for @coverageSearchErrorOffline.
  ///
  /// In it, this message translates to:
  /// **'Nessuna connessione: la ricerca di località richiede rete'**
  String get coverageSearchErrorOffline;

  /// No description provided for @coverageSearchErrorFailed.
  ///
  /// In it, this message translates to:
  /// **'Ricerca non riuscita. Riprova.'**
  String get coverageSearchErrorFailed;

  /// No description provided for @coverageSearchClearPoint.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi punto'**
  String get coverageSearchClearPoint;

  /// No description provided for @coverageSearchPointSemantics.
  ///
  /// In it, this message translates to:
  /// **'Punto di ricerca selezionato'**
  String get coverageSearchPointSemantics;

  /// No description provided for @coverageBreadthTitle.
  ///
  /// In it, this message translates to:
  /// **'Ampiezza ricerca'**
  String get coverageBreadthTitle;

  /// No description provided for @coverageBreadthQuick.
  ///
  /// In it, this message translates to:
  /// **'Rapida'**
  String get coverageBreadthQuick;

  /// No description provided for @coverageBreadthMedium.
  ///
  /// In it, this message translates to:
  /// **'Media'**
  String get coverageBreadthMedium;

  /// No description provided for @coverageBreadthExtended.
  ///
  /// In it, this message translates to:
  /// **'Estesa'**
  String get coverageBreadthExtended;

  /// No description provided for @coverageBreadthQuickHint.
  ///
  /// In it, this message translates to:
  /// **'{radius} · risposta più veloce'**
  String coverageBreadthQuickHint(String radius);

  /// No description provided for @coverageBreadthMediumHint.
  ///
  /// In it, this message translates to:
  /// **'{radius} · equilibrata'**
  String coverageBreadthMediumHint(String radius);

  /// No description provided for @coverageBreadthExtendedHint.
  ///
  /// In it, this message translates to:
  /// **'{radius} · più lontano, attesa maggiore'**
  String coverageBreadthExtendedHint(String radius);

  /// No description provided for @coverageResultSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Dal punto selezionato'**
  String get coverageResultSubtitle;

  /// No description provided for @coverageResultEmptyNoReachable.
  ///
  /// In it, this message translates to:
  /// **'Nessun ripetitore raggiungibile da questo punto'**
  String get coverageResultEmptyNoReachable;

  /// No description provided for @coverageResultEmptyNoRepeaters.
  ///
  /// In it, this message translates to:
  /// **'Nessun ripetitore censito in quest\'area'**
  String get coverageResultEmptyNoRepeaters;

  /// No description provided for @coverageResultClearFilters.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi i filtri'**
  String get coverageResultClearFilters;

  /// No description provided for @coverageResultError.
  ///
  /// In it, this message translates to:
  /// **'Calcolo non riuscito'**
  String get coverageResultError;

  /// No description provided for @coverageResultComputing.
  ///
  /// In it, this message translates to:
  /// **'Calcolo della ricezione…'**
  String get coverageResultComputing;

  /// No description provided for @coverageResultCancel.
  ///
  /// In it, this message translates to:
  /// **'Annulla'**
  String get coverageResultCancel;

  /// No description provided for @coverageResultCount.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, =1{1 ripetitore raggiungibile} other{{count} ripetitori raggiungibili}}'**
  String coverageResultCount(int count);

  /// No description provided for @coverageResultCountFiltered.
  ///
  /// In it, this message translates to:
  /// **'{shown} di {total} raggiungibili'**
  String coverageResultCountFiltered(int shown, int total);

  /// No description provided for @coverageResultHiddenByFilters.
  ///
  /// In it, this message translates to:
  /// **'{count, plural, =1{1 raggiungibile nascosto dai filtri} other{{count} raggiungibili nascosti dai filtri}}'**
  String coverageResultHiddenByFilters(int count);

  /// No description provided for @coverageTeaserTitle.
  ///
  /// In it, this message translates to:
  /// **'Cosa raggiungi da {place}? 📡'**
  String coverageTeaserTitle(String place);

  /// No description provided for @coverageTeaserBody.
  ///
  /// In it, this message translates to:
  /// **'Ogni ponte che prendi da quel punto, con segnale previsto e distanza — prima ancora di partire.'**
  String get coverageTeaserBody;

  /// No description provided for @coverageTeaserBenefitAnywhere.
  ///
  /// In it, this message translates to:
  /// **'Qualunque punto del pianeta'**
  String get coverageTeaserBenefitAnywhere;

  /// No description provided for @coverageTeaserBenefitOffline.
  ///
  /// In it, this message translates to:
  /// **'Consultabile senza rete, in campo'**
  String get coverageTeaserBenefitOffline;

  /// No description provided for @coverageTeaserBenefitSave.
  ///
  /// In it, this message translates to:
  /// **'Salvi la postazione e la ritrovi'**
  String get coverageTeaserBenefitSave;

  /// No description provided for @stationSaveCta.
  ///
  /// In it, this message translates to:
  /// **'Salva postazione'**
  String get stationSaveCta;

  /// No description provided for @stationSaveTitle.
  ///
  /// In it, this message translates to:
  /// **'Nome della postazione'**
  String get stationSaveTitle;

  /// No description provided for @stationRename.
  ///
  /// In it, this message translates to:
  /// **'Rinomina'**
  String get stationRename;

  /// No description provided for @stationDelete.
  ///
  /// In it, this message translates to:
  /// **'Elimina'**
  String get stationDelete;

  /// No description provided for @stationRefresh.
  ///
  /// In it, this message translates to:
  /// **'Aggiorna'**
  String get stationRefresh;

  /// No description provided for @stationRefreshAll.
  ///
  /// In it, this message translates to:
  /// **'Aggiorna tutte'**
  String get stationRefreshAll;

  /// No description provided for @stationOfflineNotice.
  ///
  /// In it, this message translates to:
  /// **'Dato memorizzato sul dispositivo'**
  String get stationOfflineNotice;

  /// No description provided for @stationStaleNotice.
  ///
  /// In it, this message translates to:
  /// **'Il dato potrebbe non essere aggiornato'**
  String get stationStaleNotice;

  /// No description provided for @stationMissingEntry.
  ///
  /// In it, this message translates to:
  /// **'Dato non disponibile offline'**
  String get stationMissingEntry;

  /// No description provided for @stationDuplicateTitle.
  ///
  /// In it, this message translates to:
  /// **'Punto già salvato'**
  String get stationDuplicateTitle;

  /// No description provided for @stationDuplicateBody.
  ///
  /// In it, this message translates to:
  /// **'Esiste già una postazione a meno di {distance} da qui. Vuoi aggiornarla o crearne una distinta?'**
  String stationDuplicateBody(String distance);

  /// No description provided for @stationDuplicateUpdate.
  ///
  /// In it, this message translates to:
  /// **'Aggiorna quella'**
  String get stationDuplicateUpdate;

  /// No description provided for @stationDuplicateCreate.
  ///
  /// In it, this message translates to:
  /// **'Crea distinta'**
  String get stationDuplicateCreate;

  /// No description provided for @stationSaveFailed.
  ///
  /// In it, this message translates to:
  /// **'Salvataggio non riuscito: spazio insufficiente'**
  String get stationSaveFailed;

  /// No description provided for @stationSavedCta.
  ///
  /// In it, this message translates to:
  /// **'Postazione salvata'**
  String get stationSavedCta;

  /// No description provided for @stationRemoveCta.
  ///
  /// In it, this message translates to:
  /// **'Rimuovi'**
  String get stationRemoveCta;

  /// No description provided for @stationRemoveTitle.
  ///
  /// In it, this message translates to:
  /// **'Rimuovere la postazione?'**
  String get stationRemoveTitle;

  /// No description provided for @stationRemoveBody.
  ///
  /// In it, this message translates to:
  /// **'«{name}» e i suoi dati offline verranno eliminati da questo dispositivo.'**
  String stationRemoveBody(String name);

  /// No description provided for @stationRemovedSnack.
  ///
  /// In it, this message translates to:
  /// **'Postazione rimossa'**
  String get stationRemovedSnack;

  /// No description provided for @stationSaveError.
  ///
  /// In it, this message translates to:
  /// **'Salvataggio non riuscito. Riprova.'**
  String get stationSaveError;

  /// No description provided for @stationsTitle.
  ///
  /// In it, this message translates to:
  /// **'Le mie postazioni'**
  String get stationsTitle;

  /// No description provided for @stationsProfileSubtitle.
  ///
  /// In it, this message translates to:
  /// **'I punti che hai valutato, consultabili senza rete'**
  String get stationsProfileSubtitle;

  /// No description provided for @stationsEmptyTitle.
  ///
  /// In it, this message translates to:
  /// **'Nessuna postazione salvata'**
  String get stationsEmptyTitle;

  /// No description provided for @stationsEmptyBody.
  ///
  /// In it, this message translates to:
  /// **'Una postazione è un punto della mappa di cui hai già la copertura, salvata per ritrovarla anche senza rete.'**
  String get stationsEmptyBody;

  /// No description provided for @stationsEmptyStep1.
  ///
  /// In it, this message translates to:
  /// **'Scegli un punto sulla mappa: tieni premuto, cercalo per nome o incolla le coordinate.'**
  String get stationsEmptyStep1;

  /// No description provided for @stationsEmptyStep2.
  ///
  /// In it, this message translates to:
  /// **'Tocca «{action}» per vedere quali ripetitori arrivi a prendere da lì.'**
  String stationsEmptyStep2(String action);

  /// No description provided for @stationsEmptyStep3.
  ///
  /// In it, this message translates to:
  /// **'Salva il punto: lo ritrovi qui, anche in campo senza rete.'**
  String get stationsEmptyStep3;

  /// No description provided for @stationsGoToMap.
  ///
  /// In it, this message translates to:
  /// **'Vai alla mappa'**
  String get stationsGoToMap;

  /// No description provided for @stationsRefreshDone.
  ///
  /// In it, this message translates to:
  /// **'Aggiornamento completato'**
  String get stationsRefreshDone;

  /// No description provided for @spotsUpdatedAgo.
  ///
  /// In it, this message translates to:
  /// **'Aggiornato {time}'**
  String spotsUpdatedAgo(String time);

  /// No description provided for @spotsNextUpdateSeconds.
  ///
  /// In it, this message translates to:
  /// **'Aggiornamento tra {seconds} s'**
  String spotsNextUpdateSeconds(int seconds);

  /// No description provided for @spotsNextUpdateMinutes.
  ///
  /// In it, this message translates to:
  /// **'Aggiornamento tra {minutes} min'**
  String spotsNextUpdateMinutes(int minutes);

  /// No description provided for @spotsUpdating.
  ///
  /// In it, this message translates to:
  /// **'Aggiornamento…'**
  String get spotsUpdating;

  /// No description provided for @spotsAutoRefreshHint.
  ///
  /// In it, this message translates to:
  /// **'Aggiornamento automatico ogni {seconds} secondi'**
  String spotsAutoRefreshHint(int seconds);

  /// No description provided for @spotsManualRefreshHint.
  ///
  /// In it, this message translates to:
  /// **'Tocca per aggiornare'**
  String get spotsManualRefreshHint;

  /// No description provided for @coverageResultScope.
  ///
  /// In it, this message translates to:
  /// **'entro {km} · {count} valutati'**
  String coverageResultScope(String km, int count);

  /// No description provided for @coverageResultRecalculating.
  ///
  /// In it, this message translates to:
  /// **'Ricalcolo in corso'**
  String get coverageResultRecalculating;

  /// No description provided for @offlineBannerMessage.
  ///
  /// In it, this message translates to:
  /// **'Sei offline: stai consultando i dati salvati'**
  String get offlineBannerMessage;

  /// No description provided for @offlineMapsTitle.
  ///
  /// In it, this message translates to:
  /// **'Mappe offline'**
  String get offlineMapsTitle;

  /// No description provided for @offlineMapsEntrySubtitle.
  ///
  /// In it, this message translates to:
  /// **'Scarica le mappe per l\'uso senza rete'**
  String get offlineMapsEntrySubtitle;

  /// No description provided for @offlineMapsEmpty.
  ///
  /// In it, this message translates to:
  /// **'Nessuna regione scaricata. Scarica una zona per vedere la mappa anche senza rete.'**
  String get offlineMapsEmpty;

  /// No description provided for @offlineMapsAddRegion.
  ///
  /// In it, this message translates to:
  /// **'Scarica regione'**
  String get offlineMapsAddRegion;

  /// No description provided for @offlineMapsRegionNameLabel.
  ///
  /// In it, this message translates to:
  /// **'Nome della regione'**
  String get offlineMapsRegionNameLabel;

  /// No description provided for @offlineMapsRegionNameHint.
  ///
  /// In it, this message translates to:
  /// **'Es. Casa, Rifugio, Attivazione SOTA'**
  String get offlineMapsRegionNameHint;

  /// No description provided for @offlineMapsRadiusLabel.
  ///
  /// In it, this message translates to:
  /// **'Raggio'**
  String get offlineMapsRadiusLabel;

  /// No description provided for @offlineMapsDownload.
  ///
  /// In it, this message translates to:
  /// **'Scarica'**
  String get offlineMapsDownload;

  /// No description provided for @offlineMapsDownloadingStyle.
  ///
  /// In it, this message translates to:
  /// **'Download dello stile mappa…'**
  String get offlineMapsDownloadingStyle;

  /// No description provided for @offlineMapsDownloadingTiles.
  ///
  /// In it, this message translates to:
  /// **'Download delle mappe… {percent}%'**
  String offlineMapsDownloadingTiles(String percent);

  /// No description provided for @offlineMapsEstimatedSize.
  ///
  /// In it, this message translates to:
  /// **'Dimensione stimata: {size}'**
  String offlineMapsEstimatedSize(String size);

  /// No description provided for @offlineMapsDownloadError.
  ///
  /// In it, this message translates to:
  /// **'Download non riuscito. Riprova.'**
  String get offlineMapsDownloadError;

  /// No description provided for @offlineMapsDeleteError.
  ///
  /// In it, this message translates to:
  /// **'Eliminazione non riuscita. Riprova.'**
  String get offlineMapsDeleteError;

  /// No description provided for @offlineMapsDeleteConfirmTitle.
  ///
  /// In it, this message translates to:
  /// **'Eliminare la regione?'**
  String get offlineMapsDeleteConfirmTitle;

  /// No description provided for @offlineMapsDeleteConfirmMessage.
  ///
  /// In it, this message translates to:
  /// **'“{name}” non sarà più disponibile senza rete.'**
  String offlineMapsDeleteConfirmMessage(String name);

  /// No description provided for @offlineMapsDeleteConfirm.
  ///
  /// In it, this message translates to:
  /// **'Elimina'**
  String get offlineMapsDeleteConfirm;

  /// No description provided for @offlineMapsRegionSubtitle.
  ///
  /// In it, this message translates to:
  /// **'Raggio {radius} · {size}'**
  String offlineMapsRegionSubtitle(String radius, String size);

  /// No description provided for @offlineMapsIncomplete.
  ///
  /// In it, this message translates to:
  /// **'Download incompleto'**
  String get offlineMapsIncomplete;

  /// No description provided for @offlineMapsResume.
  ///
  /// In it, this message translates to:
  /// **'Riprendi'**
  String get offlineMapsResume;

  /// No description provided for @offlineMapsCenterInfo.
  ///
  /// In it, this message translates to:
  /// **'La regione sarà centrata sulla tua posizione attuale.'**
  String get offlineMapsCenterInfo;

  /// No description provided for @dashboardOfflineTitle.
  ///
  /// In it, this message translates to:
  /// **'Sei offline'**
  String get dashboardOfflineTitle;

  /// No description provided for @dashboardOfflineMessage.
  ///
  /// In it, this message translates to:
  /// **'Non ci sono dati salvati per questa zona. Le tue postazioni salvate e le mappe scaricate restano disponibili.'**
  String get dashboardOfflineMessage;

  /// No description provided for @offlineMapsCenterMine.
  ///
  /// In it, this message translates to:
  /// **'La mia posizione'**
  String get offlineMapsCenterMine;

  /// No description provided for @offlineMapsCenterSearch.
  ///
  /// In it, this message translates to:
  /// **'Cerca un luogo'**
  String get offlineMapsCenterSearch;

  /// No description provided for @offlineMapsCenterSearchInfo.
  ///
  /// In it, this message translates to:
  /// **'Cerca una città o un luogo: la regione sarà centrata lì.'**
  String get offlineMapsCenterSearchInfo;

  /// No description provided for @offlineMapsCenterSelected.
  ///
  /// In it, this message translates to:
  /// **'Centro: {label}'**
  String offlineMapsCenterSelected(String label);

  /// No description provided for @changelog120OfflineMode.
  ///
  /// In it, this message translates to:
  /// **'Modalità offline: ripetitori, preferiti, profilo, copertura e raggiungibilità consultabili anche senza rete (PRO)'**
  String get changelog120OfflineMode;

  /// No description provided for @changelog120OfflineMaps.
  ///
  /// In it, this message translates to:
  /// **'Mappe offline: scarica la zona dove ti trovi o un luogo a tua scelta e usala senza connessione (PRO)'**
  String get changelog120OfflineMaps;

  /// No description provided for @changelog120CoverageSearch.
  ///
  /// In it, this message translates to:
  /// **'Ricerca copertura da qualsiasi punto: cerca una località, incolla coordinate o tieni premuto sulla mappa per scoprire cosa raggiungi da lì'**
  String get changelog120CoverageSearch;

  /// No description provided for @changelog120SavedStations.
  ///
  /// In it, this message translates to:
  /// **'Le mie postazioni: salva i punti che ti interessano e consultali anche offline (PRO)'**
  String get changelog120SavedStations;

  /// No description provided for @changelog120SpotsRefresh.
  ///
  /// In it, this message translates to:
  /// **'Spot SOTA e POTA si aggiornano da soli ogni minuto, con badge colorati per modo (CW, SSB, FT8…)'**
  String get changelog120SpotsRefresh;

  /// No description provided for @changelog120NoNetwork.
  ///
  /// In it, this message translates to:
  /// **'Senza connessione l\'app avvia subito, mostra cosa è disponibile e disattiva le azioni che richiedono la rete'**
  String get changelog120NoNetwork;

  /// No description provided for @changelog130ImperialUnits.
  ///
  /// In it, this message translates to:
  /// **'Miglia e piedi: l’app segue le unità del tuo dispositivo, e nelle Impostazioni puoi scegliere il sistema a mano'**
  String get changelog130ImperialUnits;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'cs',
        'de',
        'en',
        'es',
        'fr',
        'hr',
        'hu',
        'it',
        'nl',
        'pl',
        'pt',
        'ro',
        'sk',
        'sl',
        'sr'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'it':
      return AppLocalizationsIt();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sr':
      return AppLocalizationsSr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
