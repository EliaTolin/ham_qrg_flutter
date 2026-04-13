// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get error => 'Greška';

  @override
  String get error_message => 'Došlo je do greške prilikom učitavanja';

  @override
  String get error_message_retry =>
      'Došlo je do greške prilikom učitavanja. Pokušajte ponovo kasnije';

  @override
  String get retry => 'Pokušaj ponovo';

  @override
  String get back => 'Nazad';

  @override
  String get loading => 'Učitavanje';

  @override
  String get details => 'Detalji';

  @override
  String pages_number(Object number) {
    return '$number stranica za istraživanje';
  }

  @override
  String get january => 'Januar';

  @override
  String get february => 'Februar';

  @override
  String get march => 'Mart';

  @override
  String get april => 'April';

  @override
  String get may => 'Maj';

  @override
  String get june => 'Jun';

  @override
  String get july => 'Jul';

  @override
  String get august => 'Avgust';

  @override
  String get september => 'Septembar';

  @override
  String get october => 'Oktobar';

  @override
  String get november => 'Novembar';

  @override
  String get december => 'Decembar';

  @override
  String get logout => 'Odjavi se';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Podešavanja';

  @override
  String get contact_us => 'Kontaktirajte nas';

  @override
  String get error_opening_email =>
      'Došlo je do greške prilikom otvaranja e-pošte';

  @override
  String get register_now => 'Registrujte se';

  @override
  String get tracking_permission_title => 'Podržite aplikaciju';

  @override
  String get tracking_permission_message =>
      'Da bismo poboljšali vaše iskustvo i prikazali relevantniji sadržaj, pomozite nam da aplikacija ostane besplatna.\n\nDodirnite Dozvoli da nas podržite.';

  @override
  String get tracking_permission_next => 'Dalje';

  @override
  String get skip => 'Preskoči';

  @override
  String get done => 'Gotovo';

  @override
  String get next => 'Dalje';

  @override
  String get joinCommunityTitle => 'Pridružite se zajednici!';

  @override
  String get joinCommunityDescription =>
      'Otkrijte prednosti članstva u Telegram zajednici:';

  @override
  String get benefitSupportMembers => 'Podrška članova';

  @override
  String get benefitSuggestFeatures => 'Predložite nove funkcije';

  @override
  String get benefitContactDevelopers => 'Kontakt sa programerima';

  @override
  String get benefitExclusivePreviews => 'Ekskluzivni pregledi i beta verzije';

  @override
  String get benefitActiveCommunity => 'Aktivna zajednica';

  @override
  String get joinNowButton => 'Pridruži se odmah!';

  @override
  String get alreadyMemberButton => 'Već sam član';

  @override
  String get laterButton => 'Kasnije';

  @override
  String get errorOpenTelegram => 'Greška prilikom otvaranja Telegram-a';

  @override
  String get disclaimerTitle => 'Izvor podataka';

  @override
  String get disclaimerDescription =>
      'Podaci o repetitorima u ovoj aplikaciji potiču od IZ8WNH.\n\nZa dodatne informacije, preuzimanje CSV datoteka za programiranje radio uređaja ili konsultovanje podataka koji nisu dostupni u ovoj aplikaciji, posetite zvaničnu veb stranicu.';

  @override
  String get disclaimerVisitSite => 'Posetite iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Razumem';

  @override
  String get errorOpenDisclaimerSite =>
      'Greška prilikom otvaranja veb stranice';

  @override
  String get repeatersMapTitle => 'Mapa repetitora';

  @override
  String get repeatersListTitle => 'Lista repetitora';

  @override
  String get repeatersMapLoading => 'Učitavanje mape repetitora…';

  @override
  String get repeatersMapGenericError => 'Nije moguće učitati repetitore.';

  @override
  String get repeatersMapEmpty => 'Nema pronađenih repetitora u vašoj blizini.';

  @override
  String get repeatersSearchHint =>
      'Pretražite po imenu, pozivnom znaku ili frekvenciji MHz…';

  @override
  String get repeatersSearchEmpty => 'Nema pronađenih repetitora.';

  @override
  String get repeatersSortDistance => 'Udaljenost';

  @override
  String get repeatersSortLikes => 'Sviđanja';

  @override
  String get repeatersSortFrequency => 'Frekvencija';

  @override
  String repeatersNearbyCount(int count) {
    return '$count obližnjih repetitora';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count rezultata';
  }

  @override
  String get repeatersMapRetry => 'Pokušaj ponovo';

  @override
  String get repeatersMapOpenSettings => 'Otvori podešavanja';

  @override
  String get repeatersMapPermissionMessage =>
      'Dozvolite pristup lokaciji da bismo prikazali repetitore u vašoj blizini.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Dozvola za lokaciju je trajno odbijena. Omogućite je u sistemskim podešavanjima.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Omogućite usluge lokacije da biste pronašli obližnje repetitore.';

  @override
  String repeatersMapFound(int count) {
    return '$count pronađenih repetitora';
  }

  @override
  String get repeaterMode => 'Režim';

  @override
  String get repeaterModeAnalog => 'Analogni';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Svi režimi';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frekvencija';

  @override
  String get repeaterShift => 'Pomak';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Lokacija';

  @override
  String get repeaterDistance => 'Udaljenost';

  @override
  String get repeaterViewFullDetails => 'Prikaži sve detalje';

  @override
  String get repeatersMapReturnToLocation => 'Vrati se na moju lokaciju';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count repetitora na ovoj lokaciji';
  }

  @override
  String get profileUnlockFeatures => 'Otključajte sve funkcije';

  @override
  String get profileUnlockFeaturesDescription =>
      'Registrujte se da biste koristili recenzije, čuvanje omiljenih i pristup detaljnoj statistici.';

  @override
  String get profileSignUpOrLogin => 'Registracija ili prijava';

  @override
  String get profileErrorOpeningEmail => 'Greška prilikom otvaranja e-pošte';

  @override
  String get profileJoinTelegramCommunity => 'Pridružite se Telegram zajednici';

  @override
  String get profileWelcomeTitle => 'Dobrodošli u HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Pridružite se zajednici radioamatera u Italiji.';

  @override
  String get profileEditProfile => 'Uredi profil';

  @override
  String get profileChangePhoto => 'Promeni fotografiju';

  @override
  String get profileFirstName => 'Ime';

  @override
  String get profileLastName => 'Prezime';

  @override
  String get profileCallsign => 'Pozivni znak';

  @override
  String get profileRestartIdentificationTitle =>
      'Trebate promeniti status? Možete ponovo pokrenuti proces identifikacije da biste prešli sa licenciranog operatera na SWL slušaoca.';

  @override
  String get profileRestartIdentificationButton =>
      'Ponovo pokreni proces identifikacije';

  @override
  String get profileSaveChanges => 'Sačuvaj izmene';

  @override
  String get profileDangerZone => 'Opasna zona';

  @override
  String get profileDeleteAccount => 'Obriši nalog';

  @override
  String get profileDeleteAccountConfirmTitle => 'Obriši nalog';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Da li ste sigurni da želite da obrišete nalog? Ova radnja je nepovratna.';

  @override
  String get profileDeleteAccountCancel => 'Otkaži';

  @override
  String get profileDeleteAccountConfirm => 'Obriši';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Verzija aplikacije $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Zajednica i podrška';

  @override
  String get profileSectionSupport => 'Podrška';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Verzija: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Verzija $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Greška: $error';
  }

  @override
  String get authJoinTitle => 'Pridružite se HamQRG';

  @override
  String get authUnlockFeatures => 'Prijavite se da otključate sve funkcije!';

  @override
  String get authWhatYouGet => 'Šta dobijate:';

  @override
  String get authBenefitStatsTitle => 'Detaljna statistika';

  @override
  String get authBenefitStatsDescription =>
      'Pratite svoj napredak i poboljšajte se';

  @override
  String get authBenefitQuizTitle => 'Razni režimi kviza';

  @override
  String get authBenefitQuizDescription =>
      'Vežbajte u maratonskom, tematskom i drugim režimima.';

  @override
  String get authBenefitSyncTitle => 'Sinhronizacija';

  @override
  String get authBenefitSyncDescription => 'Pristupite sa bilo kog uređaja';

  @override
  String get authOrSignInWithEmail => 'Ili se prijavite putem e-pošte';

  @override
  String get authEnterEmail => 'Unesite e-poštu';

  @override
  String get authEnterPassword => 'Unesite lozinku';

  @override
  String get authForgotPassword => 'Zaboravili ste lozinku?';

  @override
  String get authSignIn => 'Prijavite se';

  @override
  String get authSignUp => 'Registrujte se';

  @override
  String get authPasswordLengthError => 'Lozinka mora biti duža';

  @override
  String get authDontHaveAccount => 'Nemate nalog? Registrujte se';

  @override
  String get authHaveAccount => 'Već imate nalog? Prijavite se';

  @override
  String get authBackToSignIn => 'Nazad na prijavu';

  @override
  String get authUnexpectedError => 'Greška pri autentifikaciji: ';

  @override
  String get authValidEmailError => 'Unesite ispravnu e-poštu';

  @override
  String get authSendPasswordReset => 'Pošalji reset lozinke';

  @override
  String get authPasswordResetSent => 'Reset lozinke je poslat';

  @override
  String get authVerifyEmailMessage =>
      'Potvrdite svoju e-poštu da biste završili registraciju, proverite prijemno sanduče.';

  @override
  String get authInvalidCredentials => 'Neispravna e-pošta ili lozinka';

  @override
  String get authEmailNotConfirmed =>
      'Potvrdite svoju e-poštu da biste se prijavili';

  @override
  String get authFirstName => 'Ime';

  @override
  String get authFirstNameRequired => 'Ime je obavezno';

  @override
  String get authLastName => 'Prezime';

  @override
  String get authLastNameRequired => 'Prezime je obavezno';

  @override
  String get authContinueAsGuest => 'Nastavi kao gost';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Otkrijte repetitore oko vas';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Brzi pristup';

  @override
  String get homeRepeaterList => 'Lista repetitora';

  @override
  String get homeMyFavorites => 'Moji omiljeni';

  @override
  String get homeNearby => 'U blizini';

  @override
  String get homeViewAll => 'Prikaži sve';

  @override
  String get dashboardTabRepeaters => 'Repetitori';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Nema repetitora u blizini';

  @override
  String get dashboardViewAllRepeaters => 'Prikaži sve repetitore';

  @override
  String get dashboardViewAllPotaSpots => 'Prikaži sve POTA spotove';

  @override
  String homeStations(int count) {
    return '$count stanica';
  }

  @override
  String homeSaved(int count) {
    return '$count sačuvano';
  }

  @override
  String get homeActive => 'Aktivno';

  @override
  String get homeIdle => 'Neaktivno';

  @override
  String get homeNavHome => 'Početna';

  @override
  String get homeNavList => 'Lista';

  @override
  String get homeNavFavorites => 'Omiljeni';

  @override
  String get homeNavMap => 'Mapa';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Moji omiljeni';

  @override
  String get favoritesSearchHint => 'Pretraži sačuvane repetitore...';

  @override
  String get favoritesFilterAllSaved => 'Svi sačuvani';

  @override
  String get favoritesEmpty => 'Nema sačuvanih repetitora';

  @override
  String get favoritesEmptyDescription =>
      'Dodajte repetitore u omiljene da biste ih videli ovde';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Prikazano $showing od $total omiljenih stanica';
  }

  @override
  String get favoritesRemove => 'Ukloni iz omiljenih';

  @override
  String get favoritesAdd => 'Dodaj u omiljene';

  @override
  String get repeaterDetailSave => 'Sačuvaj';

  @override
  String get repeaterDetailShare => 'Podeli';

  @override
  String get repeaterDetailReport => 'Prijavi';

  @override
  String get repeaterDetailTotalLikes => 'Ukupno sviđanja';

  @override
  String get repeaterDetailReports1Yr => 'Prijave (1 godina)';

  @override
  String get repeaterDetailHealthScore => 'Ocena ispravnosti';

  @override
  String get repeaterDetailExcellent => 'Odlično';

  @override
  String get repeaterDetailGood => 'Dobro';

  @override
  String get repeaterDetailFair => 'Prosečno';

  @override
  String get repeaterDetailToVerify => 'Za proveru';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Ocena izračunata na osnovu $count negativnih prijava u poslednjih godinu dana';
  }

  @override
  String get repeaterDetailLastLike => 'Poslednje sviđanje';

  @override
  String get repeaterDetailLastDownReport => 'Poslednja negativna prijava';

  @override
  String get repeaterDetailTechnicalData => 'Tehnički podaci';

  @override
  String get repeaterDetailFrequency => 'Frekvencija';

  @override
  String get repeaterDetailShift => 'Pomak';

  @override
  String get repeaterDetailSubtone => 'Podton (SQL)';

  @override
  String get repeaterDetailMode => 'Režim';

  @override
  String get repeaterDetailLocation => 'Lokacija';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance udaljenosti';
  }

  @override
  String get repeaterDetailCommunityReports => 'Izveštaji zajednice';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Ažurirajte status i povratne informacije';

  @override
  String get repeaterDetailEquipment => 'Oprema';

  @override
  String get repeaterDetailEquipmentRequired => 'Oprema *';

  @override
  String get repeaterDetailAccessModes => 'Režimi pristupa';

  @override
  String get repeaterDetailNetwork => 'Mreža';

  @override
  String get repeaterDetailLocationField => 'Lokacija';

  @override
  String get repeaterDetailLocationRequired => 'Lokacija *';

  @override
  String get repeaterDetailComment => 'Komentar';

  @override
  String get repeaterDetailCommentOptional => 'Komentar (opciono)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Kvalitet signala, audio izveštaj ili opšti komentari...';

  @override
  String get repeaterDetailReportDown => 'Prijavi problem';

  @override
  String get repeaterDetailCheckinLike => 'Prijava i sviđanje';

  @override
  String get repeaterDetailYourFeedback => 'Vaše povratne informacije';

  @override
  String get repeaterDetailPostedJustNow => 'Objavljeno upravo';

  @override
  String get repeaterDetailDeleteEntry => 'Obriši unos';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Prikaži svih $count izveštaja';
  }

  @override
  String get repeaterDetailStationPortable => 'Prenosiva';

  @override
  String get repeaterDetailStationMobile => 'Mobilna';

  @override
  String get repeaterDetailStationFixed => 'Fiksna';

  @override
  String get repeaterDetailLike => 'Sviđa mi se';

  @override
  String get repeaterDetailReportLabel => 'Prijava';

  @override
  String get repeaterDetailSaved => 'Sačuvano';

  @override
  String get repeaterDetailShareMessage =>
      'Pogledajte ovaj repetitor na HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'Funkcija prijavljivanja biće uskoro dostupna. Moći ćete da prijavite netačne informacije ili probleme sa ovim repetitorom.';

  @override
  String get commonClose => 'Zatvori';

  @override
  String get favorite => 'Omiljeni';

  @override
  String get accessConfiguration => 'Konfiguracija pristupa';

  @override
  String get noAccessConfiguration => 'Nema dostupne konfiguracije';

  @override
  String get repeaterDetailAddFeedback => 'Dodaj povratnu informaciju';

  @override
  String get repeaterDetailOthersReports => 'Izveštaji drugih korisnika';

  @override
  String get repeaterDetailRemove => 'Ukloni';

  @override
  String get repeaterDetailSelectAccess => 'Izaberite pristup';

  @override
  String repeaterDetailDistanceWarning(int distance) {
    return 'Morate biti na udaljenosti od $distance km od repetitora da biste poslali povratnu informaciju.';
  }

  @override
  String get repeaterDetailInteractive => 'Interaktivno';

  @override
  String get repeaterDetailLogYourSignal => 'Zabeležite svoj signal';

  @override
  String get repeaterDetailUsedEquipment => 'Korišćena oprema';

  @override
  String get repeaterDetailYourLocation => 'Vaša lokacija';

  @override
  String get repeaterDetailLocationPlaceholder =>
      'Gde ste bili? (npr. Beograd)';

  @override
  String get repeaterDetailLocationSelectHint => 'Izaberite mesto iz predloga';

  @override
  String get feedbackDistanceConfirmTitle => 'Potvrdite slanje';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Izabrana lokacija je udaljena $distance km od repetitora. Da li potvrđujete da želite da pošaljete ovu povratnu informaciju na svoju odgovornost?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Potvrdi';

  @override
  String get feedbackDistanceConfirmCancel => 'Otkaži';

  @override
  String get repeaterDetailSelectAccessInstance =>
      'Izaberite instancu pristupa';

  @override
  String get repeaterDetailSignalObservations => 'Zapažanja o signalu';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Kakav je bio kvalitet zvuka?';

  @override
  String get repeaterDetailSendLike => 'Pošalji sviđanje';

  @override
  String get repeaterDetailReportIssue => 'Prijavi problem';

  @override
  String get repeaterDetailRecentActivity => 'Nedavna aktivnost';

  @override
  String get reportIssueTitle => 'Prijava';

  @override
  String get reportIssueHeadline => 'Pomozite nam da podaci budu tačni';

  @override
  String get reportIssueDescription =>
      'Da li ste pronašli nešto pogrešno ili što nedostaje u ovom repetitoru? Javite nam šta treba promeniti i mi ćemo proveriti.';

  @override
  String get reportIssueWhatToCorrect =>
      'Šta biste želeli da ispravite ili dodate?';

  @override
  String get reportIssuePlaceholder =>
      'Npr. CTCSS ton je promenjen na 88.5Hz, ili je lokacija malo severnije, upravnik je...';

  @override
  String get reportIssueVerifiedTitle => 'Verifikovane prijave';

  @override
  String get reportIssueVerifiedDescription =>
      'Vašu prijavu će pregledati regionalni koordinator pre ažuriranja javne baze podataka. Hvala na doprinosu zajednici.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Potvrđujem da su ove informacije tačne na osnovu mog zapažanja.';

  @override
  String get reportIssueSubmit => 'Pošalji';

  @override
  String get reportIssueMinChars => 'Potrebno je najmanje 10 karaktera';

  @override
  String get reportIssueMaxChars => 'Najviše 2000 karaktera';

  @override
  String get reportIssueSuccess => 'Prijava uspešno poslata';

  @override
  String get reportIssueError => 'Greška prilikom slanja prijave';

  @override
  String get registrationPromptTitle => 'Otključajte pun potencijal';

  @override
  String get registrationPromptDescription =>
      'Pridružite se zajednici radioamatera i podignite svoje iskustvo na viši nivo.';

  @override
  String get registrationBenefitInteractTitle => 'Interakcija';

  @override
  String get registrationBenefitInteractDescription =>
      'Ocenjujte repetitore i ostavljajte komentare za druge.';

  @override
  String get registrationBenefitFavoritesTitle => 'Omiljeni';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Sačuvajte najčešće korišćene frekvencije i repetitore.';

  @override
  String get registrationBenefitLogbookTitle => 'Dnevnik';

  @override
  String get registrationBenefitLogbookDescription =>
      'Pratite svoje QSO-ove i vodite ličnu istoriju.';

  @override
  String get registrationSignInApple => 'Prijava putem Apple-a';

  @override
  String get registrationSignInGoogle => 'Prijava putem Google-a';

  @override
  String get registrationPromptFooter =>
      'Besplatna registracija. Licenca nije potrebna za pregledanje javnih podataka.';

  @override
  String get postLoginOnboardingWelcome => 'Dobrodošli u';

  @override
  String get postLoginOnboardingQuestion =>
      'Da li ste licencirani radioamater?';

  @override
  String get postLoginOnboardingHelpText =>
      'Ovo nam pomaže da prilagodimo vaše iskustvo i prikažemo vam prave frekvencije.';

  @override
  String get postLoginOnboardingYesLicensed => 'Da, jesam';

  @override
  String get postLoginOnboardingNoListener => 'Ne, samo slušam';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identifikujte se';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Unesite svoj zvanični pozivni znak za pristup mrežnim funkcijama.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Pozivni znak';

  @override
  String get postLoginOnboardingCallsignHint => 'Npr. YU1XYZ';

  @override
  String get postLoginOnboardingComplete => 'Završi profil';

  @override
  String get postLoginOnboardingBack => 'Nazad';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Ovo možete promeniti kasnije u podešavanjima.';

  @override
  String get postLoginOnboardingSwlTitle => 'SWL pozivni znak';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Da li imate zvanični SWL pozivni znak?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'SWL pozivni znakovi pomažu u identifikaciji u globalnoj zajednici slušalaca.';

  @override
  String get postLoginOnboardingSwlYes => 'Da, imam';

  @override
  String get postLoginOnboardingSwlNo => 'Ne, nemam';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Unesite pozivni znak';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Npr. YU1-12345-SWL';

  @override
  String get timeAgoJustNow => 'upravo';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count minuta',
      few: 'pre $count minuta',
      one: 'pre 1 minut',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count sati',
      few: 'pre $count sata',
      one: 'pre 1 sat',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count dana',
      few: 'pre $count dana',
      one: 'pre 1 dan',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count nedelja',
      few: 'pre $count nedelje',
      one: 'pre 1 nedelju',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count meseci',
      few: 'pre $count meseca',
      one: 'pre 1 mesec',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pre $count godina',
      few: 'pre $count godine',
      one: 'pre 1 godinu',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Tema';

  @override
  String get profileThemeModeSystem => 'Sistemska';

  @override
  String get profileThemeModeLight => 'Svetla';

  @override
  String get profileThemeModeDark => 'Tamna';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Budite prvi koji će ostaviti povratnu informaciju o ovom repetitoru!';

  @override
  String get repeaterDetailDistanceFromYou => 'Udaljenost od vas';

  @override
  String get repeaterDistanceMapNoLocation => 'Lokacija nije dostupna';

  @override
  String get repeaterDetailNever => 'Nikad';

  @override
  String get repeaterDetailInfo => 'Informacije';

  @override
  String get repeaterDetailSource => 'Izvor';

  @override
  String get repeaterDetailManager => 'Upravnik';

  @override
  String get repeaterDetailSuggestManager =>
      'Znate ko je upravnik repetitora? Prijavite!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Mapa povratnih informacija';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Pogledajte gde su zabeležena sviđanja i prijave';

  @override
  String get repeaterDetailAltimetricProfile => 'Visinsko profil';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Pogledajte profil terena između vas i repetitora';

  @override
  String get repeaterDetailLosClear =>
      'Čista optička vidljivost između vas i repetitora';

  @override
  String get repeaterDetailLosObstructed =>
      'Optička vidljivost prekinuta terenom';

  @override
  String get repeaterDetailTerrainProfile => 'Profil terena';

  @override
  String get repeaterDetailLineOfSight => 'Optička vidljivost';

  @override
  String get repeaterDetailTotalDistance => 'Udaljenost';

  @override
  String get repeaterDetailRepeaterElevation => 'Nadmorska visina repetitora';

  @override
  String get repeaterDetailYourElevation => 'Vaša nadmorska visina';

  @override
  String get repeaterDetailYou => 'Vi';

  @override
  String get repeaterDetailRepeaterLabel => 'Repetitor';

  @override
  String get repeaterDetailFunFacts => 'Da li ste znali?';

  @override
  String get repeaterDetailWavelength => 'Talasna dužina';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'Talasna dužina ovog repetitora je $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscilacija u sekundi';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Signal oscilira $value puta u sekundi';
  }

  @override
  String get repeaterDetailPropagationTime => 'Vreme prostiranja';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Vašem signalu treba $value da stigne do repetitora';
  }

  @override
  String get repeaterDetailWaveCycles => 'Talasni ciklusi u prenosu';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'Talas završi $value punih ciklusa u prenosu';
  }

  @override
  String get userReportsTitle => 'Moje prijave';

  @override
  String get userReportsFilterAll => 'Sve';

  @override
  String get userReportsFilterOpen => 'Otvorene';

  @override
  String get userReportsFilterClosed => 'Zatvorene';

  @override
  String get userReportsEmpty => 'Nema poslatih prijava';

  @override
  String get userReportsEmptyDescription =>
      'Vaše prijave repetitora će se pojaviti ovde';

  @override
  String get userReportsEmptyFiltered => 'Nema prijava sa ovim filterom';

  @override
  String get userReportsStatusPending => 'Na čekanju';

  @override
  String get userReportsStatusReviewed => 'U pregledu';

  @override
  String get userReportsStatusResolved => 'Rešeno';

  @override
  String get userReportsStatusRejected => 'Odbijeno';

  @override
  String get userReportsRetryBanner => 'Nije moguće ažurirati listu';

  @override
  String get userReportsProfileTile => 'Moje prijave';

  @override
  String get userReportsProfileTileSubtitle =>
      'Pogledajte status vaših prijava';

  @override
  String get userReportsError => 'Greška prilikom učitavanja prijava';

  @override
  String get userReportsCoordinatorResponse => 'Odgovor koordinatora';

  @override
  String get potaTitle => 'POTA spotovi';

  @override
  String get potaSearchHint => 'Pretražite po aktivatoru, parku ili režimu…';

  @override
  String get potaNoSpots => 'Trenutno nema aktivnih POTA spotova.';

  @override
  String get potaLoadError => 'Nije moguće učitati POTA spotove';

  @override
  String get potaRetry => 'Pokušaj ponovo';

  @override
  String get potaViewAll => 'Prikaži sve';

  @override
  String get potaActivator => 'Aktivator';

  @override
  String get potaFrequency => 'Frekvencija';

  @override
  String get potaMode => 'Režim';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Referenca';

  @override
  String get potaSpotter => 'Spotovao';

  @override
  String get potaComments => 'Komentari';

  @override
  String get potaLastSpotted => 'Poslednji spot';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Nije moguće otvoriti QRZ.com';

  @override
  String get potaParkWebsite => 'Veb stranica parka';

  @override
  String get potaParkType => 'Tip parka';

  @override
  String get potaLocation => 'Lokacija';

  @override
  String get potaCountry => 'Država';

  @override
  String get potaFirstActivation => 'Prva aktivacija';

  @override
  String get potaBand => 'Opseg';

  @override
  String potaDistanceAway(String distance) {
    return '$distance udaljenosti';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count aktivnih spotova';
  }

  @override
  String get potaFilterAll => 'Sve';

  @override
  String get potaFilterBand => 'Opseg';

  @override
  String get potaFilterMode => 'Režim';

  @override
  String get potaSortByTime => 'Najnoviji';

  @override
  String get potaSortByDistance => 'Najbliži';

  @override
  String get profileLanguage => 'Jezik';

  @override
  String get profileLanguageSystem => 'Sistemski';

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
  String get onboardingSkip => 'Preskoči';

  @override
  String get onboardingGetStarted => 'Započni';

  @override
  String get onboardingNext => 'Dalje';

  @override
  String get onboardingWelcomeTitle1 => 'Pronađite repetitore u blizini';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Otkrijte aktivne repetitore u vašem području, sa frekvencijama, tonovima i tehničkim detaljima.';

  @override
  String get onboardingWelcomeCredits => 'Podaci o repetitorima od IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtrirajte po režimu';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analogni, DMR, C4FM, D-STAR — pronađite pravi repetitor za vas odmah.';

  @override
  String get onboardingWelcomeTitle3 => 'POTA spotovi u realnom vremenu';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Pratite Parks on the Air aktivacije sa ažuriranjima uživo, filterima opsega i udaljenosti.';

  @override
  String get onboardingWelcomeTitle4 => 'Sačuvajte omiljene';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Držite najčešće korišćene repetitore pri ruci za brzi pristup.';

  @override
  String get onboardingLocationTitle => 'Lokacija';

  @override
  String get onboardingLocationSubtitle =>
      'Koristimo vašu lokaciju da bismo vam prikazali obližnje repetitore i POTA aktivacije.';

  @override
  String get onboardingLocationEnable => 'Omogući lokaciju';

  @override
  String get onboardingLocationSkip => 'Ne sada';

  @override
  String get onboardingDiscoveryTitle => 'Vaš prvi repetitor';

  @override
  String get onboardingDiscoverySubtitle => 'Evo šta je u vašoj blizini!';

  @override
  String get onboardingDiscoveryViewDetails => 'Prikaži detalje';

  @override
  String get onboardingDiscoveryViewSpot => 'Prikaži spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Istraži mapu';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Istražite mapu da pronađete repetitore i POTA aktivacije';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Obližnji repetitor';

  @override
  String get onboardingDiscoveryLivePota => 'POTA spot uživo';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'Nema pronađenih repetitora u blizini';

  @override
  String get onboardingTelegramTitle => 'Pridružite se zajednici';

  @override
  String get onboardingTelegramSubtitle =>
      'Pridružite se HamQRG Telegram grupi za ažuriranja, prijavu repetitora i upoznavanje drugih radioamatera.';

  @override
  String get onboardingTelegramJoin => 'Pridruži se Telegram grupi';

  @override
  String get onboardingTelegramLater => 'Možda kasnije';

  @override
  String get onboardingTelegramAlreadyMember => 'Već sam član';

  @override
  String get addRepeaterProfileTile => 'Predloži novi repetitor';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Prijavite repetitor koji još nije u listi';

  @override
  String get addRepeaterTitle => 'Novi repetitor';

  @override
  String get addRepeaterHeadline => 'Prijavite repetitor koji nedostaje';

  @override
  String get addRepeaterDescription =>
      'Popunite detalje o repetitoru koji želite da dodate. Prijava će biti pregledana pre objavljivanja.';

  @override
  String get addRepeaterSectionRepeater => 'Podaci o repetitoru';

  @override
  String get addRepeaterSectionAccesses => 'Pristupi';

  @override
  String get addRepeaterSectionLocation => 'Lokacija';

  @override
  String get addRepeaterSectionNotes => 'Napomene';

  @override
  String get addRepeaterName => 'Naziv';

  @override
  String get addRepeaterNameHint => 'Npr. Avala';

  @override
  String get addRepeaterCallsign => 'Pozivni znak';

  @override
  String get addRepeaterCallsignHint => 'Npr. YU1EXY';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Unesite bar naziv ili pozivni znak';

  @override
  String get addRepeaterFrequency => 'Frekvencija (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Npr. 145.000 ili 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frekvencija je obavezna';

  @override
  String get addRepeaterFrequencyInvalid => 'Neispravna frekvencija';

  @override
  String get addRepeaterShift => 'Pomak (MHz)';

  @override
  String get addRepeaterShiftHint => 'Npr. -0.600 ili -0,600';

  @override
  String get addRepeaterRegion => 'Region';

  @override
  String get addRepeaterRegionHint => 'Npr. Vojvodina';

  @override
  String get addRepeaterProvinceCode => 'Okrug';

  @override
  String get addRepeaterProvinceCodeHint => 'Npr. BG';

  @override
  String get addRepeaterLocality => 'Mesto';

  @override
  String get addRepeaterLocalityHint => 'Npr. Beograd';

  @override
  String get addRepeaterLatitude => 'Geografska širina';

  @override
  String get addRepeaterLatitudeHint => 'Npr. 44.7866';

  @override
  String get addRepeaterLongitude => 'Geografska dužina';

  @override
  String get addRepeaterLongitudeHint => 'Npr. 20.4489';

  @override
  String get addRepeaterLocator => 'Lokator';

  @override
  String get addRepeaterLocatorHint => 'Npr. KN04HS';

  @override
  String get addRepeaterNotes => 'Dodatne napomene';

  @override
  String get addRepeaterNotesHint => 'Dodatne informacije o repetitoru...';

  @override
  String get addRepeaterAddAccess => 'Dodaj pristup';

  @override
  String get addRepeaterRemoveAccess => 'Ukloni';

  @override
  String get addRepeaterAccessMode => 'Režim';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Npr. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Npr. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'DCS kod';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Npr. 23';

  @override
  String get addRepeaterAccessColorCode => 'Color Code';

  @override
  String get addRepeaterAccessColorCodeHint => 'Npr. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Talkgroup';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Npr. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Npr. 0';

  @override
  String get addRepeaterAccessNodeId => 'Node ID';

  @override
  String get addRepeaterAccessNodeIdHint => 'Npr. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Naziv mreže';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Npr. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Napomene o pristupu';

  @override
  String get addRepeaterAccessNotesHint =>
      'Napomene specifične za ovaj pristup...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Potvrđujem da su ove informacije tačne prema mom saznanju.';

  @override
  String get addRepeaterVerifiedTitle => 'Verifikovana prijava';

  @override
  String get addRepeaterVerifiedDescription =>
      'Vašu prijavu će pregledati tim pre objavljivanja u bazi podataka.';

  @override
  String get addRepeaterSubmit => 'Pošalji';

  @override
  String get addRepeaterSuccess => 'Prijava uspešno poslata!';

  @override
  String get addRepeaterError => 'Greška prilikom slanja prijave';

  @override
  String get addRepeaterAtLeastOneAccess => 'Dodajte bar jedan pristup';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Pristup $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'POTA spotovi u realnom vremenu sa mapom i detaljima parka';

  @override
  String get changelog1017SubmitRepeater =>
      'Predložite novi repetitor direktno iz aplikacije';

  @override
  String get changelog1017MultiLanguage =>
      'Aplikacija dostupna na engleskom, španskom i francuskom';

  @override
  String get changelog1017Onboarding => 'Novo iskustvo prvog pokretanja';

  @override
  String get changelog1017ReportAnonymous =>
      'Prijave dostupne bez registracije';

  @override
  String get changelogTitle => 'Šta je novo';

  @override
  String get changelogSubtitle => 'Evo šta je novo u ovoj verziji';

  @override
  String get changelogCategoryAdded => 'Novo';

  @override
  String get changelogCategoryImproved => 'Poboljšano';

  @override
  String get changelogCategoryFixed => 'Ispravljeno';

  @override
  String get changelogDismiss => 'Razumem!';

  @override
  String get spotCreateTitle => 'Spottuj sebe';

  @override
  String get spotCreateOtherTitle => 'Spottuj OM-a';

  @override
  String get spotCreateDuration => 'Trajanje';

  @override
  String get spotCreateAccess => 'Režim (opciono)';

  @override
  String get spotCreateCallsign => 'Pozivni znak čutog OM-a';

  @override
  String get spotCreateCallsignHint => 'Npr. YU1ABC';

  @override
  String get spotCreateConfirm => 'Potvrdi';

  @override
  String get spotCreateSuccessSelf => 'Spot kreiran!';

  @override
  String get spotCreateSuccessOther => 'OM spottovan!';

  @override
  String get spotActiveYou => 'Spottovani ste';

  @override
  String get spotActiveClose => 'Zatvori spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'na $repeaterName';
  }

  @override
  String get spotActiveNone => 'Trenutno niko nije spottovan';

  @override
  String get spotActiveCta => 'Budite prvi!';

  @override
  String get spotActiveSection => 'Aktivni spotovi';

  @override
  String get spotHistorySection => 'Istorija spotova';

  @override
  String get spotListTitle => 'Najnoviji spotovi';

  @override
  String get spotListViewAll => 'Prikaži sve';

  @override
  String get spotListBadgeActive => 'Sluša';

  @override
  String get spotListBadgeClosed => 'Završeno';

  @override
  String get spotListBadgeReport => 'Prijavi';

  @override
  String get spotListEmpty => 'Nema spotova u poslednjih 24 sata';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Prijavio $callsign';
  }

  @override
  String get spotNotificationToggle => 'Obaveštenja klastera';

  @override
  String get spotNotificationDisabled =>
      'Obaveštenja klastera isključena u podešavanjima profila';

  @override
  String get spotNotificationPerFavorite => 'Obaveštenja o spotovima';

  @override
  String get spotPreviousClosed => 'Vaš prethodni spot više nije aktivan';

  @override
  String get spotErrorAuthRequired => 'Morate biti prijavljeni.';

  @override
  String get spotErrorCallsignRequired =>
      'Postavite pozivni znak u profilu za korišćenje klastera.';

  @override
  String get spotErrorInvalidDuration =>
      'Trajanje mora biti između 5 i 60 minuta.';

  @override
  String get spotErrorRepeaterNotFound => 'Repetitor nije pronađen.';

  @override
  String get spotErrorInvalidAccess =>
      'Nevažeći režim pristupa za ovaj repetitor.';

  @override
  String get spotErrorSpotNotFound => 'Spot nije pronađen.';

  @override
  String get spotErrorForbidden => 'Ne možete zatvoriti spot koji nije vaš.';

  @override
  String get spotErrorAlreadyClosed => 'Spot je već zatvoren.';

  @override
  String get spotErrorGeneric =>
      'Greška pri kreiranju spota. Pokušajte ponovo.';

  @override
  String get spotAccessUnavailable => '(režim više nije dostupan)';

  @override
  String spotDurationMinutes(int minutes) {
    return '$minutes min';
  }
}
