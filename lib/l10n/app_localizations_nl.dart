// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get proSectionTitle => 'Abonnement';

  @override
  String get proCardUpgradeTitle => 'Ontdek wat je bereikt';

  @override
  String get proCardUpgradeSubtitle => 'Dekking, repeaters en offline kaarten';

  @override
  String get proCardActiveTitle => 'HamQRG Pro actief';

  @override
  String get proCardActiveSubtitle => 'Bedankt voor je steun!';

  @override
  String proPriceFromMonth(String price) {
    return 'Vanaf $price per maand · Altijd opzegbaar';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Gratis proberen, daarna $price per maand · Altijd opzegbaar';
  }

  @override
  String proPriceLifetime(String price) {
    return 'Eenmalig $price · Voor altijd';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Vanaf $price per maand · $total vooraf · Altijd opzegbaar';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Gratis proberen, daarna $price per maand · $total vooraf · Altijd opzegbaar';
  }

  @override
  String get proRestoreSuccess => 'Aankopen hersteld: HamQRG Pro is actief';

  @override
  String get proRestoreNone => 'Geen aankopen om te herstellen';

  @override
  String get proManageSubscription => 'Abonnement beheren';

  @override
  String get proLinkAccountTitle => 'Koppel je account';

  @override
  String get proLinkAccountBody =>
      'Koppel HamQRG Pro aan een account zodat je het op elk apparaat houdt, ook na een herinstallatie.';

  @override
  String get stationsShowcaseTitle => 'Je locaties, ook zonder verbinding';

  @override
  String get stationsShowcaseBody =>
      'Sla thuis, de hut of de activatieplek op: wat je bereikt blijft beschikbaar, ook zonder netwerk.';

  @override
  String get offlineMapsUpsellTitle => 'De kaart blijft op je telefoon 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Download de gebieden die je nodig hebt en open ze waar geen signaal is: op een bergkam, in een tunnel, in het buitenland zonder data.';

  @override
  String get offlineMapsBenefitRegions =>
      'Jij kiest welke gebieden je downloadt';

  @override
  String get reachUpsellBenefitSignal => 'Verwacht signaal voor elke repeater';

  @override
  String get reachUpsellBenefitTerrain =>
      'Terreinprofiel tussen jou en de repeater';

  @override
  String get proRestoreCta => 'Aankopen herstellen';

  @override
  String get error => 'Fout';

  @override
  String get error_message => 'Er is een fout opgetreden bij het laden';

  @override
  String get error_message_retry =>
      'Er is een fout opgetreden bij het laden. Probeer het later opnieuw';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String get back => 'Terug';

  @override
  String get loading => 'Laden';

  @override
  String get details => 'Details';

  @override
  String pages_number(Object number) {
    return '$number pagina\'s om te verkennen';
  }

  @override
  String get january => 'Januari';

  @override
  String get february => 'Februari';

  @override
  String get march => 'Maart';

  @override
  String get april => 'April';

  @override
  String get may => 'Mei';

  @override
  String get june => 'Juni';

  @override
  String get july => 'Juli';

  @override
  String get august => 'Augustus';

  @override
  String get september => 'September';

  @override
  String get october => 'Oktober';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get logout => 'Uitloggen';

  @override
  String get profile => 'Profiel';

  @override
  String get settings => 'Instellingen';

  @override
  String get contact_us => 'Neem contact op';

  @override
  String get error_opening_email =>
      'Er is een fout opgetreden bij het openen van de e-mail';

  @override
  String get register_now => 'Registreer nu';

  @override
  String get tracking_permission_title => 'Ondersteun de app';

  @override
  String get tracking_permission_message =>
      'Om je ervaring te verbeteren en je relevantere inhoud te tonen, help ons de app gratis te houden.\n\nTik op Sta toe om ons te ondersteunen.';

  @override
  String get tracking_permission_next => 'Volgende';

  @override
  String get skip => 'Overslaan';

  @override
  String get done => 'Klaar';

  @override
  String get next => 'Volgende';

  @override
  String get joinCommunityTitle => 'Word lid van onze community!';

  @override
  String get joinCommunityDescription =>
      'Ontdek de voordelen van de Telegram-community:';

  @override
  String get benefitSupportMembers => 'Ondersteuning van leden';

  @override
  String get benefitSuggestFeatures => 'Nieuwe functies voorstellen';

  @override
  String get benefitContactDevelopers => 'Contact met ontwikkelaars';

  @override
  String get benefitExclusivePreviews => 'Exclusieve previews en bèta\'s';

  @override
  String get benefitActiveCommunity => 'Actieve community';

  @override
  String get joinNowButton => 'Nu lid worden!';

  @override
  String get alreadyMemberButton => 'Ik ben al lid';

  @override
  String get laterButton => 'Later';

  @override
  String get errorOpenTelegram => 'Fout bij het openen van Telegram';

  @override
  String get disclaimerTitle => 'Gegevensbron';

  @override
  String get disclaimerDescription =>
      'De repeatergegevens in deze app zijn afkomstig van IZ8WNH.\n\nVoor aanvullende informatie, het downloaden van CSV-bestanden voor het programmeren van radio\'s, of het raadplegen van gegevens die niet in deze app beschikbaar zijn, bezoek de officiële website.';

  @override
  String get disclaimerVisitSite => 'Bezoek iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Begrepen';

  @override
  String get errorOpenDisclaimerSite => 'Fout bij het openen van de website';

  @override
  String get repeatersMapTitle => 'Repeaterkaart';

  @override
  String get repeatersListTitle => 'Repeaterlijst';

  @override
  String get repeatersMapLoading => 'Repeaterkaart laden…';

  @override
  String get repeatersMapGenericError => 'Kan repeaters niet laden.';

  @override
  String get repeatersMapEmpty => 'Geen repeaters gevonden in je buurt.';

  @override
  String get repeatersSearchHint => 'Zoek op naam, roepnaam of frequentie MHz…';

  @override
  String get repeatersSearchEmpty => 'Geen repeaters gevonden.';

  @override
  String get repeatersSortDistance => 'Afstand';

  @override
  String get repeatersSortLikes => 'Likes';

  @override
  String get repeatersSortFrequency => 'Frequentie';

  @override
  String repeatersNearbyCount(int count) {
    return '$count repeaters in de buurt';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count resultaten';
  }

  @override
  String get repeatersMapRetry => 'Opnieuw proberen';

  @override
  String get repeatersMapOpenSettings => 'Instellingen openen';

  @override
  String get repeatersMapPermissionMessage =>
      'Geef locatietoegang om repeaters in je buurt te tonen.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Locatietoestemming permanent geweigerd. Schakel deze in via de systeeminstellingen.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Schakel locatieservices in om repeaters in de buurt te vinden.';

  @override
  String repeatersMapFound(int count) {
    return '$count repeaters gevonden';
  }

  @override
  String get repeaterMode => 'Modus';

  @override
  String get repeaterModeAnalog => 'Analoog';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Alle modi';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frequentie';

  @override
  String get repeaterShift => 'Shift';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Locatie';

  @override
  String get repeaterDistance => 'Afstand';

  @override
  String get repeaterViewFullDetails => 'Alle details bekijken';

  @override
  String get repeatersMapReturnToLocation => 'Terug naar mijn locatie';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count repeaters op deze locatie';
  }

  @override
  String get profileUnlockFeatures => 'Ontgrendel alle functies';

  @override
  String get profileUnlockFeaturesDescription =>
      'Registreer om beoordelingen, favoriet opslaan en gedetailleerde statistieken te gebruiken.';

  @override
  String get profileSignUpOrLogin => 'Registreren of inloggen';

  @override
  String get profileErrorOpeningEmail => 'Fout bij het openen van e-mail';

  @override
  String get profileJoinTelegramCommunity =>
      'Word lid van de Telegram-community';

  @override
  String get profileWelcomeTitle => 'Welkom bij HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Word lid van onze community van zendamateurs in Italië.';

  @override
  String get profileEditProfile => 'Profiel bewerken';

  @override
  String get profileChangePhoto => 'Foto wijzigen';

  @override
  String get profileFirstName => 'Voornaam';

  @override
  String get profileLastName => 'Achternaam';

  @override
  String get profileCallsign => 'Roepnaam';

  @override
  String get profileRestartIdentificationTitle =>
      'Wil je je status wijzigen? Je kunt het identificatieproces opnieuw starten om te wisselen van Gelicentieerde Operator naar SWL-luisteraar.';

  @override
  String get profileRestartIdentificationButton =>
      'Identificatieproces opnieuw starten';

  @override
  String get profileSaveChanges => 'Wijzigingen opslaan';

  @override
  String get profileDangerZone => 'Gevarenzone';

  @override
  String get profileDeleteAccount => 'Account verwijderen';

  @override
  String get profileDeleteAccountConfirmTitle => 'Account verwijderen';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Weet je zeker dat je je account wilt verwijderen? Deze actie is onomkeerbaar.';

  @override
  String get profileDeleteAccountCancel => 'Annuleren';

  @override
  String get profileDeleteAccountConfirm => 'Verwijderen';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'App-versie $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Community & ondersteuning';

  @override
  String get profileSectionSupport => 'Ondersteuning';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Versie: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Versie $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Fout: $error';
  }

  @override
  String get authJoinTitle => 'Word lid van HamQRG';

  @override
  String get authUnlockFeatures => 'Log in om alle functies te ontgrendelen!';

  @override
  String get authWhatYouGet => 'Wat je krijgt:';

  @override
  String get authBenefitStatsTitle => 'Gedetailleerde statistieken';

  @override
  String get authBenefitStatsDescription => 'Volg je voortgang en verbeter';

  @override
  String get authBenefitQuizTitle => 'Verschillende quizmodi';

  @override
  String get authBenefitQuizDescription =>
      'Oefen in marathon-, thema- en andere modi.';

  @override
  String get authBenefitSyncTitle => 'Synchronisatie';

  @override
  String get authBenefitSyncDescription => 'Toegang vanaf elk apparaat';

  @override
  String get authOrSignInWithEmail => 'Of inloggen met e-mail';

  @override
  String get authEnterEmail => 'Voer e-mail in';

  @override
  String get authEnterPassword => 'Voer wachtwoord in';

  @override
  String get authForgotPassword => 'Wachtwoord vergeten?';

  @override
  String get authSignIn => 'Inloggen';

  @override
  String get authSignUp => 'Registreren';

  @override
  String get authPasswordLengthError => 'Wachtwoord moet langer zijn';

  @override
  String get authDontHaveAccount => 'Geen account? Registreer';

  @override
  String get authHaveAccount => 'Al een account? Log in';

  @override
  String get authBackToSignIn => 'Terug naar inloggen';

  @override
  String get authUnexpectedError => 'Authenticatiefout: ';

  @override
  String get authValidEmailError => 'Voer een geldig e-mailadres in';

  @override
  String get authSendPasswordReset => 'Wachtwoord reset versturen';

  @override
  String get authPasswordResetSent => 'Wachtwoord reset verstuurd';

  @override
  String get authVerifyEmailMessage =>
      'Verifieer je e-mail om de registratie te voltooien, controleer je inbox.';

  @override
  String get authInvalidCredentials => 'Ongeldig e-mailadres of wachtwoord';

  @override
  String get authEmailNotConfirmed => 'Verifieer je e-mail om in te loggen';

  @override
  String get authFirstName => 'Voornaam';

  @override
  String get authFirstNameRequired => 'Voornaam is verplicht';

  @override
  String get authLastName => 'Achternaam';

  @override
  String get authLastNameRequired => 'Achternaam is verplicht';

  @override
  String get authContinueAsGuest => 'Verder als gast';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Ontdek de repeaters om je heen';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Snelle toegang';

  @override
  String get homeRepeaterList => 'Repeaterlijst';

  @override
  String get homeMyFavorites => 'Mijn favorieten';

  @override
  String get homeNearby => 'In de buurt';

  @override
  String get homeViewAll => 'Alles bekijken';

  @override
  String get dashboardTabRepeaters => 'Repeaters';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Geen repeaters in de buurt';

  @override
  String get dashboardViewAllRepeaters => 'Alle repeaters bekijken';

  @override
  String get dashboardViewAllPotaSpots => 'Alle POTA spots bekijken';

  @override
  String homeStations(int count) {
    return '$count stations';
  }

  @override
  String homeSaved(int count) {
    return '$count opgeslagen';
  }

  @override
  String homeStationsLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'stations',
      one: 'station',
    );
    return '$_temp0';
  }

  @override
  String homeSavedLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'opgeslagen',
    );
    return '$_temp0';
  }

  @override
  String get homeActive => 'Actief';

  @override
  String get homeIdle => 'Inactief';

  @override
  String get homeNavHome => 'Home';

  @override
  String get homeNavList => 'Lijst';

  @override
  String get homeNavFavorites => 'Favorieten';

  @override
  String get homeNavMap => 'Kaart';

  @override
  String get homeNavProfile => 'Profiel';

  @override
  String get favoritesTitle => 'Mijn favorieten';

  @override
  String get favoritesSearchHint => 'Zoek opgeslagen repeaters...';

  @override
  String get favoritesFilterAllSaved => 'Alle opgeslagen';

  @override
  String get favoritesEmpty => 'Geen opgeslagen repeaters';

  @override
  String get favoritesEmptyDescription =>
      'Voeg repeaters toe aan favorieten om ze hier te zien';

  @override
  String favoritesShowing(int showing, int total) {
    return '$showing van $total favoriete stations weergegeven';
  }

  @override
  String get favoritesRemove => 'Verwijderen uit favorieten';

  @override
  String get favoritesAdd => 'Toevoegen aan favorieten';

  @override
  String get repeaterDetailSave => 'Opslaan';

  @override
  String get repeaterDetailShare => 'Delen';

  @override
  String get repeaterDetailReport => 'Melden';

  @override
  String get repeaterDetailTotalLikes => 'Totaal aantal likes';

  @override
  String get repeaterDetailReports1Yr => 'Meldingen (1 jaar)';

  @override
  String get repeaterDetailHealthScore => 'Gezondheidsscore';

  @override
  String get repeaterDetailExcellent => 'Uitstekend';

  @override
  String get repeaterDetailGood => 'Goed';

  @override
  String get repeaterDetailFair => 'Redelijk';

  @override
  String get repeaterDetailToVerify => 'Te verifiëren';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Score berekend op basis van $count negatieve meldingen in het afgelopen jaar';
  }

  @override
  String get repeaterDetailLastLike => 'Laatste like';

  @override
  String get repeaterDetailLastDownReport => 'Laatste negatieve melding';

  @override
  String get repeaterDetailTechnicalData => 'Technische gegevens';

  @override
  String get repeaterDetailFrequency => 'Frequentie';

  @override
  String get repeaterDetailShift => 'Shift';

  @override
  String get repeaterDetailSubtone => 'Subtoon (SQL)';

  @override
  String get repeaterDetailMode => 'Modus';

  @override
  String get repeaterDetailLocation => 'Locatie';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance verderop';
  }

  @override
  String get repeaterDetailCommunityReports => 'Communitymeldingen';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Status en feedback bijwerken';

  @override
  String get repeaterDetailEquipment => 'Apparatuur';

  @override
  String get repeaterDetailEquipmentRequired => 'Apparatuur *';

  @override
  String get repeaterDetailAccessModes => 'Toegangsmodi';

  @override
  String get repeaterDetailNetwork => 'Netwerk';

  @override
  String get repeaterDetailLocationField => 'Locatie';

  @override
  String get repeaterDetailLocationRequired => 'Locatie *';

  @override
  String get repeaterDetailComment => 'Opmerking';

  @override
  String get repeaterDetailCommentOptional => 'Opmerking (optioneel)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Signaalkwaliteit, audioverslag of algemene opmerkingen...';

  @override
  String get repeaterDetailReportDown => 'Probleem melden';

  @override
  String get repeaterDetailCheckinLike => 'Check-in en like';

  @override
  String get repeaterDetailYourFeedback => 'Jouw feedback';

  @override
  String get repeaterDetailPostedJustNow => 'Zojuist geplaatst';

  @override
  String get repeaterDetailDeleteEntry => 'Item verwijderen';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Alle $count meldingen bekijken';
  }

  @override
  String get repeaterDetailStationPortable => 'Draagbaar';

  @override
  String get repeaterDetailStationMobile => 'Mobiel';

  @override
  String get repeaterDetailStationFixed => 'Vast';

  @override
  String get repeaterDetailLike => 'Like';

  @override
  String get repeaterDetailReportLabel => 'Melding';

  @override
  String get repeaterDetailSaved => 'Opgeslagen';

  @override
  String get repeaterDetailShareMessage => 'Bekijk deze repeater op HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'De meldingsfunctie is binnenkort beschikbaar. Je kunt dan onjuiste informatie of problemen met deze repeater melden.';

  @override
  String get commonClose => 'Sluiten';

  @override
  String get favorite => 'Favoriet';

  @override
  String get accessConfiguration => 'Toegangsconfiguratie';

  @override
  String get noAccessConfiguration => 'Geen configuratie beschikbaar';

  @override
  String get repeaterDetailAddFeedback => 'Feedback toevoegen';

  @override
  String get repeaterDetailOthersReports => 'Meldingen van andere gebruikers';

  @override
  String get repeaterDetailRemove => 'Verwijderen';

  @override
  String get repeaterDetailSelectAccess => 'Selecteer toegang';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Je moet binnen $distance van de repeater zijn om feedback te sturen.';
  }

  @override
  String get repeaterDetailInteractive => 'Interactief';

  @override
  String get repeaterDetailLogYourSignal => 'Log je signaal';

  @override
  String get repeaterDetailUsedEquipment => 'Gebruikte apparatuur';

  @override
  String get repeaterDetailYourLocation => 'Jouw locatie';

  @override
  String get repeaterDetailLocationPlaceholder =>
      'Waar was je? (bijv. Amsterdam)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Selecteer een plaats uit de suggesties';

  @override
  String get feedbackDistanceConfirmTitle => 'Verzending bevestigen';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'De geselecteerde locatie is $distance van de repeater. Bevestig je dat je deze feedback op eigen verantwoordelijkheid wilt versturen?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Bevestigen';

  @override
  String get feedbackDistanceConfirmCancel => 'Annuleren';

  @override
  String get repeaterDetailSelectAccessInstance =>
      'Selecteer toegangsinstantie';

  @override
  String get repeaterDetailSignalObservations => 'Signaalobservaties';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Hoe was de audiokwaliteit?';

  @override
  String get repeaterDetailSendLike => 'Like versturen';

  @override
  String get repeaterDetailReportIssue => 'Probleem melden';

  @override
  String get repeaterDetailRecentActivity => 'Recente activiteit';

  @override
  String get reportIssueTitle => 'Melding';

  @override
  String get reportIssueHeadline => 'Help ons de gegevens accuraat te houden';

  @override
  String get reportIssueDescription =>
      'Heb je iets fouts of ontbrekends gevonden bij deze repeater? Laat ons weten wat er gewijzigd moet worden en we zullen het controleren.';

  @override
  String get reportIssueWhatToCorrect => 'Wat wil je corrigeren of toevoegen?';

  @override
  String get reportIssuePlaceholder =>
      'Bijv. De CTCSS-toon is gewijzigd naar 88,5 Hz, of de locatie is iets noordelijker, de beheerder is...';

  @override
  String get reportIssueVerifiedTitle => 'Geverifieerde inzendingen';

  @override
  String get reportIssueVerifiedDescription =>
      'Je melding wordt beoordeeld door de regionale coördinator voordat de openbare database wordt bijgewerkt. Bedankt voor je bijdrage aan de community.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Ik bevestig dat deze informatie correct is op basis van mijn waarneming.';

  @override
  String get reportIssueSubmit => 'Versturen';

  @override
  String get reportIssueMinChars => 'Minimaal 10 tekens vereist';

  @override
  String get reportIssueMaxChars => 'Maximaal 2000 tekens';

  @override
  String get reportIssueSuccess => 'Melding succesvol verstuurd';

  @override
  String get reportIssueError => 'Fout bij het versturen van de melding';

  @override
  String get registrationPromptTitle => 'Ontgrendel het volledige potentieel';

  @override
  String get registrationPromptDescription =>
      'Word lid van de Italiaanse zendamateurscommunity en til je ervaring naar een hoger niveau.';

  @override
  String get registrationBenefitInteractTitle => 'Interactie';

  @override
  String get registrationBenefitInteractDescription =>
      'Beoordeel repeaters en laat opmerkingen achter voor anderen.';

  @override
  String get registrationBenefitFavoritesTitle => 'Favorieten';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Sla je meest gebruikte frequenties en repeaters op.';

  @override
  String get registrationBenefitLogbookTitle => 'Logboek';

  @override
  String get registrationBenefitLogbookDescription =>
      'Houd je QSO\'s bij en bewaar een persoonlijke geschiedenis.';

  @override
  String get registrationSignInApple => 'Inloggen met Apple';

  @override
  String get registrationSignInGoogle => 'Inloggen met Google';

  @override
  String get registrationPromptFooter =>
      'Gratis registratie. Geen licentie nodig om openbare gegevens te bekijken.';

  @override
  String get postLoginOnboardingWelcome => 'Welkom bij';

  @override
  String get postLoginOnboardingQuestion =>
      'Ben je een gelicentieerde zendamateur?';

  @override
  String get postLoginOnboardingHelpText =>
      'Dit helpt ons je ervaring aan te passen en de juiste frequenties te tonen.';

  @override
  String get postLoginOnboardingYesLicensed => 'Ja, dat ben ik';

  @override
  String get postLoginOnboardingNoListener => 'Nee, ik luister alleen';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identificeer jezelf';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Voer je officiële roepnaam in om toegang te krijgen tot netwerkfuncties.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Roepnaam';

  @override
  String get postLoginOnboardingCallsignHint => 'Bijv. PA3XYZ';

  @override
  String get postLoginOnboardingComplete => 'Profiel voltooien';

  @override
  String get postLoginOnboardingBack => 'Terug';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Je kunt dit later wijzigen in de instellingen.';

  @override
  String get postLoginOnboardingSwlTitle => 'SWL-roepnaam';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Heb je een officiële SWL-roepnaam?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'SWL-roepnamen helpen je te identificeren in de wereldwijde luistergemeenschap.';

  @override
  String get postLoginOnboardingSwlYes => 'Ja, ik heb er een';

  @override
  String get postLoginOnboardingSwlNo => 'Nee, ik heb er geen';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Voer roepnaam in';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Bijv. NL-12345-SWL';

  @override
  String get timeAgoJustNow => 'zojuist';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuten geleden',
      one: '1 minuut geleden',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uur geleden',
      one: '1 uur geleden',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dagen geleden',
      one: '1 dag geleden',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weken geleden',
      one: '1 week geleden',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count maanden geleden',
      one: '1 maand geleden',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jaar geleden',
      one: '1 jaar geleden',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Thema';

  @override
  String get profileThemeModeSystem => 'Systeem';

  @override
  String get profileThemeModeLight => 'Licht';

  @override
  String get profileThemeModeDark => 'Donker';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Wees de eerste die feedback geeft over deze repeater!';

  @override
  String get repeaterDetailDistanceFromYou => 'Afstand tot jou';

  @override
  String get repeaterDistanceMapNoLocation => 'Locatie niet beschikbaar';

  @override
  String get repeaterDetailNever => 'Nooit';

  @override
  String get repeaterDetailInfo => 'Informatie';

  @override
  String get repeaterDetailSource => 'Bron';

  @override
  String get repeaterDetailManager => 'Beheerder';

  @override
  String get repeaterDetailSuggestManager =>
      'Ken je de repeaterbeheerder? Meld het!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Feedbackkaart';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Bekijk waar likes en meldingen zijn geregistreerd';

  @override
  String get repeaterDetailAltimetricProfile => 'Hoogteprofiel';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Bekijk het terreinprofiel tussen jou en de repeater';

  @override
  String get repeaterCoverageTitle => 'Dekking';

  @override
  String get repeaterCoverageCardTitle => 'Dekkingskaart';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Schat het signaal van de repeater in het gebied';

  @override
  String get repeaterCoverageLoading => 'Dekking berekenen…';

  @override
  String get repeaterCoverageError => 'Kan de dekking niet berekenen';

  @override
  String get repeaterCoverageRetry => 'Opnieuw proberen';

  @override
  String get repeaterCoverageLegendTitle => 'Geschat signaal (dBm)';

  @override
  String get repeaterCoverageCta => 'Dekking bekijken';

  @override
  String get repeaterDetailLosClear =>
      'Vrije zichtlijn tussen jou en de repeater';

  @override
  String get repeaterDetailLosObstructed =>
      'Zichtlijn geblokkeerd door terrein';

  @override
  String get repeaterDetailTerrainProfile => 'Terreinprofiel';

  @override
  String get repeaterDetailLineOfSight => 'Zichtlijn';

  @override
  String get repeaterDetailTotalDistance => 'Afstand';

  @override
  String get repeaterDetailRepeaterElevation => 'Hoogte repeater';

  @override
  String get repeaterDetailYourElevation => 'Jouw hoogte';

  @override
  String get repeaterDetailYou => 'Jij';

  @override
  String get repeaterDetailRepeaterLabel => 'Repeater';

  @override
  String get repeaterDetailFunFacts => 'Wist je dat?';

  @override
  String get repeaterDetailWavelength => 'Golflengte';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'De golflengte van deze repeater is $value';
  }

  @override
  String get repeaterDetailOscillations => 'Trillingen per seconde';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Het signaal trilt $value keer per seconde';
  }

  @override
  String get repeaterDetailPropagationTime => 'Voortplantingstijd';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Je signaal doet er $value over om de repeater te bereiken';
  }

  @override
  String get repeaterDetailWaveCycles => 'Golfcycli onderweg';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'De golf voltooit $value volledige cycli onderweg';
  }

  @override
  String get userReportsTitle => 'Mijn activiteiten';

  @override
  String get userReportsTabReports => 'Meldingen';

  @override
  String get userReportsTabSubmissions => 'Nieuwe repeaters';

  @override
  String get userReportsFilterAll => 'Alle';

  @override
  String get userReportsFilterOpen => 'Open';

  @override
  String get userReportsFilterClosed => 'Gesloten';

  @override
  String get userReportsEmpty => 'Geen meldingen ingediend';

  @override
  String get userReportsEmptyDescription =>
      'Je repeatermeldingen verschijnen hier';

  @override
  String get userReportsEmptyFiltered => 'Geen meldingen met dit filter';

  @override
  String get userReportsStatusPending => 'In afwachting';

  @override
  String get userReportsStatusReviewed => 'In behandeling';

  @override
  String get userReportsStatusResolved => 'Opgelost';

  @override
  String get userReportsStatusRejected => 'Afgewezen';

  @override
  String get userReportsRetryBanner => 'Kan de lijst niet bijwerken';

  @override
  String get userReportsProfileTile => 'Mijn meldingen';

  @override
  String get userReportsProfileTileSubtitle =>
      'Bekijk de status van je meldingen';

  @override
  String get userReportsError => 'Fout bij het laden van meldingen';

  @override
  String get userReportsCoordinatorResponse => 'Reactie coördinator';

  @override
  String get userSubmissionsEmpty => 'Geen repeaters voorgesteld';

  @override
  String get userSubmissionsEmptyDescription =>
      'Voorgestelde repeaters verschijnen hier';

  @override
  String get userSubmissionsEmptyFiltered => 'Geen repeaters met dit filter';

  @override
  String get userSubmissionsStatusPending => 'In afwachting';

  @override
  String get userSubmissionsStatusApproved => 'Goedgekeurd';

  @override
  String get userSubmissionsStatusRejected => 'Afgewezen';

  @override
  String get userSubmissionsCoordinatorResponse => 'Reactie coördinator';

  @override
  String get userSubmissionsFrequency => 'Frequentie';

  @override
  String get potaTitle => 'POTA Spots';

  @override
  String get potaSearchHint => 'Zoek op activeerder, park of modus…';

  @override
  String get potaNoSpots => 'Geen actieve POTA spots op dit moment.';

  @override
  String get potaLoadError => 'Kan POTA spots niet laden';

  @override
  String get potaRetry => 'Opnieuw proberen';

  @override
  String get potaViewAll => 'Alles bekijken';

  @override
  String get potaActivator => 'Activeerder';

  @override
  String get potaFrequency => 'Frequentie';

  @override
  String get potaMode => 'Modus';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Referentie';

  @override
  String get potaSpotter => 'Gespot door';

  @override
  String get potaComments => 'Opmerkingen';

  @override
  String get potaLastSpotted => 'Laatst gespot';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Kan QRZ.com niet openen';

  @override
  String get potaParkWebsite => 'Parkwebsite';

  @override
  String get potaParkType => 'Parktype';

  @override
  String get potaLocation => 'Locatie';

  @override
  String get potaCountry => 'Land';

  @override
  String get potaFirstActivation => 'Eerste activering';

  @override
  String get potaBand => 'Band';

  @override
  String potaDistanceAway(String distance) {
    return '$distance verderop';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count actieve spots';
  }

  @override
  String get potaFilterAll => 'Alle';

  @override
  String get potaFilterBand => 'Band';

  @override
  String get potaFilterMode => 'Modus';

  @override
  String get potaSortByTime => 'Meest recent';

  @override
  String get potaSortByDistance => 'Dichtstbij';

  @override
  String get profileLanguage => 'Taal';

  @override
  String get profileUnitSystem => 'Eenheden';

  @override
  String get profileUnitSystemAuto => 'Automatisch';

  @override
  String get profileUnitSystemMetric => 'Metrisch';

  @override
  String get profileUnitSystemImperial => 'Imperiaal';

  @override
  String get profileLanguageSystem => 'Systeem';

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
  String get onboardingSkip => 'Overslaan';

  @override
  String get onboardingGetStarted => 'Aan de slag';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get onboardingWelcomeTitle1 => 'Vind repeaters bij jou in de buurt';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Ontdek actieve repeaters in je omgeving, met frequenties, tonen en technische details.';

  @override
  String get onboardingWelcomeCredits =>
      'Repeatergegevens aangeleverd door IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filter op modus';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analoog, DMR, C4FM, D-STAR — vind direct de juiste repeater voor jou.';

  @override
  String get onboardingWelcomeTitle3 => 'Realtime POTA spots';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Volg Parks on the Air-activeringen met live updates, bandfilters en afstand.';

  @override
  String get onboardingWelcomeTitle4 => 'Sla je favorieten op';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Houd je meest gebruikte repeaters bij de hand voor snelle toegang.';

  @override
  String get onboardingLocationTitle => 'Locatie';

  @override
  String get onboardingLocationSubtitle =>
      'We gebruiken je locatie om repeaters en POTA-activeringen in de buurt te tonen.';

  @override
  String get onboardingLocationEnable => 'Locatie inschakelen';

  @override
  String get onboardingLocationSkip => 'Nu niet';

  @override
  String get onboardingDiscoveryTitle => 'Je eerste repeater';

  @override
  String get onboardingDiscoverySubtitle => 'Dit is er bij jou in de buurt!';

  @override
  String get onboardingDiscoveryViewDetails => 'Details bekijken';

  @override
  String get onboardingDiscoveryViewSpot => 'Spot bekijken';

  @override
  String get onboardingDiscoveryExploreMap => 'Verken de kaart';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Verken de kaart om repeaters en POTA-activeringen te vinden';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Repeater in de buurt';

  @override
  String get onboardingDiscoveryLivePota => 'Live POTA spot';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'Geen repeaters gevonden in de buurt';

  @override
  String get onboardingTelegramTitle => 'Word lid van de community';

  @override
  String get onboardingTelegramSubtitle =>
      'Word lid van de HamQRG Telegram-groep voor updates, repeatermeldingen en ontmoeting met andere zendamateurs.';

  @override
  String get onboardingTelegramJoin => 'Word lid van de Telegram-groep';

  @override
  String get onboardingTelegramLater => 'Misschien later';

  @override
  String get onboardingTelegramAlreadyMember => 'Ik ben al lid';

  @override
  String get addRepeaterProfileTile => 'Nieuwe repeater voorstellen';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Meld een repeater die nog niet vermeld staat';

  @override
  String get addRepeaterTitle => 'Nieuwe repeater';

  @override
  String get addRepeaterHeadline => 'Meld een ontbrekende repeater';

  @override
  String get addRepeaterDescription =>
      'Vul de gegevens in van de repeater die je wilt toevoegen. De inzending wordt beoordeeld vóór publicatie.';

  @override
  String get addRepeaterSectionRepeater => 'Repeatergegevens';

  @override
  String get addRepeaterSectionAccesses => 'Toegangen';

  @override
  String get addRepeaterSectionLocation => 'Locatie';

  @override
  String get addRepeaterSectionNotes => 'Opmerkingen';

  @override
  String get addRepeaterName => 'Naam';

  @override
  String get addRepeaterNameHint => 'Bijv. Monte Cimone';

  @override
  String get addRepeaterCallsign => 'Roepnaam';

  @override
  String get addRepeaterCallsignHint => 'Bijv. IR4AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Voer ten minste een naam of roepnaam in';

  @override
  String get addRepeaterFrequency => 'Frequentie (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Bijv. 145.000 of 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frequentie verplicht';

  @override
  String get addRepeaterFrequencyInvalid => 'Ongeldige frequentie';

  @override
  String get addRepeaterShift => 'Shift (MHz)';

  @override
  String get addRepeaterShiftHint => 'Bijv. -0.600 of -0,600';

  @override
  String get addRepeaterRegion => 'Regio';

  @override
  String get addRepeaterRegionHint => 'Bijv. Emilia-Romagna';

  @override
  String get addRepeaterProvinceCode => 'Provincie';

  @override
  String get addRepeaterProvinceCodeHint => 'Bijv. MO';

  @override
  String get addRepeaterLocality => 'Plaats';

  @override
  String get addRepeaterLocalityHint => 'Bijv. Fanano';

  @override
  String get addRepeaterLatitude => 'Breedtegraad';

  @override
  String get addRepeaterLatitudeHint => 'Bijv. 44.2100';

  @override
  String get addRepeaterLongitude => 'Lengtegraad';

  @override
  String get addRepeaterLongitudeHint => 'Bijv. 10.7900';

  @override
  String get addRepeaterLocator => 'Locator';

  @override
  String get addRepeaterLocatorHint => 'Bijv. JN54QF';

  @override
  String get addRepeaterNotes => 'Aanvullende opmerkingen';

  @override
  String get addRepeaterNotesHint =>
      'Aanvullende informatie over de repeater...';

  @override
  String get addRepeaterAddAccess => 'Toegang toevoegen';

  @override
  String get addRepeaterRemoveAccess => 'Verwijderen';

  @override
  String get addRepeaterAccessMode => 'Modus';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Bijv. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Bijv. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'DCS-code';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Bijv. 23';

  @override
  String get addRepeaterAccessColorCode => 'Kleurcode';

  @override
  String get addRepeaterAccessColorCodeHint => 'Bijv. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Bijv. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Bijv. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node-ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Bijv. 1234';

  @override
  String get addRepeaterAccessNac => 'NAC';

  @override
  String get addRepeaterAccessNacHint => 'Bijv. 659';

  @override
  String get addRepeaterAccessNetworkName => 'Netwerknaam';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Bijv. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Toegangsnotities';

  @override
  String get addRepeaterAccessNotesHint =>
      'Notities specifiek voor deze toegang...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Ik bevestig dat deze informatie naar mijn beste weten correct is.';

  @override
  String get addRepeaterVerifiedTitle => 'Geverifieerde inzending';

  @override
  String get addRepeaterVerifiedDescription =>
      'Je inzending wordt door het team beoordeeld voordat deze in de database wordt gepubliceerd.';

  @override
  String get addRepeaterSubmit => 'Versturen';

  @override
  String get addRepeaterSuccess => 'Inzending succesvol verstuurd!';

  @override
  String get addRepeaterError => 'Fout bij het versturen van de inzending';

  @override
  String get addRepeaterAtLeastOneAccess => 'Voeg ten minste één toegang toe';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Toegang $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'Realtime POTA spots met kaart en parkdetails';

  @override
  String get changelog1017SubmitRepeater =>
      'Stel een nieuwe repeater voor rechtstreeks vanuit de app';

  @override
  String get changelog1017MultiLanguage =>
      'App beschikbaar in het Engels, Spaans en Frans';

  @override
  String get changelog1017Onboarding => 'Nieuwe eerste-keer-ervaring';

  @override
  String get changelog1017ReportAnonymous =>
      'Meldingen beschikbaar zonder registratie';

  @override
  String get changelog1020ClusterSpots =>
      'Realtime cluster spots: zie wie er luistert op repeaters, met meldingen en voorkeuren';

  @override
  String get changelog1020DetailTabs =>
      'Repeaterpagina met tabbladen Info, Cluster en Community';

  @override
  String get changelog1020TabletLayout =>
      'Geoptimaliseerde lay-out voor tablets';

  @override
  String get changelog110Coverage =>
      'Dekkingskaart van repeaters: bekijk het voorspelde signaal direct op de kaart (PRO)';

  @override
  String get changelog110Reachable =>
      'Wat je van hier bereikt: ontdek de repeaters die je vanaf je locatie haalt, met signaal en terreinprofiel (PRO)';

  @override
  String get changelogTitle => 'Wat is er nieuw';

  @override
  String get changelogSubtitle => 'Dit is nieuw in deze versie';

  @override
  String get changelogCategoryAdded => 'Nieuw';

  @override
  String get changelogCategoryImproved => 'Verbeterd';

  @override
  String get changelogCategoryFixed => 'Opgelost';

  @override
  String get changelogDismiss => 'Begrepen!';

  @override
  String get spotCreateTitle => 'Jezelf spotten';

  @override
  String get spotCreateOtherTitle => 'Een OM spotten';

  @override
  String get spotCreateDuration => 'Duur';

  @override
  String get spotCreateAccess => 'Modus (optioneel)';

  @override
  String get spotCreateCallsign => 'Roepnaam van gehoorde OM';

  @override
  String get spotCreateCallsignHint => 'Bijv. PA0ABC';

  @override
  String get spotCreateConfirm => 'Bevestigen';

  @override
  String get spotCreateSuccessSelf => 'Spot aangemaakt!';

  @override
  String get spotCreateSuccessOther => 'OM gespot!';

  @override
  String get spotActiveYou => 'Je bent gespot';

  @override
  String get spotActiveClose => 'Spot sluiten';

  @override
  String spotActiveOn(String repeaterName) {
    return 'op $repeaterName';
  }

  @override
  String get spotActiveNone => 'Momenteel niemand gespot';

  @override
  String get spotActiveCta => 'Wees de eerste!';

  @override
  String get spotActiveSection => 'Actieve spots';

  @override
  String get spotHistorySection => 'Spotgeschiedenis';

  @override
  String get spotListTitle => 'Laatste spots';

  @override
  String get spotListViewAll => 'Alles bekijken';

  @override
  String get spotListBadgeActive => 'Luistert';

  @override
  String get spotListBadgeClosed => 'Beëindigd';

  @override
  String get spotListBadgeReport => 'Melden';

  @override
  String get spotListEmpty => 'Geen spots in de afgelopen 24 uur';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Gemeld door $callsign';
  }

  @override
  String get spotNotificationToggle => 'Clustermeldingen';

  @override
  String get spotNotificationDisabled =>
      'Clustermeldingen uitgeschakeld in profielinstellingen';

  @override
  String get spotNotificationPerFavorite => 'Spotmeldingen';

  @override
  String get spotPreviousClosed => 'Je vorige spot is niet meer actief';

  @override
  String get spotErrorAuthRequired => 'Je moet ingelogd zijn.';

  @override
  String get spotErrorCallsignRequired =>
      'Stel je roepnaam in je profiel in om het cluster te gebruiken.';

  @override
  String get spotErrorInvalidDuration =>
      'De duur moet tussen 5 en 60 minuten zijn.';

  @override
  String get spotErrorRepeaterNotFound => 'Repeater niet gevonden.';

  @override
  String get spotErrorInvalidAccess =>
      'Ongeldige toegangsmodus voor deze repeater.';

  @override
  String get spotErrorSpotNotFound => 'Spot niet gevonden.';

  @override
  String get spotErrorForbidden =>
      'Je kunt een spot die niet van jou is niet sluiten.';

  @override
  String get spotErrorAlreadyClosed => 'De spot is al gesloten.';

  @override
  String get spotErrorGeneric =>
      'Fout bij het aanmaken van de spot. Probeer het opnieuw.';

  @override
  String get spotAccessUnavailable => '(modus niet meer beschikbaar)';

  @override
  String spotDurationMinutes(int minutes) {
    return '$minutes min';
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
  String get spotsFiltersTitle => 'Filters';

  @override
  String get spotsFilterBand => 'Band';

  @override
  String get spotsFilterMode => 'Modus';

  @override
  String get spotsFilterAll => 'Alle';

  @override
  String get spotsFiltersReset => 'Filters wissen';

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
      'Bereikbare relais konden niet worden berekend.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Je bereikt $count relais',
      one: 'Je bereikt 1 relais',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Vanaf je locatie, gesorteerd op signaal';

  @override
  String get reachSheetEmpty => 'Geen bereikbare relais in de buurt.';

  @override
  String get reachBadgeTitle => 'Bereik je het vanaf hier?';

  @override
  String get reachBadgeSubtitle =>
      'Ontdek of dit relais je dekt en met welk signaal';

  @override
  String get reachDiscoverCta => 'Ontdek het met PRO';

  @override
  String get reachReachable => 'Je bereikt het';

  @override
  String get reachOutOfCoverage => 'Buiten dekking';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · tik voor het profiel';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance vanaf hier';
  }

  @override
  String get reachComputing => 'Dekking berekenen…';

  @override
  String get reachRepeaterFallback => 'Relais';

  @override
  String get reachMapButton => 'Wat bereik je?';

  @override
  String get reachUpsellTitle => 'Wat bereik je vanaf hier? 📡';

  @override
  String get reachUpsellBody =>
      'Zie in realtime ALLE relais die je vanaf je locatie ontvangt, met voorspeld signaal en terreinprofiel. Hoeveel bereik je echt vanaf waar je nu bent?';

  @override
  String get reachUpsellLater => 'Later';

  @override
  String get linkProfileObstructed =>
      'Obstakel op het pad (signaal via diffractie)';

  @override
  String get linkProfileClear => 'Vrij zicht';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Terreinprofiel en zichtlijn · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Ontgrendel met PRO';

  @override
  String get proWelcomeTitle => 'Welkom bij PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Je hebt de dekkingskaart, de relais die je vanaf je locatie bereikt en alle PRO-functies ontgrendeld. 📡';

  @override
  String get proWelcomeCta => 'Begin met verkennen';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonDelete => 'Verwijderen';

  @override
  String get commonEdit => 'Bewerken';

  @override
  String get commonOpenSettings => 'Instellingen openen';

  @override
  String get commonFieldRequired => 'Verplicht veld';

  @override
  String get fieldName => 'Naam';

  @override
  String get fieldAddress => 'Adres';

  @override
  String get fieldCity => 'Stad';

  @override
  String get fieldDescription => 'Beschrijving';

  @override
  String get fieldYear => 'Jaar';

  @override
  String get fieldSelectDateHint => 'Selecteer een datum';

  @override
  String get validationInvalidYear => 'Selecteer een geldig jaar';

  @override
  String get validationPasswordMinLength =>
      'Het wachtwoord moet minstens 6 tekens lang zijn';

  @override
  String get permissionsMissingTitle => 'Ontbrekende rechten!';

  @override
  String get imageUploadError => 'Fout bij het uploaden van de afbeelding';

  @override
  String get uploadImageLabel => 'Afbeelding uploaden';

  @override
  String get sourceGallery => 'Galerij';

  @override
  String get sourceCamera => 'Camera';

  @override
  String get changePasswordTitle => 'Wachtwoord wijzigen';

  @override
  String get fieldNewPassword => 'Nieuw wachtwoord';

  @override
  String get fieldConfirmNewPassword => 'Bevestig nieuw wachtwoord';

  @override
  String get validationPasswordsNoMatch => 'De wachtwoorden komen niet overeen';

  @override
  String get passwordChangedSuccess => 'Wachtwoord succesvol gewijzigd';

  @override
  String errorWithMessage(String message) {
    return 'Fout: $message';
  }

  @override
  String get updateRequiredTitle => 'Update vereist';

  @override
  String get updateRequiredAction => 'Nu bijwerken';

  @override
  String get yearPickerTitle => 'Selecteer het jaar';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Community';

  @override
  String get updateRequiredBody =>
      'Er is een nieuwe versie van de app beschikbaar. Werk bij om de app te blijven gebruiken.';

  @override
  String get errorOpeningStore => 'Fout bij het openen van de store';

  @override
  String get deleteConfirmTitle => 'Verwijderen bevestigen';

  @override
  String get deleteConfirmContent => 'Weet je zeker dat je wilt verwijderen?';

  @override
  String get cameraPermissionRationale =>
      'Geef in de instellingen toegang tot de camera om een foto te maken.';

  @override
  String get coverageSearchHint => 'Zoek een plaats of plak coördinaten';

  @override
  String get coverageSearchRecentTitle => 'Recente zoekopdrachten';

  @override
  String get coverageSearchNoResults => 'Geen plaats gevonden';

  @override
  String get coverageSearchTip =>
      'Je kunt coördinaten plakken (46.4879, 11.8123) of lang op de kaart drukken';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Coördinaten buiten bereik: breedtegraad ±90, lengtegraad ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Geen verbinding: zoeken naar plaatsen vereist netwerk';

  @override
  String get coverageSearchErrorFailed => 'Zoeken mislukt. Probeer opnieuw.';

  @override
  String get coverageSearchClearPoint => 'Punt verwijderen';

  @override
  String get coverageSearchPointSemantics => 'Geselecteerd zoekpunt';

  @override
  String get coverageBreadthTitle => 'Zoekbereik';

  @override
  String get coverageBreadthQuick => 'Snel';

  @override
  String get coverageBreadthMedium => 'Gemiddeld';

  @override
  String get coverageBreadthExtended => 'Uitgebreid';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · snelste antwoord';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · in balans';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · verder, langere wachttijd';
  }

  @override
  String get coverageResultSubtitle => 'Vanaf het geselecteerde punt';

  @override
  String get coverageResultEmptyNoReachable =>
      'Geen enkele repeater is bereikbaar vanaf dit punt';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'Geen repeaters geregistreerd in dit gebied';

  @override
  String get coverageResultClearFilters => 'Filters wissen';

  @override
  String get coverageResultError => 'Berekening mislukt';

  @override
  String get coverageResultComputing => 'Ontvangst berekenen…';

  @override
  String get coverageResultCancel => 'Annuleren';

  @override
  String coverageResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bereikbare repeaters',
      one: '1 bereikbare repeater',
    );
    return '$_temp0';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown van $total bereikbaar';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bereikbare verborgen door filters',
      one: '1 bereikbare verborgen door filters',
    );
    return '$_temp0';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Wat bereik je vanaf $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Elke repeater die je vanaf dat punt bereikt, met voorspeld signaal en afstand — nog voor je vertrekt.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Elk punt op aarde';

  @override
  String get coverageTeaserBenefitOffline =>
      'Zonder netwerk te raadplegen, in het veld';

  @override
  String get coverageTeaserBenefitSave => 'Bewaar de locatie en vind hem terug';

  @override
  String get stationSaveCta => 'Locatie opslaan';

  @override
  String get stationSaveTitle => 'Naam van de locatie';

  @override
  String get stationRename => 'Hernoemen';

  @override
  String get stationDelete => 'Verwijderen';

  @override
  String get stationRefresh => 'Vernieuwen';

  @override
  String get stationRefreshAll => 'Alles vernieuwen';

  @override
  String get stationOfflineNotice => 'Gegevens opgeslagen op dit apparaat';

  @override
  String get stationStaleNotice => 'Deze gegevens zijn mogelijk verouderd';

  @override
  String get stationMissingEntry => 'Gegevens offline niet beschikbaar';

  @override
  String get stationDuplicateTitle => 'Punt al opgeslagen';

  @override
  String stationDuplicateBody(String distance) {
    return 'Er is al een locatie binnen $distance. Bijwerken of een aparte maken?';
  }

  @override
  String get stationDuplicateUpdate => 'Bijwerken';

  @override
  String get stationDuplicateCreate => 'Apart maken';

  @override
  String get stationSaveFailed => 'Opslaan mislukt: onvoldoende ruimte';

  @override
  String get stationSavedCta => 'Locatie opgeslagen';

  @override
  String get stationRemoveCta => 'Verwijderen';

  @override
  String get stationRemoveTitle => 'Locatie verwijderen?';

  @override
  String stationRemoveBody(String name) {
    return '‘$name’ en de offlinegegevens worden van dit apparaat verwijderd.';
  }

  @override
  String get stationRemovedSnack => 'Locatie verwijderd';

  @override
  String get stationSaveError => 'Opslaan mislukt. Probeer het opnieuw.';

  @override
  String get stationsTitle => 'Mijn locaties';

  @override
  String get stationsProfileSubtitle =>
      'De punten die je hebt beoordeeld, ook offline beschikbaar';

  @override
  String get stationsEmptyTitle => 'Nog geen locaties opgeslagen';

  @override
  String get stationsEmptyBody =>
      'Een locatie is een kaartpunt waarvan je de dekking al hebt berekend, opgeslagen om het ook zonder netwerk terug te vinden.';

  @override
  String get stationsEmptyStep1 =>
      'Kies een punt op de kaart: houd ingedrukt, zoek op naam of plak de coördinaten.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Tik op “$action” om te zien welke repeaters je van daaruit bereikt.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Sla het punt op: je vindt het hier terug, ook in het veld zonder netwerk.';

  @override
  String get stationsGoToMap => 'Naar de kaart';

  @override
  String get stationsRefreshDone => 'Vernieuwen voltooid';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Bijgewerkt $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Update over $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Update over $minutes min';
  }

  @override
  String get spotsUpdating => 'Bijwerken…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Automatisch bijwerken elke $seconds seconden';
  }

  @override
  String get spotsManualRefreshHint => 'Tik om bij te werken';

  @override
  String coverageResultScope(String km, int count) {
    return 'binnen $km · $count beoordeeld';
  }

  @override
  String get coverageResultRecalculating => 'Opnieuw berekenen';

  @override
  String get offlineBannerMessage =>
      'Je bent offline: eerder opgeslagen gegevens';

  @override
  String get offlineMapsTitle => 'Offlinekaarten';

  @override
  String get offlineMapsEntrySubtitle =>
      'Download kaarten voor gebruik zonder verbinding';

  @override
  String get offlineMapsEmpty =>
      'Geen regio\'s gedownload. Download een gebied om de kaart ook zonder verbinding te zien.';

  @override
  String get offlineMapsAddRegion => 'Regio downloaden';

  @override
  String get offlineMapsRegionNameLabel => 'Naam van de regio';

  @override
  String get offlineMapsRegionNameHint =>
      'Bijv. Thuis, Berghut, SOTA-activatie';

  @override
  String get offlineMapsRadiusLabel => 'Straal';

  @override
  String get offlineMapsDownload => 'Downloaden';

  @override
  String get offlineMapsDownloadingStyle => 'Kaartstijl wordt gedownload…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Kaarten worden gedownload… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Geschatte grootte: $size';
  }

  @override
  String get offlineMapsDownloadError =>
      'Download mislukt. Probeer het opnieuw.';

  @override
  String get offlineMapsDeleteError =>
      'Verwijderen mislukt. Probeer het opnieuw.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Regio verwijderen?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '“$name” is offline niet meer beschikbaar.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Verwijderen';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Straal $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Onvolledige download';

  @override
  String get offlineMapsResume => 'Hervatten';

  @override
  String get offlineMapsCenterInfo =>
      'De regio wordt gecentreerd op je huidige locatie.';

  @override
  String get dashboardOfflineTitle => 'Je bent offline';

  @override
  String get dashboardOfflineMessage =>
      'Geen opgeslagen gegevens voor dit gebied. Je opgeslagen locaties en gedownloade kaarten blijven beschikbaar.';

  @override
  String get offlineMapsCenterMine => 'Mijn locatie';

  @override
  String get offlineMapsCenterSearch => 'Zoek een plaats';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Zoek een stad of plaats: de regio wordt daar gecentreerd.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Centrum: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Offlinemodus: repeaters, favorieten, profiel, dekking en bereik ook zonder netwerk beschikbaar (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Offlinekaarten: download de omgeving van je locatie of een plaats naar keuze en gebruik die zonder verbinding (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Dekking zoeken vanaf elk punt: zoek een plaats, plak coördinaten of druk lang op de kaart om te zien wat je van daaruit bereikt';

  @override
  String get changelog120SavedStations =>
      'Mijn stations: sla de punten op die je interesseren en raadpleeg ze ook offline (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'SOTA- en POTA-spots verversen elke minuut vanzelf, met gekleurde badges per mode (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Zonder verbinding start de app meteen, toont wat beschikbaar is en schakelt acties uit die netwerk vereisen';

  @override
  String get changelog130ImperialUnits =>
      'Mijlen en voet: de app volgt nu de eenheden van je apparaat, en je kunt het systeem zelf kiezen in Instellingen';

  @override
  String get profileUnitSystemAutoShort => 'Auto';

  @override
  String updateAvailableBannerMessage(String version) {
    return 'Versie $version is beschikbaar, we raden aan bij te werken';
  }

  @override
  String get updateAvailableAction => 'Bijwerken';

  @override
  String get updateAvailableDismiss => 'Niet nu';

  @override
  String get dashboardLoadError => 'Kan de actuele gegevens niet laden';

  @override
  String get dashboardLoadErrorMessage =>
      'De server reageerde niet. Probeer het zo nog eens.';
}
