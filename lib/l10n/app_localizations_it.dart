// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get proSectionTitle => 'Abbonamento';

  @override
  String get proCardUpgradeTitle => 'Scopri cosa raggiungi';

  @override
  String get proCardUpgradeSubtitle => 'Copertura, ponti e mappe offline';

  @override
  String get proCardActiveTitle => 'HamQRG Pro attivo';

  @override
  String get proCardActiveSubtitle => 'Grazie per il supporto!';

  @override
  String proPriceFromMonth(String price) {
    return 'Da $price al mese · Annulla quando vuoi';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Prova gratis, poi $price al mese · Annulla quando vuoi';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price una volta sola · Per sempre';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Da $price al mese · $total in anticipo · Annulla quando vuoi';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Prova gratis, poi $price al mese · $total in anticipo · Annulla quando vuoi';
  }

  @override
  String get proRestoreSuccess => 'Acquisti ripristinati: HamQRG Pro è attivo';

  @override
  String get proRestoreNone => 'Nessun acquisto da ripristinare';

  @override
  String get proManageSubscription => 'Gestisci abbonamento';

  @override
  String get proLinkAccountTitle => 'Collega il tuo account';

  @override
  String get proLinkAccountBody =>
      'Collega HamQRG Pro a un account per ritrovarlo su ogni dispositivo, anche dopo una reinstallazione.';

  @override
  String get stationsShowcaseTitle => 'Le tue postazioni, anche senza rete';

  @override
  String get stationsShowcaseBody =>
      'Salva casa, il rifugio, il sito di attivazione: ritrovi cosa raggiungi anche quando la rete non c\'è.';

  @override
  String get offlineMapsUpsellTitle => 'La mappa resta nel telefono 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Scarica le zone che ti servono e aprile dove il segnale non arriva: in cresta, in galleria, all\'estero senza dati.';

  @override
  String get offlineMapsBenefitRegions => 'Scegli tu le zone da scaricare';

  @override
  String get reachUpsellBenefitSignal => 'Segnale previsto per ogni ponte';

  @override
  String get reachUpsellBenefitTerrain =>
      'Profilo del terreno fra te e il ponte';

  @override
  String get proRestoreCta => 'Ripristina acquisti';

  @override
  String get error => 'Errore';

  @override
  String get error_message =>
      'Si è verificato un errore durante il caricamento';

  @override
  String get error_message_retry =>
      'Si è verificato un errore durante il caricamento. Riprova più tardi';

  @override
  String get retry => 'Riprova';

  @override
  String get back => 'Indietro';

  @override
  String get loading => 'Caricamento';

  @override
  String get details => 'Dettagli';

  @override
  String pages_number(Object number) {
    return '$number pagine d\'approfondire';
  }

  @override
  String get january => 'Gennaio';

  @override
  String get february => 'Febbraio';

  @override
  String get march => 'Marzo';

  @override
  String get april => 'Aprile';

  @override
  String get may => 'Maggio';

  @override
  String get june => 'Giugno';

  @override
  String get july => 'Luglio';

  @override
  String get august => 'Agosto';

  @override
  String get september => 'Settembre';

  @override
  String get october => 'Ottobre';

  @override
  String get november => 'Novembre';

  @override
  String get december => 'Dicembre';

  @override
  String get logout => 'Esci';

  @override
  String get profile => 'Profilo';

  @override
  String get settings => 'Impostazioni';

  @override
  String get contact_us => 'Contattaci';

  @override
  String get error_opening_email =>
      'Si è verificato un errore durante l\'apertura dell\'email';

  @override
  String get register_now => 'Registrati ora';

  @override
  String get tracking_permission_title => 'Supporta l\'App';

  @override
  String get tracking_permission_message =>
      'Per migliorare la tua esperienza e mostrarti contenuti più rilevanti, aiutaci a mantenere gratuita l\'app.\n\nClicca su Consenti per supportarci.';

  @override
  String get tracking_permission_next => 'Avanti';

  @override
  String get skip => 'Salta';

  @override
  String get done => 'Fatto';

  @override
  String get next => 'Avanti';

  @override
  String get joinCommunityTitle => 'Unisciti alla nostra Community!';

  @override
  String get joinCommunityDescription =>
      'Scopri i vantaggi di entrare nella community Telegram:';

  @override
  String get benefitSupportMembers => 'Supporto dai membri';

  @override
  String get benefitSuggestFeatures => 'Proponi nuove funzionalità';

  @override
  String get benefitContactDevelopers => 'Contatto con gli sviluppatori';

  @override
  String get benefitExclusivePreviews => 'Anteprime e beta esclusive';

  @override
  String get benefitActiveCommunity => 'Community attiva';

  @override
  String get joinNowButton => 'Unisciti ora!';

  @override
  String get alreadyMemberButton => 'Sono già membro';

  @override
  String get laterButton => 'Più tardi';

  @override
  String get errorOpenTelegram => 'Errore durante l\'apertura di Telegram';

  @override
  String get disclaimerTitle => 'Fonte dei dati';

  @override
  String get disclaimerDescription =>
      'I dati dei ponti radio presenti in questa app provengono da IZ8WNH.\n\nPer informazioni aggiuntive, scaricare i file CSV per programmare le radio o consultare dati non presenti in quest\'app, visita il sito ufficiale.';

  @override
  String get disclaimerVisitSite => 'Visita iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Ho capito';

  @override
  String get errorOpenDisclaimerSite => 'Errore durante l\'apertura del sito';

  @override
  String get repeatersMapTitle => 'Mappa ripetitori';

  @override
  String get repeatersListTitle => 'Lista ripetitori';

  @override
  String get repeatersMapLoading => 'Caricamento mappa dei ripetitori…';

  @override
  String get repeatersMapGenericError => 'Impossibile caricare i ripetitori.';

  @override
  String get repeatersMapEmpty => 'Nessun ripetitore trovato vicino a te.';

  @override
  String get repeatersSearchHint =>
      'Cerca per nome, nominativo o frequenza MHz…';

  @override
  String get repeatersSearchEmpty => 'Nessun ripetitore trovato.';

  @override
  String get repeatersSortDistance => 'Distanza';

  @override
  String get repeatersSortLikes => 'Likes';

  @override
  String get repeatersSortFrequency => 'Frequenza';

  @override
  String repeatersNearbyCount(int count) {
    return '$count ripetitori vicini';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count risultati';
  }

  @override
  String get repeatersMapRetry => 'Riprova';

  @override
  String get repeatersMapOpenSettings => 'Apri impostazioni';

  @override
  String get repeatersMapPermissionMessage =>
      'Consenti l\'accesso alla posizione per mostrare i ripetitori vicino a te.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Permesso posizione negato in modo permanente. Abilitalo dalle impostazioni di sistema.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Attiva i servizi di localizzazione per trovare i ripetitori vicini.';

  @override
  String repeatersMapFound(int count) {
    return '$count ripetitori trovati';
  }

  @override
  String get repeaterMode => 'Modalità';

  @override
  String get repeaterModeAnalog => 'Analogico';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Tutti i modi';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frequenza';

  @override
  String get repeaterShift => 'Shift';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Posizione';

  @override
  String get repeaterDistance => 'Distanza';

  @override
  String get repeaterViewFullDetails => 'Vedi dettagli completi';

  @override
  String get repeatersMapReturnToLocation => 'Torna alla mia posizione';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count ripetitori in questa posizione';
  }

  @override
  String get profileUnlockFeatures => 'Sblocca tutte le funzionalità';

  @override
  String get profileUnlockFeaturesDescription =>
      'Registrati per utilizzare le funzioni di recensione, salvataggio preferiti e accedere a statistiche dettagliate.';

  @override
  String get profileSignUpOrLogin => 'Registrati o Accedi';

  @override
  String get profileErrorOpeningEmail =>
      'Errore durante l\'apertura della mail';

  @override
  String get profileJoinTelegramCommunity => 'Entra nella community Telegram';

  @override
  String get profileWelcomeTitle => 'Benvenuto su HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Unisciti alla nostra community di radioamatori in Italia.';

  @override
  String get profileEditProfile => 'Modifica Profilo';

  @override
  String get profileChangePhoto => 'Cambia Foto';

  @override
  String get profileFirstName => 'Nome';

  @override
  String get profileLastName => 'Cognome';

  @override
  String get profileCallsign => 'Nominativo';

  @override
  String get profileRestartIdentificationTitle =>
      'Devi cambiare il tuo stato? Puoi riavviare il processo di identificazione per passare da Operatore Autorizzato a SWL Listener.';

  @override
  String get profileRestartIdentificationButton =>
      'Riavvia Processo di Identificazione';

  @override
  String get profileSaveChanges => 'Salva Modifiche';

  @override
  String get profileDangerZone => 'Zona Pericolosa';

  @override
  String get profileDeleteAccount => 'Elimina Account';

  @override
  String get profileDeleteAccountConfirmTitle => 'Elimina Account';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Sei sicuro di voler eliminare il tuo account? Questa azione è irreversibile.';

  @override
  String get profileDeleteAccountCancel => 'Annulla';

  @override
  String get profileDeleteAccountConfirm => 'Elimina';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'App Version $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Community & Support';

  @override
  String get profileSectionSupport => 'Support';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Versione: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Version $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Errore: $error';
  }

  @override
  String get authJoinTitle => 'Unisciti a HamQRG';

  @override
  String get authUnlockFeatures =>
      'Accedi per sbloccare tutte le funzionalità!';

  @override
  String get authWhatYouGet => 'Cosa otterrai:';

  @override
  String get authBenefitStatsTitle => 'Statistiche dettagliate';

  @override
  String get authBenefitStatsDescription =>
      'Monitora i tuoi progressi e migliora';

  @override
  String get authBenefitQuizTitle => 'Diverse modalità di quiz';

  @override
  String get authBenefitQuizDescription =>
      'Allenati in modalità maratona, argomenti e altro.';

  @override
  String get authBenefitSyncTitle => 'Sincronizzazione';

  @override
  String get authBenefitSyncDescription => 'Accedi da qualsiasi dispositivo';

  @override
  String get authOrSignInWithEmail => 'Oppure accedi con email';

  @override
  String get authEnterEmail => 'Inserisci l\'email';

  @override
  String get authEnterPassword => 'Inserisci la password';

  @override
  String get authForgotPassword => 'Password dimenticata?';

  @override
  String get authSignIn => 'Accedi';

  @override
  String get authSignUp => 'Registrati';

  @override
  String get authPasswordLengthError => 'La password deve essere più lunga';

  @override
  String get authDontHaveAccount => 'Non hai un account? Registrati';

  @override
  String get authHaveAccount => 'Hai già un account? Accedi';

  @override
  String get authBackToSignIn => 'Torna all\'accesso';

  @override
  String get authUnexpectedError => 'Errore nell\'autenticazione: ';

  @override
  String get authValidEmailError => 'Inserisci un\'email valida';

  @override
  String get authSendPasswordReset => 'Invia reset password';

  @override
  String get authPasswordResetSent => 'Reset password inviato';

  @override
  String get authVerifyEmailMessage =>
      'Verifica la tua email per completare la registrazione, controlla la tua casella.';

  @override
  String get authInvalidCredentials => 'Email o password errati';

  @override
  String get authEmailNotConfirmed => 'Verifica la tua email per accedere';

  @override
  String get authFirstName => 'Nome';

  @override
  String get authFirstNameRequired => 'Il nome è obbligatorio';

  @override
  String get authLastName => 'Cognome';

  @override
  String get authLastNameRequired => 'Il cognome è obbligatorio';

  @override
  String get authContinueAsGuest => 'Continua come ospite';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Scopri i ripetitori che ti circondano';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Accesso rapido';

  @override
  String get homeRepeaterList => 'Lista ripetitori';

  @override
  String get homeMyFavorites => 'I miei preferiti';

  @override
  String get homeNearby => 'Vicino a te';

  @override
  String get homeViewAll => 'Vedi tutto';

  @override
  String get dashboardTabRepeaters => 'Ripetitori';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Nessun ripetitore nelle vicinanze';

  @override
  String get dashboardViewAllRepeaters => 'Vedi tutti i ripetitori';

  @override
  String get dashboardViewAllPotaSpots => 'Vedi tutti gli spot POTA';

  @override
  String homeStations(int count) {
    return '$count stazioni';
  }

  @override
  String homeSaved(int count) {
    return '$count salvati';
  }

  @override
  String get homeActive => 'Attivo';

  @override
  String get homeIdle => 'Inattivo';

  @override
  String get homeNavHome => 'Home';

  @override
  String get homeNavList => 'Lista';

  @override
  String get homeNavFavorites => 'Preferiti';

  @override
  String get homeNavMap => 'Mappa';

  @override
  String get homeNavProfile => 'Profilo';

  @override
  String get favoritesTitle => 'I miei preferiti';

  @override
  String get favoritesSearchHint => 'Cerca ripetitori salvati...';

  @override
  String get favoritesFilterAllSaved => 'Tutti salvati';

  @override
  String get favoritesEmpty => 'Nessun ripetitore salvato';

  @override
  String get favoritesEmptyDescription =>
      'Aggiungi ripetitori ai preferiti per vederli qui';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Mostrando $showing di $total stazioni preferite';
  }

  @override
  String get favoritesRemove => 'Rimuovi dai preferiti';

  @override
  String get favoritesAdd => 'Aggiungi ai preferiti';

  @override
  String get repeaterDetailSave => 'Salva';

  @override
  String get repeaterDetailShare => 'Condividi';

  @override
  String get repeaterDetailReport => 'Segnala';

  @override
  String get repeaterDetailTotalLikes => 'Mi piace totali';

  @override
  String get repeaterDetailReports1Yr => 'Segnalazioni (1 anno)';

  @override
  String get repeaterDetailHealthScore => 'Punteggio salute';

  @override
  String get repeaterDetailExcellent => 'Eccellente';

  @override
  String get repeaterDetailGood => 'Buono';

  @override
  String get repeaterDetailFair => 'Discreto';

  @override
  String get repeaterDetailToVerify => 'Da verificare';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Punteggio calcolato da $count segnalazioni negative nell\'ultimo anno';
  }

  @override
  String get repeaterDetailLastLike => 'Ultimo mi piace';

  @override
  String get repeaterDetailLastDownReport => 'Ultima segnalazione negativa';

  @override
  String get repeaterDetailTechnicalData => 'Dati tecnici';

  @override
  String get repeaterDetailFrequency => 'Frequenza';

  @override
  String get repeaterDetailShift => 'Shift';

  @override
  String get repeaterDetailSubtone => 'Sottotono (SQL)';

  @override
  String get repeaterDetailMode => 'Modalità';

  @override
  String get repeaterDetailLocation => 'Posizione';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance di distanza';
  }

  @override
  String get repeaterDetailCommunityReports => 'Segnalazioni community';

  @override
  String get repeaterDetailUpdateStatusFeedback => 'Aggiorna stato e feedback';

  @override
  String get repeaterDetailEquipment => 'Attrezzatura';

  @override
  String get repeaterDetailEquipmentRequired => 'Attrezzatura *';

  @override
  String get repeaterDetailAccessModes => 'Modalità di accesso';

  @override
  String get repeaterDetailNetwork => 'Rete';

  @override
  String get repeaterDetailLocationField => 'Luogo';

  @override
  String get repeaterDetailLocationRequired => 'Luogo *';

  @override
  String get repeaterDetailComment => 'Commento';

  @override
  String get repeaterDetailCommentOptional => 'Commento (Opzionale)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Qualità del segnale, rapporto audio o commenti generali...';

  @override
  String get repeaterDetailReportDown => 'Segnala problema';

  @override
  String get repeaterDetailCheckinLike => 'Check-in e mi piace';

  @override
  String get repeaterDetailYourFeedback => 'Il tuo feedback';

  @override
  String get repeaterDetailPostedJustNow => 'Pubblicato adesso';

  @override
  String get repeaterDetailDeleteEntry => 'Elimina voce';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Vedi tutte le $count segnalazioni';
  }

  @override
  String get repeaterDetailStationPortable => 'Portatile';

  @override
  String get repeaterDetailStationMobile => 'Mobile';

  @override
  String get repeaterDetailStationFixed => 'Fisso';

  @override
  String get repeaterDetailLike => 'Mi piace';

  @override
  String get repeaterDetailReportLabel => 'Segnalazione';

  @override
  String get repeaterDetailSaved => 'Salvato';

  @override
  String get repeaterDetailShareMessage =>
      'Scopri questo ripetitore su HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'La funzionalità di segnalazione sarà disponibile a breve. Potrai segnalare informazioni errate o problemi con questo ripetitore.';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get favorite => 'Preferito';

  @override
  String get accessConfiguration => 'Configurazione accesso';

  @override
  String get noAccessConfiguration => 'Nessuna configurazione disponibile';

  @override
  String get repeaterDetailAddFeedback => 'Aggiungi feedback';

  @override
  String get repeaterDetailOthersReports => 'Segnalazioni altri utenti';

  @override
  String get repeaterDetailRemove => 'Rimuovi';

  @override
  String get repeaterDetailSelectAccess => 'Seleziona accesso';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Devi essere entro $distance dal ripetitore per inviare un feedback.';
  }

  @override
  String get repeaterDetailInteractive => 'Interattivo';

  @override
  String get repeaterDetailLogYourSignal => 'Registra il tuo segnale';

  @override
  String get repeaterDetailUsedEquipment => 'Attrezzatura usata';

  @override
  String get repeaterDetailYourLocation => 'La tua posizione';

  @override
  String get repeaterDetailLocationPlaceholder => 'Dove eri? (es. Roma)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Seleziona un luogo dai suggerimenti';

  @override
  String get feedbackDistanceConfirmTitle => 'Conferma invio';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Il luogo selezionato si trova a $distance dal ripetitore. Confermi di voler inviare questo feedback sotto la tua responsabilità?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Conferma';

  @override
  String get feedbackDistanceConfirmCancel => 'Annulla';

  @override
  String get repeaterDetailSelectAccessInstance =>
      'Seleziona istanza di accesso';

  @override
  String get repeaterDetailSignalObservations => 'Osservazioni sul segnale';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Com\'era la qualità audio?';

  @override
  String get repeaterDetailSendLike => 'Invia Like';

  @override
  String get repeaterDetailReportIssue => 'Segnala Problema';

  @override
  String get repeaterDetailRecentActivity => 'Attività recente';

  @override
  String get reportIssueTitle => 'Segnalazione';

  @override
  String get reportIssueHeadline => 'Aiutaci a mantenere i dati accurati';

  @override
  String get reportIssueDescription =>
      'Hai trovato qualcosa di sbagliato o mancante in questo ripetitore? Facci sapere cosa deve essere modificato e lo verificheremo.';

  @override
  String get reportIssueWhatToCorrect => 'Cosa vorresti correggere o inserire?';

  @override
  String get reportIssuePlaceholder =>
      'Es. Il tono CTCSS è cambiato a 88.5Hz, o la posizione è leggermente più a nord, il gestore è...';

  @override
  String get reportIssueVerifiedTitle => 'Invii Verificati';

  @override
  String get reportIssueVerifiedDescription =>
      'La tua segnalazione sarà revisionata dal coordinatore regionale prima che il database pubblico venga aggiornato. Grazie per il tuo contributo alla community.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Confermo che queste informazioni sono corrette in base alla mia osservazione.';

  @override
  String get reportIssueSubmit => 'Invia';

  @override
  String get reportIssueMinChars => 'Minimo 10 caratteri richiesti';

  @override
  String get reportIssueMaxChars => 'Massimo 2000 caratteri';

  @override
  String get reportIssueSuccess => 'Segnalazione inviata con successo';

  @override
  String get reportIssueError => 'Errore durante l\'invio della segnalazione';

  @override
  String get registrationPromptTitle => 'Sblocca tutto il potenziale';

  @override
  String get registrationPromptDescription =>
      'Unisciti alla community italiana dei radioamatori e porta la tua esperienza al livello successivo.';

  @override
  String get registrationBenefitInteractTitle => 'Interagisci';

  @override
  String get registrationBenefitInteractDescription =>
      'Valuta i ripetitori e lascia commenti per gli altri.';

  @override
  String get registrationBenefitFavoritesTitle => 'Preferiti';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Salva le tue frequenze e ripetitori più usati.';

  @override
  String get registrationBenefitLogbookTitle => 'Logbook';

  @override
  String get registrationBenefitLogbookDescription =>
      'Tieni traccia dei tuoi QSO e mantieni uno storico personale.';

  @override
  String get registrationSignInApple => 'Accedi con Apple';

  @override
  String get registrationSignInGoogle => 'Accedi con Google';

  @override
  String get registrationPromptFooter =>
      'Registrazione gratuita. Nessuna licenza richiesta per consultare i dati pubblici.';

  @override
  String get postLoginOnboardingWelcome => 'Benvenuto in';

  @override
  String get postLoginOnboardingQuestion => 'Sei un radioamatore con licenza?';

  @override
  String get postLoginOnboardingHelpText =>
      'Ci aiuta a personalizzare la tua esperienza e mostrarti le frequenze giuste.';

  @override
  String get postLoginOnboardingYesLicensed => 'Sì, lo sono';

  @override
  String get postLoginOnboardingNoListener => 'No, sono solo un ascoltatore';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identificati';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Inserisci il tuo nominativo ufficiale per accedere alle funzionalità di rete.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Nominativo (Callsign)';

  @override
  String get postLoginOnboardingCallsignHint => 'Es. IU2XYZ';

  @override
  String get postLoginOnboardingComplete => 'Completa profilo';

  @override
  String get postLoginOnboardingBack => 'Indietro';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Puoi modificarlo in seguito nelle impostazioni.';

  @override
  String get postLoginOnboardingSwlTitle => 'Nominativo SWL';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Hai un nominativo SWL ufficiale?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'I nominativi degli ascoltatori d\'onda corta aiutano a identificarti nella community globale di monitoraggio.';

  @override
  String get postLoginOnboardingSwlYes => 'Si, ne ho uno';

  @override
  String get postLoginOnboardingSwlNo => 'No, non ne ho uno';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Inserisci nominativo';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Es. I1-12345-SWL';

  @override
  String get timeAgoJustNow => 'adesso';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuti fa',
      one: '1 minuto fa',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ore fa',
      one: '1 ora fa',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni fa',
      one: '1 giorno fa',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count settimane fa',
      one: '1 settimana fa',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesi fa',
      one: '1 mese fa',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anni fa',
      one: '1 anno fa',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Tema';

  @override
  String get profileThemeModeSystem => 'Sistema';

  @override
  String get profileThemeModeLight => 'Chiaro';

  @override
  String get profileThemeModeDark => 'Scuro';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Sii il primo a lasciare un feedback su questo ripetitore!';

  @override
  String get repeaterDetailDistanceFromYou => 'Distanza da te';

  @override
  String get repeaterDistanceMapNoLocation => 'Posizione non disponibile';

  @override
  String get repeaterDetailNever => 'Mai';

  @override
  String get repeaterDetailInfo => 'Informazioni';

  @override
  String get repeaterDetailSource => 'Fonte';

  @override
  String get repeaterDetailManager => 'Gestore';

  @override
  String get repeaterDetailSuggestManager =>
      'Conosci il gestore del ponte? Segnalalo!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Mappa feedback';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Visualizza dove sono stati registrati i like e le segnalazioni';

  @override
  String get repeaterDetailAltimetricProfile => 'Profilo altimetrico';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Visualizza il profilo del terreno tra te e il ripetitore';

  @override
  String get repeaterCoverageTitle => 'Copertura';

  @override
  String get repeaterCoverageCardTitle => 'Mappa di copertura';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Stima il segnale del ripetitore sul territorio';

  @override
  String get repeaterCoverageLoading => 'Calcolo della copertura in corso…';

  @override
  String get repeaterCoverageError => 'Impossibile calcolare la copertura';

  @override
  String get repeaterCoverageRetry => 'Riprova';

  @override
  String get repeaterCoverageLegendTitle => 'Segnale stimato (dBm)';

  @override
  String get repeaterCoverageCta => 'Visualizza la copertura';

  @override
  String get repeaterDetailLosClear =>
      'Visione ottica libera tra te e il ripetitore';

  @override
  String get repeaterDetailLosObstructed =>
      'Visione ottica ostruita dal terreno';

  @override
  String get repeaterDetailTerrainProfile => 'Profilo terreno';

  @override
  String get repeaterDetailLineOfSight => 'Visione ottica';

  @override
  String get repeaterDetailTotalDistance => 'Distanza';

  @override
  String get repeaterDetailRepeaterElevation => 'Quota ripetitore';

  @override
  String get repeaterDetailYourElevation => 'Quota tua';

  @override
  String get repeaterDetailYou => 'Tu';

  @override
  String get repeaterDetailRepeaterLabel => 'Ripetitore';

  @override
  String get repeaterDetailFunFacts => 'Lo sapevi?';

  @override
  String get repeaterDetailWavelength => 'Lunghezza d\'onda';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'La lunghezza d\'onda di questo ripetitore è $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscillazioni al secondo';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Il segnale oscilla $value volte al secondo';
  }

  @override
  String get repeaterDetailPropagationTime => 'Tempo di propagazione';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Il tuo segnale impiega $value ad arrivare al ripetitore';
  }

  @override
  String get repeaterDetailWaveCycles => 'Cicli nel tragitto';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'L\'onda compie $value cicli completi nel tragitto';
  }

  @override
  String get userReportsTitle => 'Le mie attività';

  @override
  String get userReportsTabReports => 'Segnalazioni';

  @override
  String get userReportsTabSubmissions => 'Nuovi ponti';

  @override
  String get userReportsFilterAll => 'Tutti';

  @override
  String get userReportsFilterOpen => 'Aperte';

  @override
  String get userReportsFilterClosed => 'Chiuse';

  @override
  String get userReportsEmpty => 'Nessuna segnalazione inviata';

  @override
  String get userReportsEmptyDescription =>
      'Le tue segnalazioni sui ripetitori appariranno qui';

  @override
  String get userReportsEmptyFiltered =>
      'Nessuna segnalazione con questo filtro';

  @override
  String get userReportsStatusPending => 'In attesa';

  @override
  String get userReportsStatusReviewed => 'In revisione';

  @override
  String get userReportsStatusResolved => 'Risolto';

  @override
  String get userReportsStatusRejected => 'Rifiutato';

  @override
  String get userReportsRetryBanner => 'Impossibile aggiornare l\'elenco';

  @override
  String get userReportsProfileTile => 'I miei report';

  @override
  String get userReportsProfileTileSubtitle =>
      'Visualizza lo stato delle tue segnalazioni';

  @override
  String get userReportsError => 'Errore durante il caricamento dei report';

  @override
  String get userReportsCoordinatorResponse => 'Risposta coordinatore';

  @override
  String get userSubmissionsEmpty => 'Nessun ponte segnalato';

  @override
  String get userSubmissionsEmptyDescription =>
      'I ponti che proponi appariranno qui';

  @override
  String get userSubmissionsEmptyFiltered => 'Nessun ponte con questo filtro';

  @override
  String get userSubmissionsStatusPending => 'In attesa';

  @override
  String get userSubmissionsStatusApproved => 'Approvato';

  @override
  String get userSubmissionsStatusRejected => 'Rifiutato';

  @override
  String get userSubmissionsCoordinatorResponse => 'Risposta coordinatore';

  @override
  String get userSubmissionsFrequency => 'Frequenza';

  @override
  String get potaTitle => 'POTA Spots';

  @override
  String get potaSearchHint => 'Cerca per attivatore, parco o modo…';

  @override
  String get potaNoSpots => 'Nessuno spot POTA attivo al momento.';

  @override
  String get potaLoadError => 'Impossibile caricare gli spot POTA';

  @override
  String get potaRetry => 'Riprova';

  @override
  String get potaViewAll => 'Vedi tutto';

  @override
  String get potaActivator => 'Attivatore';

  @override
  String get potaFrequency => 'Frequenza';

  @override
  String get potaMode => 'Modo';

  @override
  String get potaPark => 'Parco';

  @override
  String get potaReference => 'Riferimento';

  @override
  String get potaSpotter => 'Spottato da';

  @override
  String get potaComments => 'Commenti';

  @override
  String get potaLastSpotted => 'Ultimo spot';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Impossibile aprire QRZ.com';

  @override
  String get potaParkWebsite => 'Sito parco';

  @override
  String get potaParkType => 'Tipo parco';

  @override
  String get potaLocation => 'Posizione';

  @override
  String get potaCountry => 'Paese';

  @override
  String get potaFirstActivation => 'Prima attivazione';

  @override
  String get potaBand => 'Banda';

  @override
  String potaDistanceAway(String distance) {
    return '$distance di distanza';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count spot';
  }

  @override
  String get potaFilterAll => 'Tutte';

  @override
  String get potaFilterBand => 'Banda';

  @override
  String get potaFilterMode => 'Modo';

  @override
  String get potaSortByTime => 'Più recenti';

  @override
  String get potaSortByDistance => 'Più vicini';

  @override
  String get profileLanguage => 'Lingua';

  @override
  String get profileUnitSystem => 'Unità di misura';

  @override
  String get profileUnitSystemAuto => 'Automatico';

  @override
  String get profileUnitSystemMetric => 'Metrico';

  @override
  String get profileUnitSystemImperial => 'Imperiale';

  @override
  String get profileLanguageSystem => 'Sistema';

  @override
  String get profileLanguageItalian => 'Italiano';

  @override
  String get profileLanguageEnglish => 'English';

  @override
  String get profileLanguageSpanish => 'Español';

  @override
  String get profileLanguageFrench => 'Français';

  @override
  String get profileLanguageGerman => 'Deutsch';

  @override
  String get profileLanguagePortuguese => 'Português';

  @override
  String get profileLanguageDutch => 'Nederlands';

  @override
  String get profileLanguagePolish => 'Polski';

  @override
  String get profileLanguageRomanian => 'Română';

  @override
  String get profileLanguageSlovenian => 'Slovenščina';

  @override
  String get profileLanguageCroatian => 'Hrvatski';

  @override
  String get profileLanguageHungarian => 'Magyar';

  @override
  String get profileLanguageCzech => 'Čeština';

  @override
  String get profileLanguageSlovak => 'Slovenčina';

  @override
  String get profileLanguageSerbian => 'Srpski';

  @override
  String get onboardingSkip => 'Salta';

  @override
  String get onboardingGetStarted => 'Inizia';

  @override
  String get onboardingNext => 'Avanti';

  @override
  String get onboardingWelcomeTitle1 => 'Trova i ripetitori vicino a te';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Scopri i ponti radio attivi nella tua zona, con frequenze, toni e dettagli tecnici.';

  @override
  String get onboardingWelcomeCredits =>
      'Dati dei ponti radio forniti da IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtra per modo';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analogico, DMR, C4FM, D-STAR — trova subito il ripetitore che fa per te.';

  @override
  String get onboardingWelcomeTitle3 => 'Spot POTA in tempo reale';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Segui le attivazioni Parks on the Air con aggiornamenti live, filtri per banda e distanza.';

  @override
  String get onboardingWelcomeTitle4 => 'Salva i preferiti';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Tieni a portata di mano i ripetitori che usi di più per accesso rapido.';

  @override
  String get onboardingLocationTitle => 'Posizione';

  @override
  String get onboardingLocationSubtitle =>
      'Usiamo la tua posizione per mostrarti i ripetitori e le attivazioni POTA vicine.';

  @override
  String get onboardingLocationEnable => 'Attiva Posizione';

  @override
  String get onboardingLocationSkip => 'Non ora';

  @override
  String get onboardingDiscoveryTitle => 'Il tuo primo ripetitore';

  @override
  String get onboardingDiscoverySubtitle => 'Ecco cosa c\'è vicino a te!';

  @override
  String get onboardingDiscoveryViewDetails => 'Vedi Dettagli';

  @override
  String get onboardingDiscoveryViewSpot => 'Vedi Spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Esplora la Mappa';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Esplora la mappa per trovare ripetitori e attivazioni POTA';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Ripetitore vicino';

  @override
  String get onboardingDiscoveryLivePota => 'Spot POTA attivo';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'Nessun ripetitore trovato nelle vicinanze';

  @override
  String get onboardingTelegramTitle => 'Unisciti alla community';

  @override
  String get onboardingTelegramSubtitle =>
      'Entra nel gruppo Telegram di HamQRG per ricevere aggiornamenti, segnalare ripetitori e conoscere altri radioamatori.';

  @override
  String get onboardingTelegramJoin => 'Unisciti al Gruppo Telegram';

  @override
  String get onboardingTelegramLater => 'Forse dopo';

  @override
  String get onboardingTelegramAlreadyMember => 'Sono già membro';

  @override
  String get addRepeaterProfileTile => 'Proponi nuovo ripetitore';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Segnala un ripetitore non ancora presente';

  @override
  String get addRepeaterTitle => 'Nuovo Ripetitore';

  @override
  String get addRepeaterHeadline => 'Segnala un ripetitore mancante';

  @override
  String get addRepeaterDescription =>
      'Compila i dati del ripetitore che vorresti aggiungere. La segnalazione verrà revisionata prima della pubblicazione.';

  @override
  String get addRepeaterSectionRepeater => 'Dati ripetitore';

  @override
  String get addRepeaterSectionAccesses => 'Accessi';

  @override
  String get addRepeaterSectionLocation => 'Posizione';

  @override
  String get addRepeaterSectionNotes => 'Note';

  @override
  String get addRepeaterName => 'Nome';

  @override
  String get addRepeaterNameHint => 'Es. Monte Cimone';

  @override
  String get addRepeaterCallsign => 'Nominativo';

  @override
  String get addRepeaterCallsignHint => 'Es. IR4AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Inserisci almeno il nome o il nominativo';

  @override
  String get addRepeaterFrequency => 'Frequenza (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Es. 145.000 o 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frequenza obbligatoria';

  @override
  String get addRepeaterFrequencyInvalid => 'Frequenza non valida';

  @override
  String get addRepeaterShift => 'Shift (MHz)';

  @override
  String get addRepeaterShiftHint => 'Es. -0.600 o -0,600';

  @override
  String get addRepeaterRegion => 'Regione';

  @override
  String get addRepeaterRegionHint => 'Es. Emilia-Romagna';

  @override
  String get addRepeaterProvinceCode => 'Provincia';

  @override
  String get addRepeaterProvinceCodeHint => 'Es. MO';

  @override
  String get addRepeaterLocality => 'Località';

  @override
  String get addRepeaterLocalityHint => 'Es. Fanano';

  @override
  String get addRepeaterLatitude => 'Latitudine';

  @override
  String get addRepeaterLatitudeHint => 'Es. 44.2100';

  @override
  String get addRepeaterLongitude => 'Longitudine';

  @override
  String get addRepeaterLongitudeHint => 'Es. 10.7900';

  @override
  String get addRepeaterLocator => 'Locator';

  @override
  String get addRepeaterLocatorHint => 'Es. JN54QF';

  @override
  String get addRepeaterNotes => 'Note aggiuntive';

  @override
  String get addRepeaterNotesHint =>
      'Informazioni aggiuntive sul ripetitore...';

  @override
  String get addRepeaterAddAccess => 'Aggiungi accesso';

  @override
  String get addRepeaterRemoveAccess => 'Rimuovi';

  @override
  String get addRepeaterAccessMode => 'Modo';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Es. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Es. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'Codice DCS';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Es. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Es. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Es. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Es. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Es. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Nome rete';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Es. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Note accesso';

  @override
  String get addRepeaterAccessNotesHint =>
      'Note specifiche per questo accesso...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Confermo che queste informazioni sono corrette in base alla mia conoscenza.';

  @override
  String get addRepeaterVerifiedTitle => 'Segnalazione verificata';

  @override
  String get addRepeaterVerifiedDescription =>
      'La tua segnalazione sarà revisionata dal team prima di essere pubblicata nel database.';

  @override
  String get addRepeaterSubmit => 'Invia';

  @override
  String get addRepeaterSuccess => 'Segnalazione inviata con successo!';

  @override
  String get addRepeaterError => 'Errore durante l\'invio della segnalazione';

  @override
  String get addRepeaterAtLeastOneAccess => 'Aggiungi almeno un accesso';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Accesso $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'Spot POTA in tempo reale con mappa e dettagli parco';

  @override
  String get changelog1017SubmitRepeater =>
      'Proponi un nuovo ripetitore direttamente dall\'app';

  @override
  String get changelog1017MultiLanguage =>
      'App disponibile in inglese, spagnolo e francese';

  @override
  String get changelog1017Onboarding => 'Nuova esperienza di primo avvio';

  @override
  String get changelog1017ReportAnonymous =>
      'Segnalazioni disponibili anche senza registrazione';

  @override
  String get changelog1020ClusterSpots =>
      'Cluster spot in tempo reale: vedi chi è in ascolto sui ripetitori, con notifiche e preferenze';

  @override
  String get changelog1020DetailTabs =>
      'Pagina ripetitore con tab Info, Cluster e Community';

  @override
  String get changelog1020TabletLayout => 'Layout ottimizzato per tablet';

  @override
  String get changelog110Coverage =>
      'Mappa di copertura dei ripetitori: vedi il segnale stimato direttamente sulla mappa (PRO)';

  @override
  String get changelog110Reachable =>
      'Cosa raggiungi da qui: scopri i ponti che prendi dalla tua posizione, con segnale e profilo del terreno (PRO)';

  @override
  String get changelogTitle => 'Novità';

  @override
  String get changelogSubtitle => 'Ecco cosa c\'è di nuovo in questa versione';

  @override
  String get changelogCategoryAdded => 'Nuovo';

  @override
  String get changelogCategoryImproved => 'Migliorato';

  @override
  String get changelogCategoryFixed => 'Corretto';

  @override
  String get changelogDismiss => 'Ho capito!';

  @override
  String get spotCreateTitle => 'Spottati';

  @override
  String get spotCreateOtherTitle => 'Spotta un OM';

  @override
  String get spotCreateDuration => 'Durata';

  @override
  String get spotCreateAccess => 'Modalità (opzionale)';

  @override
  String get spotCreateCallsign => 'Callsign dell\'OM sentito';

  @override
  String get spotCreateCallsignHint => 'Es. IZ0ABC';

  @override
  String get spotCreateConfirm => 'Conferma';

  @override
  String get spotCreateSuccessSelf => 'Spot creato!';

  @override
  String get spotCreateSuccessOther => 'OM spottato!';

  @override
  String get spotActiveYou => 'Sei spottato';

  @override
  String get spotActiveClose => 'Chiudi spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'su $repeaterName';
  }

  @override
  String get spotActiveNone => 'Nessuno spottato al momento';

  @override
  String get spotActiveCta => 'Spottati tu!';

  @override
  String get spotActiveSection => 'Spot attivi';

  @override
  String get spotHistorySection => 'Storico spot';

  @override
  String get spotListTitle => 'Ultimi spot';

  @override
  String get spotListViewAll => 'Vedi tutti';

  @override
  String get spotListBadgeActive => 'In ascolto';

  @override
  String get spotListBadgeClosed => 'Concluso';

  @override
  String get spotListBadgeReport => 'Segnalazione';

  @override
  String get spotListEmpty => 'Nessuno spot nelle ultime 24 ore';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Segnalato da $callsign';
  }

  @override
  String get spotNotificationToggle => 'Notifiche cluster';

  @override
  String get spotNotificationDisabled =>
      'Notifiche cluster disattivate nelle impostazioni profilo';

  @override
  String get spotNotificationPerFavorite => 'Notifiche spot';

  @override
  String get spotPreviousClosed => 'Il tuo spot precedente non è più attivo';

  @override
  String get spotErrorAuthRequired => 'Devi effettuare l\'accesso.';

  @override
  String get spotErrorCallsignRequired =>
      'Imposta il tuo callsign nel profilo per usare il cluster.';

  @override
  String get spotErrorInvalidDuration =>
      'La durata deve essere tra 5 e 60 minuti.';

  @override
  String get spotErrorRepeaterNotFound => 'Ponte non trovato.';

  @override
  String get spotErrorInvalidAccess =>
      'Modalità di accesso non valida per questo ponte.';

  @override
  String get spotErrorSpotNotFound => 'Spot non trovato.';

  @override
  String get spotErrorForbidden => 'Non puoi chiudere uno spot che non è tuo.';

  @override
  String get spotErrorAlreadyClosed => 'Lo spot è già stato chiuso.';

  @override
  String get spotErrorGeneric => 'Errore nella creazione dello spot. Riprova.';

  @override
  String get spotAccessUnavailable => '(modalità non più disponibile)';

  @override
  String spotDurationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get sotaTitle => 'SOTA Spots';

  @override
  String get sotaListEmpty => 'Nessuno spot SOTA al momento';

  @override
  String get sotaLoadError => 'Errore nel caricamento spot SOTA';

  @override
  String get sotaRetry => 'Riprova';

  @override
  String get sotaSummitPursuit => 'Vista verso la cima';

  @override
  String get sotaLosClear => 'Vista libera';

  @override
  String get sotaLosObstructed => 'Possibile ostruzione';

  @override
  String sotaLosObstructionAt(String distance, String height) {
    return 'Ostacolo a $distance, +$height';
  }

  @override
  String sotaPointsBadge(int count) {
    return '$count pt';
  }

  @override
  String get sotaFilterAll => 'Tutti';

  @override
  String get spotsFiltersTitle => 'Filtri';

  @override
  String get spotsFilterBand => 'Banda';

  @override
  String get spotsFilterMode => 'Modo';

  @override
  String get spotsFilterAll => 'Tutti';

  @override
  String get spotsFiltersReset => 'Azzera filtri';

  @override
  String get sotaSortByTime => 'Tempo';

  @override
  String get sotaSortByDistance => 'Distanza';

  @override
  String get sotaFilterPoints => 'Punti';

  @override
  String get sotaFilterAssociation => 'Paese';

  @override
  String get sotaSpotQrt => 'QRT';

  @override
  String sotaSummitInvalidFrom(String date) {
    return 'Cima non più valida dal $date';
  }

  @override
  String get sotaSummitRestrictions => 'Accesso con restrizioni';

  @override
  String get sotaPursuitNoLocation =>
      'Attiva la posizione per vedere il profilo verso la cima';

  @override
  String get sotaPursuitTooClose => 'Sei praticamente sulla cima';

  @override
  String get sotaPursuitTooFar =>
      'Cima troppo distante per il profilo di terreno';

  @override
  String get sotaPursuitError => 'Impossibile calcolare il profilo. Riprova.';

  @override
  String get sotaPursuitLoading => 'Calcolo profilo altimetrico…';

  @override
  String get sotaCopyFrequency => 'Copia frequenza';

  @override
  String get sotaOpenOnMap => 'Apri sulla mappa';

  @override
  String get sotaShare => 'Condividi';

  @override
  String get sotaViewAll => 'Vedi tutti';

  @override
  String get sotaTabDashboard => 'SOTA';

  @override
  String get sotaIntroEmpty =>
      'SOTA: Summits On The Air. Insegui i radioamatori che attivano cime montane.';

  @override
  String sotaSpotCount(int count) {
    return '$count spot';
  }

  @override
  String get sotaActivator => 'Attivatore';

  @override
  String get sotaSummit => 'Cima';

  @override
  String get sotaAssociation => 'Associazione';

  @override
  String get sotaRegion => 'Regione';

  @override
  String get sotaLocator => 'Locatore';

  @override
  String get sotaDistance => 'Distanza';

  @override
  String get sotaBearing => 'Direzione';

  @override
  String get sotaElevationDelta => 'Dislivello';

  @override
  String get sotaRemoveFilters => 'Rimuovi filtri';

  @override
  String get sotaPointsTitle => 'Punti';

  @override
  String get sotaSpotInfo => 'Info spot';

  @override
  String get sotaTime => 'Orario';

  @override
  String get sotaCopiedToClipboard => 'Frequenza copiata';

  @override
  String sotaPointsAbove(int count) {
    return '$count+ pt';
  }

  @override
  String get sotaFilterPointsAll => 'Punti: tutti';

  @override
  String get reachSheetError => 'Impossibile calcolare i ponti raggiungibili.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Raggiungi $count ponti',
      one: 'Raggiungi 1 ponte',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Dalla tua posizione, ordinati per segnale';

  @override
  String get reachSheetEmpty => 'Nessun ponte raggiungibile nei dintorni.';

  @override
  String get reachBadgeTitle => 'Lo raggiungi da qui?';

  @override
  String get reachBadgeSubtitle =>
      'Scopri se questo ponte ti copre e con che segnale';

  @override
  String get reachDiscoverCta => 'Scoprilo con PRO';

  @override
  String get reachReachable => 'Lo raggiungi';

  @override
  String get reachOutOfCoverage => 'Fuori copertura';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · tocca per il profilo';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance da qui';
  }

  @override
  String get reachComputing => 'Calcolo copertura…';

  @override
  String get reachRepeaterFallback => 'Ponte';

  @override
  String get reachMapButton => 'Cosa raggiungi?';

  @override
  String get reachUpsellTitle => 'Cosa raggiungi da qui? 📡';

  @override
  String get reachUpsellBody =>
      'Scopri in tempo reale TUTTI i ponti che prendi dalla tua posizione — con segnale previsto e profilo del terreno. Quanti ne raggiungi davvero da dove sei adesso?';

  @override
  String get reachUpsellLater => 'Più tardi';

  @override
  String get linkProfileObstructed =>
      'Ostacolo sul percorso (segnale per diffrazione)';

  @override
  String get linkProfileClear => 'Vista diretta libera';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Profilo del terreno e linea di vista · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Sblocca con PRO';

  @override
  String get proWelcomeTitle => 'Benvenuto in PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Hai sbloccato la mappa di copertura, i ponti che raggiungi dalla tua posizione e tutte le funzioni PRO. 📡';

  @override
  String get proWelcomeCta => 'Inizia a esplorare';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonDelete => 'Cancella';

  @override
  String get commonEdit => 'Modifica';

  @override
  String get commonOpenSettings => 'Apri impostazioni';

  @override
  String get commonFieldRequired => 'Campo obbligatorio';

  @override
  String get fieldName => 'Nome';

  @override
  String get fieldAddress => 'Indirizzo';

  @override
  String get fieldCity => 'Città';

  @override
  String get fieldDescription => 'Descrizione';

  @override
  String get fieldYear => 'Anno';

  @override
  String get fieldSelectDateHint => 'Seleziona una data';

  @override
  String get validationInvalidYear => 'Seleziona un anno valido';

  @override
  String get validationPasswordMinLength =>
      'La password deve essere lunga almeno 6 caratteri';

  @override
  String get permissionsMissingTitle => 'Mancano i permessi!';

  @override
  String get imageUploadError => 'Errore durante il caricamento dell\'immagine';

  @override
  String get uploadImageLabel => 'Carica immagine';

  @override
  String get sourceGallery => 'Galleria';

  @override
  String get sourceCamera => 'Fotocamera';

  @override
  String get changePasswordTitle => 'Cambia Password';

  @override
  String get fieldNewPassword => 'Nuova Password';

  @override
  String get fieldConfirmNewPassword => 'Conferma Nuova Password';

  @override
  String get validationPasswordsNoMatch => 'Le password non corrispondono';

  @override
  String get passwordChangedSuccess => 'Password cambiata con successo';

  @override
  String errorWithMessage(String message) {
    return 'Errore: $message';
  }

  @override
  String get updateRequiredTitle => 'Aggiornamento richiesto';

  @override
  String get updateRequiredAction => 'Aggiorna ora';

  @override
  String get yearPickerTitle => 'Seleziona l\'anno';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Community';

  @override
  String get updateRequiredBody =>
      'È disponibile una nuova versione dell\'app. Aggiorna per continuare a utilizzare l\'applicazione.';

  @override
  String get errorOpeningStore => 'Errore durante l\'apertura dello store';

  @override
  String get deleteConfirmTitle => 'Conferma cancellazione';

  @override
  String get deleteConfirmContent => 'Sei sicuro di voler cancellare?';

  @override
  String get cameraPermissionRationale =>
      'Per scattare una foto, consenti l\'accesso alla fotocamera dalle impostazioni.';

  @override
  String get coverageSearchHint => 'Cerca una località o incolla coordinate';

  @override
  String get coverageSearchRecentTitle => 'Ricerche recenti';

  @override
  String get coverageSearchNoResults => 'Nessun luogo trovato';

  @override
  String get coverageSearchTip =>
      'Puoi incollare coordinate (46.4879, 11.8123) o tenere premuto sulla mappa';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Coordinate fuori intervallo: latitudine ±90, longitudine ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Nessuna connessione: la ricerca di località richiede rete';

  @override
  String get coverageSearchErrorFailed => 'Ricerca non riuscita. Riprova.';

  @override
  String get coverageSearchClearPoint => 'Rimuovi punto';

  @override
  String get coverageSearchPointSemantics => 'Punto di ricerca selezionato';

  @override
  String get coverageBreadthTitle => 'Ampiezza ricerca';

  @override
  String get coverageBreadthQuick => 'Rapida';

  @override
  String get coverageBreadthMedium => 'Media';

  @override
  String get coverageBreadthExtended => 'Estesa';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · risposta più veloce';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · equilibrata';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · più lontano, attesa maggiore';
  }

  @override
  String get coverageResultSubtitle => 'Dal punto selezionato';

  @override
  String get coverageResultEmptyNoReachable =>
      'Nessun ripetitore raggiungibile da questo punto';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'Nessun ripetitore censito in quest\'area';

  @override
  String get coverageResultClearFilters => 'Rimuovi i filtri';

  @override
  String get coverageResultError => 'Calcolo non riuscito';

  @override
  String get coverageResultComputing => 'Calcolo della ricezione…';

  @override
  String get coverageResultCancel => 'Annulla';

  @override
  String coverageResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ripetitori raggiungibili',
      one: '1 ripetitore raggiungibile',
    );
    return '$_temp0';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown di $total raggiungibili';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count raggiungibili nascosti dai filtri',
      one: '1 raggiungibile nascosto dai filtri',
    );
    return '$_temp0';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Cosa raggiungi da $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Ogni ponte che prendi da quel punto, con segnale previsto e distanza — prima ancora di partire.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Qualunque punto del pianeta';

  @override
  String get coverageTeaserBenefitOffline =>
      'Consultabile senza rete, in campo';

  @override
  String get coverageTeaserBenefitSave => 'Salvi la postazione e la ritrovi';

  @override
  String get stationSaveCta => 'Salva postazione';

  @override
  String get stationSaveTitle => 'Nome della postazione';

  @override
  String get stationRename => 'Rinomina';

  @override
  String get stationDelete => 'Elimina';

  @override
  String get stationRefresh => 'Aggiorna';

  @override
  String get stationRefreshAll => 'Aggiorna tutte';

  @override
  String get stationOfflineNotice => 'Dato memorizzato sul dispositivo';

  @override
  String get stationStaleNotice => 'Il dato potrebbe non essere aggiornato';

  @override
  String get stationMissingEntry => 'Dato non disponibile offline';

  @override
  String get stationDuplicateTitle => 'Punto già salvato';

  @override
  String stationDuplicateBody(String distance) {
    return 'Esiste già una postazione a meno di $distance da qui. Vuoi aggiornarla o crearne una distinta?';
  }

  @override
  String get stationDuplicateUpdate => 'Aggiorna quella';

  @override
  String get stationDuplicateCreate => 'Crea distinta';

  @override
  String get stationSaveFailed =>
      'Salvataggio non riuscito: spazio insufficiente';

  @override
  String get stationSavedCta => 'Postazione salvata';

  @override
  String get stationRemoveCta => 'Rimuovi';

  @override
  String get stationRemoveTitle => 'Rimuovere la postazione?';

  @override
  String stationRemoveBody(String name) {
    return '«$name» e i suoi dati offline verranno eliminati da questo dispositivo.';
  }

  @override
  String get stationRemovedSnack => 'Postazione rimossa';

  @override
  String get stationSaveError => 'Salvataggio non riuscito. Riprova.';

  @override
  String get stationsTitle => 'Le mie postazioni';

  @override
  String get stationsProfileSubtitle =>
      'I punti che hai valutato, consultabili senza rete';

  @override
  String get stationsEmptyTitle => 'Nessuna postazione salvata';

  @override
  String get stationsEmptyBody =>
      'Una postazione è un punto della mappa di cui hai già la copertura, salvata per ritrovarla anche senza rete.';

  @override
  String get stationsEmptyStep1 =>
      'Scegli un punto sulla mappa: tieni premuto, cercalo per nome o incolla le coordinate.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Tocca «$action» per vedere quali ripetitori arrivi a prendere da lì.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Salva il punto: lo ritrovi qui, anche in campo senza rete.';

  @override
  String get stationsGoToMap => 'Vai alla mappa';

  @override
  String get stationsRefreshDone => 'Aggiornamento completato';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Aggiornato $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Aggiornamento tra $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Aggiornamento tra $minutes min';
  }

  @override
  String get spotsUpdating => 'Aggiornamento…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Aggiornamento automatico ogni $seconds secondi';
  }

  @override
  String get spotsManualRefreshHint => 'Tocca per aggiornare';

  @override
  String coverageResultScope(String km, int count) {
    return 'entro $km · $count valutati';
  }

  @override
  String get coverageResultRecalculating => 'Ricalcolo in corso';

  @override
  String get offlineBannerMessage =>
      'Sei offline: stai consultando i dati salvati';

  @override
  String get offlineMapsTitle => 'Mappe offline';

  @override
  String get offlineMapsEntrySubtitle =>
      'Scarica le mappe per l\'uso senza rete';

  @override
  String get offlineMapsEmpty =>
      'Nessuna regione scaricata. Scarica una zona per vedere la mappa anche senza rete.';

  @override
  String get offlineMapsAddRegion => 'Scarica regione';

  @override
  String get offlineMapsRegionNameLabel => 'Nome della regione';

  @override
  String get offlineMapsRegionNameHint => 'Es. Casa, Rifugio, Attivazione SOTA';

  @override
  String get offlineMapsRadiusLabel => 'Raggio';

  @override
  String get offlineMapsDownload => 'Scarica';

  @override
  String get offlineMapsDownloadingStyle => 'Download dello stile mappa…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Download delle mappe… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Dimensione stimata: $size';
  }

  @override
  String get offlineMapsDownloadError => 'Download non riuscito. Riprova.';

  @override
  String get offlineMapsDeleteError => 'Eliminazione non riuscita. Riprova.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Eliminare la regione?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '“$name” non sarà più disponibile senza rete.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Elimina';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Raggio $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Download incompleto';

  @override
  String get offlineMapsResume => 'Riprendi';

  @override
  String get offlineMapsCenterInfo =>
      'La regione sarà centrata sulla tua posizione attuale.';

  @override
  String get dashboardOfflineTitle => 'Sei offline';

  @override
  String get dashboardOfflineMessage =>
      'Non ci sono dati salvati per questa zona. Le tue postazioni salvate e le mappe scaricate restano disponibili.';

  @override
  String get offlineMapsCenterMine => 'La mia posizione';

  @override
  String get offlineMapsCenterSearch => 'Cerca un luogo';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Cerca una città o un luogo: la regione sarà centrata lì.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Centro: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Modalità offline: ripetitori, preferiti, profilo, copertura e raggiungibilità consultabili anche senza rete (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Mappe offline: scarica la zona dove ti trovi o un luogo a tua scelta e usala senza connessione (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Ricerca copertura da qualsiasi punto: cerca una località, incolla coordinate o tieni premuto sulla mappa per scoprire cosa raggiungi da lì';

  @override
  String get changelog120SavedStations =>
      'Le mie postazioni: salva i punti che ti interessano e consultali anche offline (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'Spot SOTA e POTA si aggiornano da soli ogni minuto, con badge colorati per modo (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Senza connessione l\'app avvia subito, mostra cosa è disponibile e disattiva le azioni che richiedono la rete';

  @override
  String get changelog130ImperialUnits =>
      'Miglia e piedi: l’app segue le unità del tuo dispositivo, e nelle Impostazioni puoi scegliere il sistema a mano';
}
