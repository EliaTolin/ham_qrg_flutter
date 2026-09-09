// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get proSectionTitle => 'Abonnement';

  @override
  String get proCardUpgradeTitle => 'Sieh, was du erreichst';

  @override
  String get proCardUpgradeSubtitle => 'Abdeckung, Relais und Offline-Karten';

  @override
  String get proCardActiveTitle => 'HamQRG Pro aktiv';

  @override
  String get proCardActiveSubtitle => 'Danke für deine Unterstützung!';

  @override
  String proPriceFromMonth(String price) {
    return 'Ab $price pro Monat · Jederzeit kündbar';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Gratis testen, dann $price pro Monat · Jederzeit kündbar';
  }

  @override
  String proPriceLifetime(String price) {
    return 'Einmalig $price · Für immer';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Ab $price pro Monat · $total im Voraus · Jederzeit kündbar';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Gratis testen, dann $price pro Monat · $total im Voraus · Jederzeit kündbar';
  }

  @override
  String get proRestoreSuccess =>
      'Käufe wiederhergestellt: HamQRG Pro ist aktiv';

  @override
  String get proRestoreNone => 'Keine Käufe zum Wiederherstellen';

  @override
  String get proManageSubscription => 'Abo verwalten';

  @override
  String get proLinkAccountTitle => 'Konto verknüpfen';

  @override
  String get proLinkAccountBody =>
      'Verknüpfe HamQRG Pro mit einem Konto, damit es auf jedem Gerät bleibt – auch nach einer Neuinstallation.';

  @override
  String get stationsShowcaseTitle => 'Deine Standorte, auch ohne Netz';

  @override
  String get stationsShowcaseBody =>
      'Speichere Zuhause, die Hütte, den Aktivierungsplatz: Was du erreichst, bleibt da – auch ohne Netz.';

  @override
  String get offlineMapsUpsellTitle => 'Die Karte bleibt auf dem Handy 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Lade die Gebiete herunter, die du brauchst, und öffne sie ohne Signal: am Grat, im Tunnel, im Ausland ohne Daten.';

  @override
  String get offlineMapsBenefitRegions =>
      'Du wählst die Gebiete zum Herunterladen';

  @override
  String get reachUpsellBenefitSignal =>
      'Vorhergesagtes Signal für jedes Relais';

  @override
  String get reachUpsellBenefitTerrain =>
      'Geländeprofil zwischen dir und dem Relais';

  @override
  String get proRestoreCta => 'Käufe wiederherstellen';

  @override
  String get error => 'Fehler';

  @override
  String get error_message => 'Beim Laden ist ein Fehler aufgetreten';

  @override
  String get error_message_retry =>
      'Beim Laden ist ein Fehler aufgetreten. Bitte versuche es später erneut';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get back => 'Zurück';

  @override
  String get loading => 'Laden';

  @override
  String get details => 'Details';

  @override
  String pages_number(Object number) {
    return '$number Seiten zum Entdecken';
  }

  @override
  String get january => 'Januar';

  @override
  String get february => 'Februar';

  @override
  String get march => 'März';

  @override
  String get april => 'April';

  @override
  String get may => 'Mai';

  @override
  String get june => 'Juni';

  @override
  String get july => 'Juli';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'Oktober';

  @override
  String get november => 'November';

  @override
  String get december => 'Dezember';

  @override
  String get logout => 'Abmelden';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Einstellungen';

  @override
  String get contact_us => 'Kontaktiere uns';

  @override
  String get error_opening_email =>
      'Beim Öffnen der E-Mail ist ein Fehler aufgetreten';

  @override
  String get register_now => 'Jetzt registrieren';

  @override
  String get tracking_permission_title => 'Unterstütze die App';

  @override
  String get tracking_permission_message =>
      'Um dein Erlebnis zu verbessern und dir relevantere Inhalte zu zeigen, hilf uns, die App kostenlos zu halten.\n\nTippe auf Erlauben, um uns zu unterstützen.';

  @override
  String get tracking_permission_next => 'Weiter';

  @override
  String get skip => 'Überspringen';

  @override
  String get done => 'Fertig';

  @override
  String get next => 'Weiter';

  @override
  String get joinCommunityTitle => 'Tritt unserer Community bei!';

  @override
  String get joinCommunityDescription =>
      'Entdecke die Vorteile der Telegram-Community:';

  @override
  String get benefitSupportMembers => 'Unterstützung durch Mitglieder';

  @override
  String get benefitSuggestFeatures => 'Neue Funktionen vorschlagen';

  @override
  String get benefitContactDevelopers => 'Kontakt zu Entwicklern';

  @override
  String get benefitExclusivePreviews => 'Exklusive Vorschauen und Betas';

  @override
  String get benefitActiveCommunity => 'Aktive Community';

  @override
  String get joinNowButton => 'Jetzt beitreten!';

  @override
  String get alreadyMemberButton => 'Ich bin bereits Mitglied';

  @override
  String get laterButton => 'Später';

  @override
  String get errorOpenTelegram => 'Fehler beim Öffnen von Telegram';

  @override
  String get disclaimerTitle => 'Datenquelle';

  @override
  String get disclaimerDescription =>
      'Die Relaisdaten in dieser App stammen von IZ8WNH.\n\nFür zusätzliche Informationen, zum Herunterladen von CSV-Dateien zur Radioprogrammierung oder zur Einsicht in Daten, die in dieser App nicht verfügbar sind, besuche die offizielle Website.';

  @override
  String get disclaimerVisitSite => 'iz8wnh.it besuchen';

  @override
  String get disclaimerUnderstood => 'Verstanden';

  @override
  String get errorOpenDisclaimerSite => 'Fehler beim Öffnen der Website';

  @override
  String get repeatersMapTitle => 'Relaiskarte';

  @override
  String get repeatersListTitle => 'Relaisliste';

  @override
  String get repeatersMapLoading => 'Relaiskarte wird geladen…';

  @override
  String get repeatersMapGenericError => 'Relais konnten nicht geladen werden.';

  @override
  String get repeatersMapEmpty => 'Keine Relais in deiner Nähe gefunden.';

  @override
  String get repeatersSearchHint =>
      'Nach Name, Rufzeichen oder Frequenz MHz suchen…';

  @override
  String get repeatersSearchEmpty => 'Keine Relais gefunden.';

  @override
  String get repeatersSortDistance => 'Entfernung';

  @override
  String get repeatersSortLikes => 'Likes';

  @override
  String get repeatersSortFrequency => 'Frequenz';

  @override
  String repeatersNearbyCount(int count) {
    return '$count Relais in der Nähe';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count Ergebnisse';
  }

  @override
  String get repeatersMapRetry => 'Erneut versuchen';

  @override
  String get repeatersMapOpenSettings => 'Einstellungen öffnen';

  @override
  String get repeatersMapPermissionMessage =>
      'Erlaube den Standortzugriff, um Relais in deiner Nähe anzuzeigen.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Standortberechtigung dauerhaft verweigert. Aktiviere sie in den Systemeinstellungen.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Aktiviere die Ortungsdienste, um Relais in der Nähe zu finden.';

  @override
  String repeatersMapFound(int count) {
    return '$count Relais gefunden';
  }

  @override
  String get repeaterMode => 'Betriebsart';

  @override
  String get repeaterModeAnalog => 'Analog';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Alle Betriebsarten';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frequenz';

  @override
  String get repeaterShift => 'Ablage';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Standort';

  @override
  String get repeaterDistance => 'Entfernung';

  @override
  String get repeaterViewFullDetails => 'Alle Details anzeigen';

  @override
  String get repeatersMapReturnToLocation => 'Zurück zu meinem Standort';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count Relais an diesem Standort';
  }

  @override
  String get profileUnlockFeatures => 'Alle Funktionen freischalten';

  @override
  String get profileUnlockFeaturesDescription =>
      'Registriere dich, um Bewertungen, Favoritenspeicherung und detaillierte Statistiken zu nutzen.';

  @override
  String get profileSignUpOrLogin => 'Registrieren oder Anmelden';

  @override
  String get profileErrorOpeningEmail => 'Fehler beim Öffnen der E-Mail';

  @override
  String get profileJoinTelegramCommunity => 'Der Telegram-Community beitreten';

  @override
  String get profileWelcomeTitle => 'Willkommen bei HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Tritt unserer Amateurfunk-Community in Italien bei.';

  @override
  String get profileEditProfile => 'Profil bearbeiten';

  @override
  String get profileChangePhoto => 'Foto ändern';

  @override
  String get profileFirstName => 'Vorname';

  @override
  String get profileLastName => 'Nachname';

  @override
  String get profileCallsign => 'Rufzeichen';

  @override
  String get profileRestartIdentificationTitle =>
      'Möchtest du deinen Status ändern? Du kannst den Identifikationsprozess neu starten, um zwischen lizenziertem Funkamateur und SWL-Hörer zu wechseln.';

  @override
  String get profileRestartIdentificationButton =>
      'Identifikationsprozess neu starten';

  @override
  String get profileSaveChanges => 'Änderungen speichern';

  @override
  String get profileDangerZone => 'Gefahrenbereich';

  @override
  String get profileDeleteAccount => 'Konto löschen';

  @override
  String get profileDeleteAccountConfirmTitle => 'Konto löschen';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Bist du sicher, dass du dein Konto löschen möchtest? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get profileDeleteAccountCancel => 'Abbrechen';

  @override
  String get profileDeleteAccountConfirm => 'Löschen';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'App-Version $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Community & Unterstützung';

  @override
  String get profileSectionSupport => 'Unterstützung';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Version: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Version $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Fehler: $error';
  }

  @override
  String get authJoinTitle => 'HamQRG beitreten';

  @override
  String get authUnlockFeatures =>
      'Melde dich an, um alle Funktionen freizuschalten!';

  @override
  String get authWhatYouGet => 'Das erwartet dich:';

  @override
  String get authBenefitStatsTitle => 'Detaillierte Statistiken';

  @override
  String get authBenefitStatsDescription =>
      'Verfolge deinen Fortschritt und verbessere dich';

  @override
  String get authBenefitQuizTitle => 'Verschiedene Quiz-Modi';

  @override
  String get authBenefitQuizDescription =>
      'Übe im Marathon-, Themen- und weiteren Modi.';

  @override
  String get authBenefitSyncTitle => 'Synchronisierung';

  @override
  String get authBenefitSyncDescription => 'Zugriff von jedem Gerät';

  @override
  String get authOrSignInWithEmail => 'Oder mit E-Mail anmelden';

  @override
  String get authEnterEmail => 'E-Mail eingeben';

  @override
  String get authEnterPassword => 'Passwort eingeben';

  @override
  String get authForgotPassword => 'Passwort vergessen?';

  @override
  String get authSignIn => 'Anmelden';

  @override
  String get authSignUp => 'Registrieren';

  @override
  String get authPasswordLengthError => 'Passwort muss länger sein';

  @override
  String get authDontHaveAccount => 'Noch kein Konto? Registrieren';

  @override
  String get authHaveAccount => 'Bereits ein Konto? Anmelden';

  @override
  String get authBackToSignIn => 'Zurück zur Anmeldung';

  @override
  String get authUnexpectedError => 'Authentifizierungsfehler: ';

  @override
  String get authValidEmailError => 'Gib eine gültige E-Mail-Adresse ein';

  @override
  String get authSendPasswordReset => 'Passwort zurücksetzen senden';

  @override
  String get authPasswordResetSent => 'Passwort-Zurücksetzung gesendet';

  @override
  String get authVerifyEmailMessage =>
      'Bestätige deine E-Mail, um die Registrierung abzuschließen. Überprüfe deinen Posteingang.';

  @override
  String get authInvalidCredentials =>
      'Ungültige E-Mail oder ungültiges Passwort';

  @override
  String get authEmailNotConfirmed =>
      'Bestätige deine E-Mail, um dich anzumelden';

  @override
  String get authFirstName => 'Vorname';

  @override
  String get authFirstNameRequired => 'Vorname ist erforderlich';

  @override
  String get authLastName => 'Nachname';

  @override
  String get authLastNameRequired => 'Nachname ist erforderlich';

  @override
  String get authContinueAsGuest => 'Als Gast fortfahren';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Entdecke die Relais in deiner Umgebung';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Schnellzugriff';

  @override
  String get homeRepeaterList => 'Relaisliste';

  @override
  String get homeMyFavorites => 'Meine Favoriten';

  @override
  String get homeNearby => 'In deiner Nähe';

  @override
  String get homeViewAll => 'Alle anzeigen';

  @override
  String get dashboardTabRepeaters => 'Relais';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Keine Relais in der Nähe';

  @override
  String get dashboardViewAllRepeaters => 'Alle Relais anzeigen';

  @override
  String get dashboardViewAllPotaSpots => 'Alle POTA Spots anzeigen';

  @override
  String homeStations(int count) {
    return '$count Stationen';
  }

  @override
  String homeSaved(int count) {
    return '$count gespeichert';
  }

  @override
  String homeStationsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Stationen',
      one: 'Station',
    );
    return '$_temp0';
  }

  @override
  String homeSavedLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'gespeichert',
    );
    return '$_temp0';
  }

  @override
  String get homeActive => 'Aktiv';

  @override
  String get homeIdle => 'Inaktiv';

  @override
  String get homeNavHome => 'Start';

  @override
  String get homeNavList => 'Liste';

  @override
  String get homeNavFavorites => 'Favoriten';

  @override
  String get homeNavMap => 'Karte';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Meine Favoriten';

  @override
  String get favoritesSearchHint => 'Gespeicherte Relais suchen...';

  @override
  String get favoritesFilterAllSaved => 'Alle gespeicherten';

  @override
  String get favoritesEmpty => 'Keine gespeicherten Relais';

  @override
  String get favoritesEmptyDescription =>
      'Füge Relais zu Favoriten hinzu, um sie hier zu sehen';

  @override
  String favoritesShowing(int showing, int total) {
    return '$showing von $total Favoritenstationen werden angezeigt';
  }

  @override
  String get favoritesRemove => 'Aus Favoriten entfernen';

  @override
  String get favoritesAdd => 'Zu Favoriten hinzufügen';

  @override
  String get repeaterDetailSave => 'Speichern';

  @override
  String get repeaterDetailShare => 'Teilen';

  @override
  String get repeaterDetailReport => 'Melden';

  @override
  String get repeaterDetailTotalLikes => 'Likes insgesamt';

  @override
  String get repeaterDetailReports1Yr => 'Meldungen (1 Jahr)';

  @override
  String get repeaterDetailHealthScore => 'Zustandsbewertung';

  @override
  String get repeaterDetailExcellent => 'Ausgezeichnet';

  @override
  String get repeaterDetailGood => 'Gut';

  @override
  String get repeaterDetailFair => 'Befriedigend';

  @override
  String get repeaterDetailToVerify => 'Zu überprüfen';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Bewertung basierend auf $count negativen Meldungen im letzten Jahr';
  }

  @override
  String get repeaterDetailLastLike => 'Letzter Like';

  @override
  String get repeaterDetailLastDownReport => 'Letzte negative Meldung';

  @override
  String get repeaterDetailTechnicalData => 'Technische Daten';

  @override
  String get repeaterDetailFrequency => 'Frequenz';

  @override
  String get repeaterDetailShift => 'Ablage';

  @override
  String get repeaterDetailSubtone => 'Subaudioton (SQL)';

  @override
  String get repeaterDetailMode => 'Betriebsart';

  @override
  String get repeaterDetailLocation => 'Standort';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance entfernt';
  }

  @override
  String get repeaterDetailCommunityReports => 'Community-Meldungen';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Status und Feedback aktualisieren';

  @override
  String get repeaterDetailEquipment => 'Ausrüstung';

  @override
  String get repeaterDetailEquipmentRequired => 'Ausrüstung *';

  @override
  String get repeaterDetailAccessModes => 'Zugangsmodi';

  @override
  String get repeaterDetailNetwork => 'Netzwerk';

  @override
  String get repeaterDetailLocationField => 'Standort';

  @override
  String get repeaterDetailLocationRequired => 'Standort *';

  @override
  String get repeaterDetailComment => 'Kommentar';

  @override
  String get repeaterDetailCommentOptional => 'Kommentar (optional)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Signalqualität, Audiobericht oder allgemeine Kommentare...';

  @override
  String get repeaterDetailReportDown => 'Problem melden';

  @override
  String get repeaterDetailCheckinLike => 'Einchecken und liken';

  @override
  String get repeaterDetailYourFeedback => 'Dein Feedback';

  @override
  String get repeaterDetailPostedJustNow => 'Gerade eben gepostet';

  @override
  String get repeaterDetailDeleteEntry => 'Eintrag löschen';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Alle $count Meldungen anzeigen';
  }

  @override
  String get repeaterDetailStationPortable => 'Portabel';

  @override
  String get repeaterDetailStationMobile => 'Mobil';

  @override
  String get repeaterDetailStationFixed => 'Feststation';

  @override
  String get repeaterDetailLike => 'Like';

  @override
  String get repeaterDetailReportLabel => 'Meldung';

  @override
  String get repeaterDetailSaved => 'Gespeichert';

  @override
  String get repeaterDetailShareMessage =>
      'Schau dir dieses Relais auf HamQRG an!';

  @override
  String get repeaterDetailReportDescription =>
      'Die Meldefunktion wird bald verfügbar sein. Du wirst fehlerhafte Informationen oder Probleme mit diesem Relais melden können.';

  @override
  String get commonClose => 'Schließen';

  @override
  String get favorite => 'Favorit';

  @override
  String get accessConfiguration => 'Zugangskonfiguration';

  @override
  String get noAccessConfiguration => 'Keine Konfiguration verfügbar';

  @override
  String get repeaterDetailAddFeedback => 'Feedback hinzufügen';

  @override
  String get repeaterDetailOthersReports => 'Meldungen anderer Nutzer';

  @override
  String get repeaterDetailRemove => 'Entfernen';

  @override
  String get repeaterDetailSelectAccess => 'Zugang auswählen';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Du musst dich innerhalb von $distance vom Relais befinden, um Feedback zu senden.';
  }

  @override
  String get repeaterDetailInteractive => 'Interaktiv';

  @override
  String get repeaterDetailLogYourSignal => 'Signal protokollieren';

  @override
  String get repeaterDetailUsedEquipment => 'Verwendete Ausrüstung';

  @override
  String get repeaterDetailYourLocation => 'Dein Standort';

  @override
  String get repeaterDetailLocationPlaceholder => 'Wo warst du? (z.B. Berlin)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Wähle einen Ort aus den Vorschlägen';

  @override
  String get feedbackDistanceConfirmTitle => 'Absendung bestätigen';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Der ausgewählte Standort ist $distance vom Relais entfernt. Bestätigst du, dass du dieses Feedback auf eigene Verantwortung senden möchtest?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Bestätigen';

  @override
  String get feedbackDistanceConfirmCancel => 'Abbrechen';

  @override
  String get repeaterDetailSelectAccessInstance => 'Zugangsinstanz auswählen';

  @override
  String get repeaterDetailSignalObservations => 'Signalbeobachtungen';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Wie war die Audioqualität?';

  @override
  String get repeaterDetailSendLike => 'Like senden';

  @override
  String get repeaterDetailReportIssue => 'Problem melden';

  @override
  String get repeaterDetailRecentActivity => 'Letzte Aktivität';

  @override
  String get reportIssueTitle => 'Meldung';

  @override
  String get reportIssueHeadline => 'Hilf uns, die Daten aktuell zu halten';

  @override
  String get reportIssueDescription =>
      'Hast du etwas Falsches oder Fehlendes bei diesem Relais gefunden? Teile uns mit, was geändert werden muss, und wir überprüfen es.';

  @override
  String get reportIssueWhatToCorrect =>
      'Was möchtest du korrigieren oder ergänzen?';

  @override
  String get reportIssuePlaceholder =>
      'Z.B. Der CTCSS-Ton hat sich auf 88,5 Hz geändert, oder der Standort ist etwas weiter nördlich, der Betreiber ist...';

  @override
  String get reportIssueVerifiedTitle => 'Überprüfte Einreichungen';

  @override
  String get reportIssueVerifiedDescription =>
      'Deine Meldung wird vom regionalen Koordinator überprüft, bevor die öffentliche Datenbank aktualisiert wird. Vielen Dank für deinen Beitrag zur Community.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Ich bestätige, dass diese Informationen nach meiner Beobachtung korrekt sind.';

  @override
  String get reportIssueSubmit => 'Absenden';

  @override
  String get reportIssueMinChars => 'Mindestens 10 Zeichen erforderlich';

  @override
  String get reportIssueMaxChars => 'Maximal 2000 Zeichen';

  @override
  String get reportIssueSuccess => 'Meldung erfolgreich eingereicht';

  @override
  String get reportIssueError => 'Fehler beim Einreichen der Meldung';

  @override
  String get registrationPromptTitle => 'Volles Potenzial freischalten';

  @override
  String get registrationPromptDescription =>
      'Tritt der italienischen Amateurfunk-Community bei und bringe dein Erlebnis auf das nächste Level.';

  @override
  String get registrationBenefitInteractTitle => 'Interagieren';

  @override
  String get registrationBenefitInteractDescription =>
      'Bewerte Relais und hinterlasse Kommentare für andere.';

  @override
  String get registrationBenefitFavoritesTitle => 'Favoriten';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Speichere deine meistgenutzten Frequenzen und Relais.';

  @override
  String get registrationBenefitLogbookTitle => 'Logbuch';

  @override
  String get registrationBenefitLogbookDescription =>
      'Behalte den Überblick über deine QSOs und führe ein persönliches Logbuch.';

  @override
  String get registrationSignInApple => 'Mit Apple anmelden';

  @override
  String get registrationSignInGoogle => 'Mit Google anmelden';

  @override
  String get registrationPromptFooter =>
      'Kostenlose Registrierung. Keine Lizenz erforderlich, um öffentliche Daten zu durchsuchen.';

  @override
  String get postLoginOnboardingWelcome => 'Willkommen bei';

  @override
  String get postLoginOnboardingQuestion =>
      'Bist du ein lizenzierter Funkamateur?';

  @override
  String get postLoginOnboardingHelpText =>
      'Das hilft uns, dein Erlebnis anzupassen und dir die richtigen Frequenzen zu zeigen.';

  @override
  String get postLoginOnboardingYesLicensed => 'Ja, bin ich';

  @override
  String get postLoginOnboardingNoListener => 'Nein, ich bin nur Hörer';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identifiziere dich';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Gib dein offizielles Rufzeichen ein, um auf Netzwerkfunktionen zuzugreifen.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Rufzeichen';

  @override
  String get postLoginOnboardingCallsignHint => 'Z.B. DL1ABC';

  @override
  String get postLoginOnboardingComplete => 'Profil vervollständigen';

  @override
  String get postLoginOnboardingBack => 'Zurück';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Du kannst dies später in den Einstellungen ändern.';

  @override
  String get postLoginOnboardingSwlTitle => 'SWL-Rufzeichen';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Hast du ein offizielles SWL-Rufzeichen?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'Kurzwellenhörer-Rufzeichen helfen dir, dich in der weltweiten Monitorgemeinschaft zu identifizieren.';

  @override
  String get postLoginOnboardingSwlYes => 'Ja, ich habe eins';

  @override
  String get postLoginOnboardingSwlNo => 'Nein, ich habe keins';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Rufzeichen eingeben';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Z.B. DE1-12345-SWL';

  @override
  String get timeAgoJustNow => 'gerade eben';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Minuten',
      one: 'vor 1 Minute',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Stunden',
      one: 'vor 1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Tagen',
      one: 'vor 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Wochen',
      one: 'vor 1 Woche',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Monaten',
      one: 'vor 1 Monat',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'vor $count Jahren',
      one: 'vor 1 Jahr',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Design';

  @override
  String get profileThemeModeSystem => 'System';

  @override
  String get profileThemeModeLight => 'Hell';

  @override
  String get profileThemeModeDark => 'Dunkel';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Sei der Erste, der Feedback zu diesem Relais hinterlässt!';

  @override
  String get repeaterDetailDistanceFromYou => 'Entfernung von dir';

  @override
  String get repeaterDistanceMapNoLocation => 'Standort nicht verfügbar';

  @override
  String get repeaterDetailNever => 'Nie';

  @override
  String get repeaterDetailInfo => 'Informationen';

  @override
  String get repeaterDetailSource => 'Quelle';

  @override
  String get repeaterDetailManager => 'Betreiber';

  @override
  String get repeaterDetailSuggestManager =>
      'Kennst du den Relaisbetreiber? Melde es uns!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Feedback-Karte';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Zeige an, wo Likes und Meldungen erfasst wurden';

  @override
  String get repeaterDetailAltimetricProfile => 'Höhenprofil';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Zeige das Geländeprofil zwischen dir und dem Relais';

  @override
  String get repeaterCoverageTitle => 'Abdeckung';

  @override
  String get repeaterCoverageCardTitle => 'Abdeckungskarte';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Schätzt das Signal des Relais im Gebiet';

  @override
  String get repeaterCoverageLoading => 'Abdeckung wird berechnet…';

  @override
  String get repeaterCoverageError => 'Abdeckung konnte nicht berechnet werden';

  @override
  String get repeaterCoverageRetry => 'Erneut versuchen';

  @override
  String get repeaterCoverageLegendTitle => 'Geschätztes Signal (dBm)';

  @override
  String get repeaterCoverageCta => 'Abdeckung ansehen';

  @override
  String get repeaterDetailLosClear =>
      'Freie Sichtverbindung zwischen dir und dem Relais';

  @override
  String get repeaterDetailLosObstructed =>
      'Sichtverbindung durch Gelände blockiert';

  @override
  String get repeaterDetailTerrainProfile => 'Geländeprofil';

  @override
  String get repeaterDetailLineOfSight => 'Sichtverbindung';

  @override
  String get repeaterDetailTotalDistance => 'Entfernung';

  @override
  String get repeaterDetailRepeaterElevation => 'Höhe des Relais';

  @override
  String get repeaterDetailYourElevation => 'Deine Höhe';

  @override
  String get repeaterDetailYou => 'Du';

  @override
  String get repeaterDetailRepeaterLabel => 'Relais';

  @override
  String get repeaterDetailFunFacts => 'Wusstest du schon?';

  @override
  String get repeaterDetailWavelength => 'Wellenlänge';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'Die Wellenlänge dieses Relais beträgt $value';
  }

  @override
  String get repeaterDetailOscillations => 'Schwingungen pro Sekunde';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Das Signal schwingt $value Mal pro Sekunde';
  }

  @override
  String get repeaterDetailPropagationTime => 'Ausbreitungszeit';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Dein Signal braucht $value, um das Relais zu erreichen';
  }

  @override
  String get repeaterDetailWaveCycles => 'Wellendurchläufe unterwegs';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'Die Welle durchläuft $value vollständige Zyklen auf dem Weg';
  }

  @override
  String get userReportsTitle => 'Meine Aktivitäten';

  @override
  String get userReportsTabReports => 'Meldungen';

  @override
  String get userReportsTabSubmissions => 'Neue Relais';

  @override
  String get userReportsFilterAll => 'Alle';

  @override
  String get userReportsFilterOpen => 'Offen';

  @override
  String get userReportsFilterClosed => 'Geschlossen';

  @override
  String get userReportsEmpty => 'Keine Meldungen eingereicht';

  @override
  String get userReportsEmptyDescription =>
      'Deine Relaismeldungen werden hier angezeigt';

  @override
  String get userReportsEmptyFiltered => 'Keine Meldungen mit diesem Filter';

  @override
  String get userReportsStatusPending => 'Ausstehend';

  @override
  String get userReportsStatusReviewed => 'In Überprüfung';

  @override
  String get userReportsStatusResolved => 'Erledigt';

  @override
  String get userReportsStatusRejected => 'Abgelehnt';

  @override
  String get userReportsRetryBanner => 'Liste konnte nicht aktualisiert werden';

  @override
  String get userReportsProfileTile => 'Meine Meldungen';

  @override
  String get userReportsProfileTileSubtitle =>
      'Status deiner Meldungen anzeigen';

  @override
  String get userReportsError => 'Fehler beim Laden der Meldungen';

  @override
  String get userReportsCoordinatorResponse => 'Antwort des Koordinators';

  @override
  String get userSubmissionsEmpty => 'Keine Relais vorgeschlagen';

  @override
  String get userSubmissionsEmptyDescription =>
      'Vorgeschlagene Relais werden hier angezeigt';

  @override
  String get userSubmissionsEmptyFiltered => 'Keine Relais mit diesem Filter';

  @override
  String get userSubmissionsStatusPending => 'Ausstehend';

  @override
  String get userSubmissionsStatusApproved => 'Genehmigt';

  @override
  String get userSubmissionsStatusRejected => 'Abgelehnt';

  @override
  String get userSubmissionsCoordinatorResponse => 'Antwort des Koordinators';

  @override
  String get userSubmissionsFrequency => 'Frequenz';

  @override
  String get potaTitle => 'POTA Spots';

  @override
  String get potaSearchHint => 'Nach Aktivierer, Park oder Betriebsart suchen…';

  @override
  String get potaNoSpots => 'Derzeit keine aktiven POTA Spots.';

  @override
  String get potaLoadError => 'POTA Spots konnten nicht geladen werden';

  @override
  String get potaRetry => 'Erneut versuchen';

  @override
  String get potaViewAll => 'Alle anzeigen';

  @override
  String get potaActivator => 'Aktivierer';

  @override
  String get potaFrequency => 'Frequenz';

  @override
  String get potaMode => 'Betriebsart';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Referenz';

  @override
  String get potaSpotter => 'Gemeldet von';

  @override
  String get potaComments => 'Kommentare';

  @override
  String get potaLastSpotted => 'Zuletzt gemeldet';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'QRZ.com konnte nicht geöffnet werden';

  @override
  String get potaParkWebsite => 'Park-Website';

  @override
  String get potaParkType => 'Parktyp';

  @override
  String get potaLocation => 'Standort';

  @override
  String get potaCountry => 'Land';

  @override
  String get potaFirstActivation => 'Erstaktivierung';

  @override
  String get potaBand => 'Band';

  @override
  String potaDistanceAway(String distance) {
    return '$distance entfernt';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count aktive Spots';
  }

  @override
  String get potaFilterAll => 'Alle';

  @override
  String get potaFilterBand => 'Band';

  @override
  String get potaFilterMode => 'Betriebsart';

  @override
  String get potaSortByTime => 'Neueste';

  @override
  String get potaSortByDistance => 'Nächste';

  @override
  String get profileLanguage => 'Sprache';

  @override
  String get profileUnitSystem => 'Maßeinheiten';

  @override
  String get profileUnitSystemAuto => 'Automatisch';

  @override
  String get profileUnitSystemMetric => 'Metrisch';

  @override
  String get profileUnitSystemImperial => 'Imperial';

  @override
  String get profileLanguageSystem => 'System';

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
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingGetStarted => 'Loslegen';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get onboardingWelcomeTitle1 => 'Finde Relais in deiner Nähe';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Entdecke aktive Relais in deiner Umgebung mit Frequenzen, Tönen und technischen Details.';

  @override
  String get onboardingWelcomeCredits =>
      'Relaisdaten bereitgestellt von IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Nach Betriebsart filtern';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analog, DMR, C4FM, D-STAR — finde sofort das richtige Relais für dich.';

  @override
  String get onboardingWelcomeTitle3 => 'POTA Spots in Echtzeit';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Verfolge Parks on the Air Aktivierungen mit Live-Updates, Bandfiltern und Entfernung.';

  @override
  String get onboardingWelcomeTitle4 => 'Speichere deine Favoriten';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Halte deine meistgenutzten Relais griffbereit für schnellen Zugriff.';

  @override
  String get onboardingLocationTitle => 'Standort';

  @override
  String get onboardingLocationSubtitle =>
      'Wir verwenden deinen Standort, um dir Relais und POTA-Aktivierungen in der Nähe zu zeigen.';

  @override
  String get onboardingLocationEnable => 'Standort aktivieren';

  @override
  String get onboardingLocationSkip => 'Jetzt nicht';

  @override
  String get onboardingDiscoveryTitle => 'Dein erstes Relais';

  @override
  String get onboardingDiscoverySubtitle => 'Das befindet sich in deiner Nähe!';

  @override
  String get onboardingDiscoveryViewDetails => 'Details anzeigen';

  @override
  String get onboardingDiscoveryViewSpot => 'Spot anzeigen';

  @override
  String get onboardingDiscoveryExploreMap => 'Karte erkunden';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Erkunde die Karte, um Relais und POTA-Aktivierungen zu finden';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Relais in der Nähe';

  @override
  String get onboardingDiscoveryLivePota => 'Live POTA Spot';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'Keine Relais in der Nähe gefunden';

  @override
  String get onboardingTelegramTitle => 'Tritt der Community bei';

  @override
  String get onboardingTelegramSubtitle =>
      'Tritt der HamQRG Telegram-Gruppe bei, um Updates zu erhalten, Relais zu melden und andere Funkamateure kennenzulernen.';

  @override
  String get onboardingTelegramJoin => 'Telegram-Gruppe beitreten';

  @override
  String get onboardingTelegramLater => 'Vielleicht später';

  @override
  String get onboardingTelegramAlreadyMember => 'Ich bin bereits Mitglied';

  @override
  String get addRepeaterProfileTile => 'Neues Relais vorschlagen';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Ein noch nicht gelistetes Relais melden';

  @override
  String get addRepeaterTitle => 'Neues Relais';

  @override
  String get addRepeaterHeadline => 'Ein fehlendes Relais melden';

  @override
  String get addRepeaterDescription =>
      'Fülle die Details des Relais aus, das du hinzufügen möchtest. Die Einreichung wird vor der Veröffentlichung überprüft.';

  @override
  String get addRepeaterSectionRepeater => 'Relaisdaten';

  @override
  String get addRepeaterSectionAccesses => 'Zugänge';

  @override
  String get addRepeaterSectionLocation => 'Standort';

  @override
  String get addRepeaterSectionNotes => 'Anmerkungen';

  @override
  String get addRepeaterName => 'Name';

  @override
  String get addRepeaterNameHint => 'Z.B. Feldberg';

  @override
  String get addRepeaterCallsign => 'Rufzeichen';

  @override
  String get addRepeaterCallsignHint => 'Z.B. DB0VC';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Gib mindestens einen Namen oder ein Rufzeichen ein';

  @override
  String get addRepeaterFrequency => 'Frequenz (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Z.B. 145.000 oder 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frequenz erforderlich';

  @override
  String get addRepeaterFrequencyInvalid => 'Ungültige Frequenz';

  @override
  String get addRepeaterShift => 'Ablage (MHz)';

  @override
  String get addRepeaterShiftHint => 'Z.B. -0,600';

  @override
  String get addRepeaterRegion => 'Region';

  @override
  String get addRepeaterRegionHint => 'Z.B. Bayern';

  @override
  String get addRepeaterProvinceCode => 'Bundesland';

  @override
  String get addRepeaterProvinceCodeHint => 'Z.B. BY';

  @override
  String get addRepeaterLocality => 'Ort';

  @override
  String get addRepeaterLocalityHint => 'Z.B. Schmitten';

  @override
  String get addRepeaterLatitude => 'Breitengrad';

  @override
  String get addRepeaterLatitudeHint => 'Z.B. 50.2200';

  @override
  String get addRepeaterLongitude => 'Längengrad';

  @override
  String get addRepeaterLongitudeHint => 'Z.B. 8.4500';

  @override
  String get addRepeaterLocator => 'Locator';

  @override
  String get addRepeaterLocatorHint => 'Z.B. JO40QF';

  @override
  String get addRepeaterNotes => 'Zusätzliche Anmerkungen';

  @override
  String get addRepeaterNotesHint => 'Zusätzliche Informationen zum Relais...';

  @override
  String get addRepeaterAddAccess => 'Zugang hinzufügen';

  @override
  String get addRepeaterRemoveAccess => 'Entfernen';

  @override
  String get addRepeaterAccessMode => 'Betriebsart';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Z.B. 88,5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Z.B. 88,5';

  @override
  String get addRepeaterAccessDcsCode => 'DCS-Code';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Z.B. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Z.B. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Sprechgruppe';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Z.B. 262001';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Z.B. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node-ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Z.B. 1234';

  @override
  String get addRepeaterAccessNac => 'NAC';

  @override
  String get addRepeaterAccessNacHint => 'Z.B. 659';

  @override
  String get addRepeaterAccessNetworkName => 'Netzwerkname';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Z.B. BM Deutschland';

  @override
  String get addRepeaterAccessNotes => 'Zugangshinweise';

  @override
  String get addRepeaterAccessNotesHint =>
      'Hinweise speziell zu diesem Zugang...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Ich bestätige, dass diese Informationen nach meinem besten Wissen korrekt sind.';

  @override
  String get addRepeaterVerifiedTitle => 'Überprüfte Einreichung';

  @override
  String get addRepeaterVerifiedDescription =>
      'Deine Einreichung wird vom Team überprüft, bevor sie in der Datenbank veröffentlicht wird.';

  @override
  String get addRepeaterSubmit => 'Absenden';

  @override
  String get addRepeaterSuccess => 'Einreichung erfolgreich gesendet!';

  @override
  String get addRepeaterError => 'Fehler beim Senden der Einreichung';

  @override
  String get addRepeaterAtLeastOneAccess =>
      'Füge mindestens einen Zugang hinzu';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Zugang $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'POTA Spots in Echtzeit mit Karte und Parkdetails';

  @override
  String get changelog1017SubmitRepeater =>
      'Neues Relais direkt aus der App vorschlagen';

  @override
  String get changelog1017MultiLanguage =>
      'App verfügbar auf Englisch, Spanisch und Französisch';

  @override
  String get changelog1017Onboarding => 'Neues Erststart-Erlebnis';

  @override
  String get changelog1017ReportAnonymous =>
      'Meldungen ohne Registrierung möglich';

  @override
  String get changelog1020ClusterSpots =>
      'Cluster-Spots in Echtzeit: Sieh, wer auf Relais zuhört, mit Benachrichtigungen und Einstellungen';

  @override
  String get changelog1020DetailTabs =>
      'Relaisseite mit Reitern Info, Cluster und Community';

  @override
  String get changelog1020TabletLayout => 'Für Tablets optimiertes Layout';

  @override
  String get changelog110Coverage =>
      'Funkabdeckungskarte der Relais: Sieh das vorhergesagte Signal direkt auf der Karte (PRO)';

  @override
  String get changelog110Reachable =>
      'Was du von hier erreichst: Entdecke die Relais, die dich an deinem Standort erreichen – mit Signal und Geländeprofil (PRO)';

  @override
  String get changelogTitle => 'Neuigkeiten';

  @override
  String get changelogSubtitle => 'Das ist neu in dieser Version';

  @override
  String get changelogCategoryAdded => 'Neu';

  @override
  String get changelogCategoryImproved => 'Verbessert';

  @override
  String get changelogCategoryFixed => 'Behoben';

  @override
  String get changelogDismiss => 'Verstanden!';

  @override
  String get spotCreateTitle => 'Sich selbst spotten';

  @override
  String get spotCreateOtherTitle => 'Einen OM spotten';

  @override
  String get spotCreateDuration => 'Dauer';

  @override
  String get spotCreateAccess => 'Modus (optional)';

  @override
  String get spotCreateCallsign => 'Rufzeichen des gehörten OM';

  @override
  String get spotCreateCallsignHint => 'Z.B. DL1ABC';

  @override
  String get spotCreateConfirm => 'Bestätigen';

  @override
  String get spotCreateSuccessSelf => 'Spot erstellt!';

  @override
  String get spotCreateSuccessOther => 'OM gespottet!';

  @override
  String get spotActiveYou => 'Du bist gespottet';

  @override
  String get spotActiveClose => 'Spot schließen';

  @override
  String spotActiveOn(String repeaterName) {
    return 'auf $repeaterName';
  }

  @override
  String get spotActiveNone => 'Momentan niemand gespottet';

  @override
  String get spotActiveCta => 'Sei der Erste!';

  @override
  String get spotActiveSection => 'Aktive Spots';

  @override
  String get spotHistorySection => 'Spot-Verlauf';

  @override
  String get spotListTitle => 'Neueste Spots';

  @override
  String get spotListViewAll => 'Alle anzeigen';

  @override
  String get spotListBadgeActive => 'Hört zu';

  @override
  String get spotListBadgeClosed => 'Beendet';

  @override
  String get spotListBadgeReport => 'Melden';

  @override
  String get spotListEmpty => 'Keine Spots in den letzten 24 Stunden';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Gemeldet von $callsign';
  }

  @override
  String get spotNotificationToggle => 'Cluster-Benachrichtigungen';

  @override
  String get spotNotificationDisabled =>
      'Cluster-Benachrichtigungen in den Profileinstellungen deaktiviert';

  @override
  String get spotNotificationPerFavorite => 'Spot-Benachrichtigungen';

  @override
  String get spotPreviousClosed => 'Dein vorheriger Spot ist nicht mehr aktiv';

  @override
  String get spotErrorAuthRequired => 'Du musst angemeldet sein.';

  @override
  String get spotErrorCallsignRequired =>
      'Lege dein Rufzeichen im Profil fest, um den Cluster zu nutzen.';

  @override
  String get spotErrorInvalidDuration =>
      'Die Dauer muss zwischen 5 und 60 Minuten liegen.';

  @override
  String get spotErrorRepeaterNotFound => 'Repeater nicht gefunden.';

  @override
  String get spotErrorInvalidAccess =>
      'Ungültiger Zugangsmodus für diesen Repeater.';

  @override
  String get spotErrorSpotNotFound => 'Spot nicht gefunden.';

  @override
  String get spotErrorForbidden =>
      'Du kannst keinen Spot schließen, der nicht deiner ist.';

  @override
  String get spotErrorAlreadyClosed => 'Der Spot ist bereits geschlossen.';

  @override
  String get spotErrorGeneric =>
      'Fehler beim Erstellen des Spots. Bitte versuche es erneut.';

  @override
  String get spotAccessUnavailable => '(Modus nicht mehr verfügbar)';

  @override
  String spotDurationMinutes(int minutes) {
    return '$minutes Min.';
  }

  @override
  String get sotaTitle => 'SOTA Spots';

  @override
  String get sotaListEmpty => 'No SOTA spots at the moment';

  @override
  String get sotaLoadError => 'Failed to load SOTA spots';

  @override
  String get sotaRetry => 'Retry';

  @override
  String get sotaSummitPursuit => 'View toward the summit';

  @override
  String get sotaLosClear => 'Clear line of sight';

  @override
  String get sotaLosObstructed => 'Possible obstruction';

  @override
  String sotaLosObstructionAt(String distance, String height) {
    return 'Obstacle at $distance, +$height';
  }

  @override
  String sotaPointsBadge(int count) {
    return '$count pt';
  }

  @override
  String get sotaFilterAll => 'All';

  @override
  String get spotsFiltersTitle => 'Filter';

  @override
  String get spotsFilterBand => 'Band';

  @override
  String get spotsFilterMode => 'Modus';

  @override
  String get spotsFilterAll => 'Alle';

  @override
  String get spotsFiltersReset => 'Filter zurücksetzen';

  @override
  String get sotaSortByTime => 'Time';

  @override
  String get sotaSortByDistance => 'Distance';

  @override
  String get sotaFilterPoints => 'Points';

  @override
  String get sotaFilterAssociation => 'Country';

  @override
  String get sotaSpotQrt => 'QRT';

  @override
  String sotaSummitInvalidFrom(String date) {
    return 'Summit no longer valid since $date';
  }

  @override
  String get sotaSummitRestrictions => 'Restricted access';

  @override
  String get sotaPursuitNoLocation =>
      'Enable location to see the profile toward the summit';

  @override
  String get sotaPursuitTooClose => 'You are practically on the summit';

  @override
  String get sotaPursuitTooFar => 'Summit too far for terrain profile';

  @override
  String get sotaPursuitError => 'Unable to compute profile. Retry.';

  @override
  String get sotaPursuitLoading => 'Computing terrain profile…';

  @override
  String get sotaCopyFrequency => 'Copy frequency';

  @override
  String get sotaOpenOnMap => 'Open on map';

  @override
  String get sotaShare => 'Share';

  @override
  String get sotaViewAll => 'View all';

  @override
  String get sotaTabDashboard => 'SOTA';

  @override
  String get sotaIntroEmpty =>
      'SOTA: Summits On The Air. Chase ham operators activating mountain summits.';

  @override
  String sotaSpotCount(int count) {
    return '$count spots';
  }

  @override
  String get sotaActivator => 'Activator';

  @override
  String get sotaSummit => 'Summit';

  @override
  String get sotaAssociation => 'Association';

  @override
  String get sotaRegion => 'Region';

  @override
  String get sotaLocator => 'Locator';

  @override
  String get sotaDistance => 'Distance';

  @override
  String get sotaBearing => 'Bearing';

  @override
  String get sotaElevationDelta => 'Elevation delta';

  @override
  String get sotaRemoveFilters => 'Remove filters';

  @override
  String get sotaPointsTitle => 'Points';

  @override
  String get sotaSpotInfo => 'Spot info';

  @override
  String get sotaTime => 'Time';

  @override
  String get sotaCopiedToClipboard => 'Frequency copied';

  @override
  String sotaPointsAbove(int count) {
    return '$count+ pt';
  }

  @override
  String get sotaFilterPointsAll => 'All points';

  @override
  String get reachSheetError =>
      'Erreichbare Relais konnten nicht berechnet werden.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Du erreichst $count Relais',
      one: 'Du erreichst 1 Relais',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Von deinem Standort, nach Signal sortiert';

  @override
  String get reachSheetEmpty => 'Keine erreichbaren Relais in der Nähe.';

  @override
  String get reachBadgeTitle => 'Erreichst du es von hier?';

  @override
  String get reachBadgeSubtitle =>
      'Finde heraus, ob dich dieses Relais abdeckt und mit welchem Signal';

  @override
  String get reachDiscoverCta => 'Mit PRO entdecken';

  @override
  String get reachReachable => 'Du erreichst es';

  @override
  String get reachOutOfCoverage => 'Außerhalb der Abdeckung';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · für das Profil tippen';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance von hier';
  }

  @override
  String get reachComputing => 'Abdeckung wird berechnet…';

  @override
  String get reachRepeaterFallback => 'Relais';

  @override
  String get reachMapButton => 'Was erreichst du?';

  @override
  String get reachUpsellTitle => 'Was erreichst du von hier? 📡';

  @override
  String get reachUpsellBody =>
      'Sieh in Echtzeit ALLE Relais, die du von deinem Standort aus empfängst – mit vorhergesagtem Signal und Geländeprofil. Wie viele erreichst du wirklich von dort, wo du gerade bist?';

  @override
  String get reachUpsellLater => 'Später';

  @override
  String get linkProfileObstructed =>
      'Hindernis auf dem Pfad (Signal durch Beugung)';

  @override
  String get linkProfileClear => 'Freie Sichtlinie';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Geländeprofil und Sichtlinie · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Mit PRO freischalten';

  @override
  String get proWelcomeTitle => 'Willkommen bei PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Du hast die Abdeckungskarte, die Relais, die du von deinem Standort erreichst, und alle PRO-Funktionen freigeschaltet. 📡';

  @override
  String get proWelcomeCta => 'Loslegen';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonEdit => 'Bearbeiten';

  @override
  String get commonOpenSettings => 'Einstellungen öffnen';

  @override
  String get commonFieldRequired => 'Pflichtfeld';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldAddress => 'Adresse';

  @override
  String get fieldCity => 'Stadt';

  @override
  String get fieldDescription => 'Beschreibung';

  @override
  String get fieldYear => 'Jahr';

  @override
  String get fieldSelectDateHint => 'Datum auswählen';

  @override
  String get validationInvalidYear => 'Gültiges Jahr auswählen';

  @override
  String get validationPasswordMinLength =>
      'Das Passwort muss mindestens 6 Zeichen lang sein';

  @override
  String get permissionsMissingTitle => 'Berechtigungen fehlen!';

  @override
  String get imageUploadError => 'Fehler beim Hochladen des Bildes';

  @override
  String get uploadImageLabel => 'Bild hochladen';

  @override
  String get sourceGallery => 'Galerie';

  @override
  String get sourceCamera => 'Kamera';

  @override
  String get changePasswordTitle => 'Passwort ändern';

  @override
  String get fieldNewPassword => 'Neues Passwort';

  @override
  String get fieldConfirmNewPassword => 'Neues Passwort bestätigen';

  @override
  String get validationPasswordsNoMatch =>
      'Die Passwörter stimmen nicht überein';

  @override
  String get passwordChangedSuccess => 'Passwort erfolgreich geändert';

  @override
  String errorWithMessage(String message) {
    return 'Fehler: $message';
  }

  @override
  String get updateRequiredTitle => 'Update erforderlich';

  @override
  String get updateRequiredAction => 'Jetzt aktualisieren';

  @override
  String get yearPickerTitle => 'Jahr auswählen';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Community';

  @override
  String get updateRequiredBody =>
      'Eine neue Version der App ist verfügbar. Aktualisiere, um die App weiter zu nutzen.';

  @override
  String get errorOpeningStore => 'Fehler beim Öffnen des Stores';

  @override
  String get deleteConfirmTitle => 'Löschen bestätigen';

  @override
  String get deleteConfirmContent => 'Möchtest du wirklich löschen?';

  @override
  String get cameraPermissionRationale =>
      'Um ein Foto aufzunehmen, erlaube den Kamerazugriff in den Einstellungen.';

  @override
  String get coverageSearchHint => 'Ort suchen oder Koordinaten einfügen';

  @override
  String get coverageSearchRecentTitle => 'Letzte Suchen';

  @override
  String get coverageSearchNoResults => 'Kein Ort gefunden';

  @override
  String get coverageSearchTip =>
      'Du kannst Koordinaten einfügen (46.4879, 11.8123) oder lange auf die Karte drücken';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Koordinaten außerhalb des Bereichs: Breite ±90, Länge ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Keine Verbindung: Die Ortssuche benötigt Netz';

  @override
  String get coverageSearchErrorFailed =>
      'Suche fehlgeschlagen. Versuche es erneut.';

  @override
  String get coverageSearchClearPoint => 'Punkt entfernen';

  @override
  String get coverageSearchPointSemantics => 'Ausgewählter Suchpunkt';

  @override
  String get coverageBreadthTitle => 'Suchradius';

  @override
  String get coverageBreadthQuick => 'Schnell';

  @override
  String get coverageBreadthMedium => 'Mittel';

  @override
  String get coverageBreadthExtended => 'Erweitert';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · schnellste Antwort';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · ausgewogen';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · weiter, längere Wartezeit';
  }

  @override
  String get coverageResultSubtitle => 'Vom ausgewählten Punkt';

  @override
  String get coverageResultEmptyNoReachable =>
      'Von diesem Punkt ist kein Relais erreichbar';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'In diesem Gebiet ist kein Relais erfasst';

  @override
  String get coverageResultClearFilters => 'Filter entfernen';

  @override
  String get coverageResultError => 'Berechnung fehlgeschlagen';

  @override
  String get coverageResultComputing => 'Empfang wird berechnet…';

  @override
  String get coverageResultCancel => 'Abbrechen';

  @override
  String coverageResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count erreichbare Relais',
      one: '1 erreichbares Relais',
    );
    return '$_temp0';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown von $total erreichbar';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count erreichbare durch Filter ausgeblendet',
      one: '1 erreichbares durch Filter ausgeblendet',
    );
    return '$_temp0';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Was erreichst du von $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Jedes Relais, das du von dort erreichst, mit vorhergesagtem Signal und Entfernung — noch bevor du losfährst.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Jeder Punkt der Erde';

  @override
  String get coverageTeaserBenefitOffline => 'Ohne Netz nutzbar, im Feld';

  @override
  String get coverageTeaserBenefitSave => 'Standort speichern und wiederfinden';

  @override
  String get stationSaveCta => 'Standort speichern';

  @override
  String get stationSaveTitle => 'Name des Standorts';

  @override
  String get stationRename => 'Umbenennen';

  @override
  String get stationDelete => 'Löschen';

  @override
  String get stationRefresh => 'Aktualisieren';

  @override
  String get stationRefreshAll => 'Alle aktualisieren';

  @override
  String get stationOfflineNotice => 'Auf dem Gerät gespeicherte Daten';

  @override
  String get stationStaleNotice => 'Diese Daten könnten veraltet sein';

  @override
  String get stationMissingEntry => 'Daten offline nicht verfügbar';

  @override
  String get stationDuplicateTitle => 'Punkt bereits gespeichert';

  @override
  String stationDuplicateBody(String distance) {
    return 'Es gibt bereits einen Standort in weniger als $distance Entfernung. Aktualisieren oder einen eigenen anlegen?';
  }

  @override
  String get stationDuplicateUpdate => 'Aktualisieren';

  @override
  String get stationDuplicateCreate => 'Eigene anlegen';

  @override
  String get stationSaveFailed =>
      'Speichern fehlgeschlagen: zu wenig Speicherplatz';

  @override
  String get stationSavedCta => 'Standort gespeichert';

  @override
  String get stationRemoveCta => 'Entfernen';

  @override
  String get stationRemoveTitle => 'Standort entfernen?';

  @override
  String stationRemoveBody(String name) {
    return '„$name“ und seine Offline-Daten werden von diesem Gerät gelöscht.';
  }

  @override
  String get stationRemovedSnack => 'Standort entfernt';

  @override
  String get stationSaveError =>
      'Speichern fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get stationsTitle => 'Meine Standorte';

  @override
  String get stationsProfileSubtitle =>
      'Die von dir geprüften Standorte, auch offline verfügbar';

  @override
  String get stationsEmptyTitle => 'Noch keine Standorte gespeichert';

  @override
  String get stationsEmptyBody =>
      'Ein Standort ist ein Kartenpunkt, dessen Abdeckung du bereits berechnet hast — gespeichert, um ihn auch ohne Netz wiederzufinden.';

  @override
  String get stationsEmptyStep1 =>
      'Wähle einen Punkt auf der Karte: lange drücken, nach Namen suchen oder Koordinaten einfügen.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Tippe auf „$action“, um zu sehen, welche Relais du von dort erreichst.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Speichere den Punkt: Du findest ihn hier wieder, auch im Feld ohne Netz.';

  @override
  String get stationsGoToMap => 'Zur Karte';

  @override
  String get stationsRefreshDone => 'Aktualisierung abgeschlossen';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Aktualisiert $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Aktualisierung in $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Aktualisierung in $minutes Min.';
  }

  @override
  String get spotsUpdating => 'Wird aktualisiert…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Automatische Aktualisierung alle $seconds Sekunden';
  }

  @override
  String get spotsManualRefreshHint => 'Zum Aktualisieren tippen';

  @override
  String coverageResultScope(String km, int count) {
    return 'im Umkreis von $km · $count geprüft';
  }

  @override
  String get coverageResultRecalculating => 'Neuberechnung';

  @override
  String get offlineBannerMessage =>
      'Du bist offline: gespeicherte Daten werden angezeigt';

  @override
  String get offlineMapsTitle => 'Offline-Karten';

  @override
  String get offlineMapsEntrySubtitle =>
      'Karten für die Nutzung ohne Verbindung herunterladen';

  @override
  String get offlineMapsEmpty =>
      'Keine Regionen heruntergeladen. Lade ein Gebiet herunter, um die Karte auch ohne Verbindung zu sehen.';

  @override
  String get offlineMapsAddRegion => 'Region herunterladen';

  @override
  String get offlineMapsRegionNameLabel => 'Name der Region';

  @override
  String get offlineMapsRegionNameHint =>
      'z. B. Zuhause, Hütte, SOTA-Aktivierung';

  @override
  String get offlineMapsRadiusLabel => 'Radius';

  @override
  String get offlineMapsDownload => 'Herunterladen';

  @override
  String get offlineMapsDownloadingStyle => 'Kartenstil wird heruntergeladen…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Karten werden heruntergeladen… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Geschätzte Größe: $size';
  }

  @override
  String get offlineMapsDownloadError =>
      'Download fehlgeschlagen. Versuche es erneut.';

  @override
  String get offlineMapsDeleteError =>
      'Löschen fehlgeschlagen. Versuche es erneut.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Region löschen?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '„$name“ ist offline nicht mehr verfügbar.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Löschen';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Radius $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Unvollständiger Download';

  @override
  String get offlineMapsResume => 'Fortsetzen';

  @override
  String get offlineMapsCenterInfo =>
      'Die Region wird auf deinen aktuellen Standort zentriert.';

  @override
  String get dashboardOfflineTitle => 'Du bist offline';

  @override
  String get dashboardOfflineMessage =>
      'Keine gespeicherten Daten für dieses Gebiet. Deine gespeicherten Standorte und heruntergeladenen Karten bleiben verfügbar.';

  @override
  String get offlineMapsCenterMine => 'Mein Standort';

  @override
  String get offlineMapsCenterSearch => 'Ort suchen';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Suche eine Stadt oder einen Ort: die Region wird dort zentriert.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Zentrum: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Offline-Modus: Relais, Favoriten, Profil, Abdeckung und Erreichbarkeit auch ohne Netz verfügbar (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Offline-Karten: Lade die Umgebung deines Standorts oder einen Ort deiner Wahl herunter und nutze sie ohne Verbindung (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Abdeckungssuche von jedem Punkt aus: Ort suchen, Koordinaten einfügen oder lange auf die Karte drücken, um zu sehen, was du von dort erreichst';

  @override
  String get changelog120SavedStations =>
      'Meine Standorte: Speichere die Punkte, die dich interessieren, und sieh sie auch offline ein (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'SOTA- und POTA-Spots aktualisieren sich jede Minute von selbst, mit farbigen Badges je Betriebsart (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Ohne Verbindung startet die App sofort, zeigt, was verfügbar ist, und deaktiviert Aktionen, die das Netz brauchen';

  @override
  String get changelog130ImperialUnits =>
      'Meilen und Fuß: Die App folgt jetzt den Einheiten deines Geräts, und in den Einstellungen kannst du das System selbst wählen';

  @override
  String get profileUnitSystemAutoShort => 'Auto';

  @override
  String updateAvailableBannerMessage(String version) {
    return 'Version $version ist verfügbar, ein Update wird empfohlen';
  }

  @override
  String get updateAvailableAction => 'Aktualisieren';

  @override
  String get updateAvailableDismiss => 'Später';

  @override
  String get dashboardLoadError =>
      'Aktuelle Daten konnten nicht geladen werden';

  @override
  String get dashboardLoadErrorMessage =>
      'Der Server hat nicht geantwortet. Versuch es gleich noch einmal.';
}
