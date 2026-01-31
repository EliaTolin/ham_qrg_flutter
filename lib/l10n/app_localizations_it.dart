// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

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
  String get benefitActiveCommunity => 'Community attiva';

  @override
  String get joinNowButton => 'Unisciti ora!';

  @override
  String get laterButton => 'Più tardi';

  @override
  String get errorOpenTelegram => 'Errore durante l\'apertura di Telegram';

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
  String get repeatersSearchHint => 'Cerca ripetitori…';

  @override
  String get repeatersSearchEmpty => 'Nessun ripetitore trovato.';

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
  String get authUnexpectedError => 'Errore inaspettato';

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
  String repeaterDetailDistanceWarning(int distance) {
    return 'Devi essere entro $distance km dal ripetitore per inviare un feedback.';
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
    return 'Il luogo selezionato si trova a $distance km dal ripetitore. Confermi di voler inviare questo feedback sotto la tua responsabilità?';
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
  String get reportIssueTitle => 'Segnala Problema';

  @override
  String get reportIssueHeadline => 'Aiutaci a mantenere i dati accurati';

  @override
  String get reportIssueDescription =>
      'Hai trovato qualcosa di sbagliato in questo ripetitore? Facci sapere cosa deve essere modificato e lo verificheremo.';

  @override
  String get reportIssueWhatToCorrect => 'Cosa vorresti correggere?';

  @override
  String get reportIssuePlaceholder =>
      'Es. Il tono CTCSS è cambiato a 88.5Hz, o la posizione è leggermente più a nord...';

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
}
