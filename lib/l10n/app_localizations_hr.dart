// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get proSectionTitle => 'Pretplata';

  @override
  String get proCardUpgradeTitle => 'Otkrij što dosežeš';

  @override
  String get proCardUpgradeSubtitle =>
      'Pokrivenost, repetitori i offline karte';

  @override
  String get proCardActiveTitle => 'HamQRG Pro aktivan';

  @override
  String get proCardActiveSubtitle => 'Hvala na podršci!';

  @override
  String proPriceFromMonth(String price) {
    return 'Od $price mjesečno · Otkaži bilo kada';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Besplatna proba, zatim $price mjesečno · Otkaži bilo kada';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price jednokratno · Zauvijek';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Od $price mjesečno · $total unaprijed · Otkaži bilo kada';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Besplatna proba, zatim $price mjesečno · $total unaprijed · Otkaži bilo kada';
  }

  @override
  String get proRestoreSuccess => 'Kupnje vraćene: HamQRG Pro je aktivan';

  @override
  String get proRestoreNone => 'Nema kupnji za vraćanje';

  @override
  String get proManageSubscription => 'Upravljaj pretplatom';

  @override
  String get proLinkAccountTitle => 'Poveži svoj račun';

  @override
  String get proLinkAccountBody =>
      'Poveži HamQRG Pro s računom kako bi ga zadržao na svim uređajima, čak i nakon ponovne instalacije.';

  @override
  String get stationsShowcaseTitle => 'Tvoje lokacije, i bez mreže';

  @override
  String get stationsShowcaseBody =>
      'Spremi dom, sklonište, mjesto aktivacije: ono što dosežeš ostaje i bez mreže.';

  @override
  String get offlineMapsUpsellTitle => 'Karta ostaje u telefonu 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Preuzmi područja koja trebaš i otvori ih ondje gdje nema signala: na grebenu, u tunelu, u inozemstvu bez podatkovnog prometa.';

  @override
  String get offlineMapsBenefitRegions => 'Sam biraš područja za preuzimanje';

  @override
  String get reachUpsellBenefitSignal => 'Predviđeni signal za svaki repetitor';

  @override
  String get reachUpsellBenefitTerrain =>
      'Profil terena između tebe i repetitora';

  @override
  String get proRestoreCta => 'Vrati kupnje';

  @override
  String get error => 'Greška';

  @override
  String get error_message => 'Došlo je do greške prilikom učitavanja';

  @override
  String get error_message_retry =>
      'Došlo je do greške prilikom učitavanja. Pokušajte ponovno kasnije';

  @override
  String get retry => 'Pokušaj ponovno';

  @override
  String get back => 'Natrag';

  @override
  String get loading => 'Učitavanje';

  @override
  String get details => 'Detalji';

  @override
  String pages_number(Object number) {
    return '$number stranica za istraživanje';
  }

  @override
  String get january => 'Siječanj';

  @override
  String get february => 'Veljača';

  @override
  String get march => 'Ožujak';

  @override
  String get april => 'Travanj';

  @override
  String get may => 'Svibanj';

  @override
  String get june => 'Lipanj';

  @override
  String get july => 'Srpanj';

  @override
  String get august => 'Kolovoz';

  @override
  String get september => 'Rujan';

  @override
  String get october => 'Listopad';

  @override
  String get november => 'Studeni';

  @override
  String get december => 'Prosinac';

  @override
  String get logout => 'Odjava';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Postavke';

  @override
  String get contact_us => 'Kontaktirajte nas';

  @override
  String get error_opening_email =>
      'Došlo je do greške prilikom otvaranja e-pošte';

  @override
  String get register_now => 'Registrirajte se odmah';

  @override
  String get tracking_permission_title => 'Podržite aplikaciju';

  @override
  String get tracking_permission_message =>
      'Kako bismo poboljšali vaše iskustvo i prikazali relevantniji sadržaj, pomozite nam da aplikacija ostane besplatna.\n\nDodirnite Dopusti da nas podržite.';

  @override
  String get tracking_permission_next => 'Dalje';

  @override
  String get skip => 'Preskoči';

  @override
  String get done => 'Gotovo';

  @override
  String get next => 'Dalje';

  @override
  String get joinCommunityTitle => 'Pridružite se našoj zajednici!';

  @override
  String get joinCommunityDescription =>
      'Otkrijte prednosti pridruživanja Telegram zajednici:';

  @override
  String get benefitSupportMembers => 'Podrška članova';

  @override
  String get benefitSuggestFeatures => 'Predlaganje novih značajki';

  @override
  String get benefitContactDevelopers => 'Kontakt s programerima';

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
  String get errorOpenTelegram => 'Greška pri otvaranju Telegrama';

  @override
  String get disclaimerTitle => 'Izvor podataka';

  @override
  String get disclaimerDescription =>
      'Podaci o repetitorima u ovoj aplikaciji dolaze od IZ8WNH.\n\nZa dodatne informacije, preuzimanje CSV datoteka za programiranje radijskih uređaja ili za podatke koji nisu dostupni u ovoj aplikaciji, posjetite službenu stranicu.';

  @override
  String get disclaimerVisitSite => 'Posjetite iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Razumijem';

  @override
  String get errorOpenDisclaimerSite => 'Greška pri otvaranju web stranice';

  @override
  String get repeatersMapTitle => 'Karta repetitora';

  @override
  String get repeatersListTitle => 'Popis repetitora';

  @override
  String get repeatersMapLoading => 'Učitavanje karte repetitora…';

  @override
  String get repeatersMapGenericError => 'Nije moguće učitati repetitore.';

  @override
  String get repeatersMapEmpty => 'Nema pronađenih repetitora u vašoj blizini.';

  @override
  String get repeatersSearchHint =>
      'Pretraži po imenu, pozivnom znaku ili frekvenciji MHz…';

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
  String get repeatersMapRetry => 'Pokušaj ponovno';

  @override
  String get repeatersMapOpenSettings => 'Otvori postavke';

  @override
  String get repeatersMapPermissionMessage =>
      'Dopustite pristup lokaciji za prikaz repetitora u vašoj blizini.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Dozvola za lokaciju je trajno odbijena. Omogućite je u postavkama sustava.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Omogućite lokacijske usluge za pronalaženje obližnjih repetitora.';

  @override
  String repeatersMapFound(int count) {
    return '$count pronađenih repetitora';
  }

  @override
  String get repeaterMode => 'Način rada';

  @override
  String get repeaterModeAnalog => 'Analogni';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Svi načini';

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
  String get repeaterViewFullDetails => 'Pogledaj sve detalje';

  @override
  String get repeatersMapReturnToLocation => 'Povratak na moju lokaciju';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count repetitora na ovoj lokaciji';
  }

  @override
  String get profileUnlockFeatures => 'Otključajte sve značajke';

  @override
  String get profileUnlockFeaturesDescription =>
      'Registrirajte se za korištenje recenzija, spremanje favorita i pristup detaljnoj statistici.';

  @override
  String get profileSignUpOrLogin => 'Registracija ili prijava';

  @override
  String get profileErrorOpeningEmail => 'Greška pri otvaranju e-pošte';

  @override
  String get profileJoinTelegramCommunity => 'Pridružite se Telegram zajednici';

  @override
  String get profileWelcomeTitle => 'Dobrodošli u HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Pridružite se našoj zajednici radioamatera u Italiji.';

  @override
  String get profileEditProfile => 'Uredi profil';

  @override
  String get profileChangePhoto => 'Promijeni fotografiju';

  @override
  String get profileFirstName => 'Ime';

  @override
  String get profileLastName => 'Prezime';

  @override
  String get profileCallsign => 'Pozivni znak';

  @override
  String get profileRestartIdentificationTitle =>
      'Trebate promijeniti status? Možete ponovno pokrenuti postupak identifikacije za prebacivanje s licenciranog operatora na SWL slušatelja.';

  @override
  String get profileRestartIdentificationButton =>
      'Ponovno pokreni postupak identifikacije';

  @override
  String get profileSaveChanges => 'Spremi promjene';

  @override
  String get profileDangerZone => 'Opasna zona';

  @override
  String get profileDeleteAccount => 'Obriši račun';

  @override
  String get profileDeleteAccountConfirmTitle => 'Obriši račun';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Jeste li sigurni da želite obrisati svoj račun? Ova radnja je nepovratna.';

  @override
  String get profileDeleteAccountCancel => 'Odustani';

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
  String get authJoinTitle => 'Pridružite se HamQRG-u';

  @override
  String get authUnlockFeatures =>
      'Prijavite se za otključavanje svih značajki!';

  @override
  String get authWhatYouGet => 'Što dobivate:';

  @override
  String get authBenefitStatsTitle => 'Detaljna statistika';

  @override
  String get authBenefitStatsDescription =>
      'Pratite svoj napredak i poboljšajte se';

  @override
  String get authBenefitQuizTitle => 'Različiti načini kviza';

  @override
  String get authBenefitQuizDescription =>
      'Vježbajte u maratonskom, tematskom i drugim načinima.';

  @override
  String get authBenefitSyncTitle => 'Sinkronizacija';

  @override
  String get authBenefitSyncDescription => 'Pristupite s bilo kojeg uređaja';

  @override
  String get authOrSignInWithEmail => 'Ili se prijavite putem e-pošte';

  @override
  String get authEnterEmail => 'Unesite e-poštu';

  @override
  String get authEnterPassword => 'Unesite lozinku';

  @override
  String get authForgotPassword => 'Zaboravljena lozinka?';

  @override
  String get authSignIn => 'Prijava';

  @override
  String get authSignUp => 'Registracija';

  @override
  String get authPasswordLengthError => 'Lozinka mora biti duža';

  @override
  String get authDontHaveAccount => 'Nemate račun? Registrirajte se';

  @override
  String get authHaveAccount => 'Već imate račun? Prijavite se';

  @override
  String get authBackToSignIn => 'Natrag na prijavu';

  @override
  String get authUnexpectedError => 'Greška autentikacije: ';

  @override
  String get authValidEmailError => 'Unesite valjanu e-poštu';

  @override
  String get authSendPasswordReset => 'Pošalji resetiranje lozinke';

  @override
  String get authPasswordResetSent => 'Resetiranje lozinke poslano';

  @override
  String get authVerifyEmailMessage =>
      'Potvrdite svoju e-poštu za dovršetak registracije, provjerite pristiglu poštu.';

  @override
  String get authInvalidCredentials => 'Nevažeća e-pošta ili lozinka';

  @override
  String get authEmailNotConfirmed => 'Potvrdite svoju e-poštu za prijavu';

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
  String get commonAppTagline => 'Otkrijte repetitore u svojoj blizini';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Brzi pristup';

  @override
  String get homeRepeaterList => 'Popis repetitora';

  @override
  String get homeMyFavorites => 'Moji favoriti';

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
    return '$count postaja';
  }

  @override
  String homeSaved(int count) {
    return '$count spremljenih';
  }

  @override
  String get homeActive => 'Aktivno';

  @override
  String get homeIdle => 'Neaktivno';

  @override
  String get homeNavHome => 'Početna';

  @override
  String get homeNavList => 'Popis';

  @override
  String get homeNavFavorites => 'Favoriti';

  @override
  String get homeNavMap => 'Karta';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Moji favoriti';

  @override
  String get favoritesSearchHint => 'Pretraži spremljene repetitore...';

  @override
  String get favoritesFilterAllSaved => 'Svi spremljeni';

  @override
  String get favoritesEmpty => 'Nema spremljenih repetitora';

  @override
  String get favoritesEmptyDescription =>
      'Dodajte repetitore u favorite da ih vidite ovdje';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Prikazano $showing od $total omiljenih postaja';
  }

  @override
  String get favoritesRemove => 'Ukloni iz favorita';

  @override
  String get favoritesAdd => 'Dodaj u favorite';

  @override
  String get repeaterDetailSave => 'Spremi';

  @override
  String get repeaterDetailShare => 'Podijeli';

  @override
  String get repeaterDetailReport => 'Prijavi';

  @override
  String get repeaterDetailTotalLikes => 'Ukupno sviđanja';

  @override
  String get repeaterDetailReports1Yr => 'Prijave (1 godina)';

  @override
  String get repeaterDetailHealthScore => 'Ocjena stanja';

  @override
  String get repeaterDetailExcellent => 'Izvrsno';

  @override
  String get repeaterDetailGood => 'Dobro';

  @override
  String get repeaterDetailFair => 'Zadovoljavajuće';

  @override
  String get repeaterDetailToVerify => 'Za provjeru';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Ocjena izračunata na temelju $count negativnih prijava u posljednjih godinu dana';
  }

  @override
  String get repeaterDetailLastLike => 'Zadnje sviđanje';

  @override
  String get repeaterDetailLastDownReport => 'Zadnja negativna prijava';

  @override
  String get repeaterDetailTechnicalData => 'Tehnički podaci';

  @override
  String get repeaterDetailFrequency => 'Frekvencija';

  @override
  String get repeaterDetailShift => 'Pomak';

  @override
  String get repeaterDetailSubtone => 'Subton (SQL)';

  @override
  String get repeaterDetailMode => 'Način rada';

  @override
  String get repeaterDetailLocation => 'Lokacija';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance daleko';
  }

  @override
  String get repeaterDetailCommunityReports => 'Prijave zajednice';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Ažurirajte status i povratne informacije';

  @override
  String get repeaterDetailEquipment => 'Oprema';

  @override
  String get repeaterDetailEquipmentRequired => 'Oprema *';

  @override
  String get repeaterDetailAccessModes => 'Načini pristupa';

  @override
  String get repeaterDetailNetwork => 'Mreža';

  @override
  String get repeaterDetailLocationField => 'Lokacija';

  @override
  String get repeaterDetailLocationRequired => 'Lokacija *';

  @override
  String get repeaterDetailComment => 'Komentar';

  @override
  String get repeaterDetailCommentOptional => 'Komentar (neobavezno)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Kvaliteta signala, audio izvještaj ili opći komentari...';

  @override
  String get repeaterDetailReportDown => 'Prijavi problem';

  @override
  String get repeaterDetailCheckinLike => 'Prijava i sviđanje';

  @override
  String get repeaterDetailYourFeedback => 'Vaše povratne informacije';

  @override
  String get repeaterDetailPostedJustNow => 'Upravo objavljeno';

  @override
  String get repeaterDetailDeleteEntry => 'Obriši unos';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Pogledaj svih $count prijava';
  }

  @override
  String get repeaterDetailStationPortable => 'Prijenosna';

  @override
  String get repeaterDetailStationMobile => 'Mobilna';

  @override
  String get repeaterDetailStationFixed => 'Fiksna';

  @override
  String get repeaterDetailLike => 'Sviđa mi se';

  @override
  String get repeaterDetailReportLabel => 'Prijava';

  @override
  String get repeaterDetailSaved => 'Spremljeno';

  @override
  String get repeaterDetailShareMessage =>
      'Pogledajte ovaj repetitor na HamQRG-u!';

  @override
  String get repeaterDetailReportDescription =>
      'Značajka prijave uskoro će biti dostupna. Moći ćete prijaviti netočne informacije ili probleme s ovim repetitorom.';

  @override
  String get commonClose => 'Zatvori';

  @override
  String get favorite => 'Favorit';

  @override
  String get accessConfiguration => 'Konfiguracija pristupa';

  @override
  String get noAccessConfiguration => 'Nema dostupne konfiguracije';

  @override
  String get repeaterDetailAddFeedback => 'Dodaj povratnu informaciju';

  @override
  String get repeaterDetailOthersReports => 'Prijave drugih korisnika';

  @override
  String get repeaterDetailRemove => 'Ukloni';

  @override
  String get repeaterDetailSelectAccess => 'Odaberi pristup';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Morate biti unutar $distance od repetitora za slanje povratne informacije.';
  }

  @override
  String get repeaterDetailInteractive => 'Interaktivno';

  @override
  String get repeaterDetailLogYourSignal => 'Zabilježi svoj signal';

  @override
  String get repeaterDetailUsedEquipment => 'Korištena oprema';

  @override
  String get repeaterDetailYourLocation => 'Vaša lokacija';

  @override
  String get repeaterDetailLocationPlaceholder =>
      'Gdje ste bili? (npr. Zagreb)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Odaberite mjesto iz prijedloga';

  @override
  String get feedbackDistanceConfirmTitle => 'Potvrdite slanje';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Odabrana lokacija je $distance od repetitora. Potvrđujete li da želite poslati ovu povratnu informaciju pod vlastitom odgovornošću?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Potvrdi';

  @override
  String get feedbackDistanceConfirmCancel => 'Odustani';

  @override
  String get repeaterDetailSelectAccessInstance => 'Odaberi instancu pristupa';

  @override
  String get repeaterDetailSignalObservations => 'Zapažanja o signalu';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Kakva je bila kvaliteta zvuka?';

  @override
  String get repeaterDetailSendLike => 'Pošalji sviđanje';

  @override
  String get repeaterDetailReportIssue => 'Prijavi problem';

  @override
  String get repeaterDetailRecentActivity => 'Nedavna aktivnost';

  @override
  String get reportIssueTitle => 'Prijava';

  @override
  String get reportIssueHeadline => 'Pomozite nam da podaci budu točni';

  @override
  String get reportIssueDescription =>
      'Pronašli ste nešto netočno ili što nedostaje kod ovog repetitora? Javite nam što treba promijeniti i mi ćemo to provjeriti.';

  @override
  String get reportIssueWhatToCorrect =>
      'Što biste željeli ispraviti ili dodati?';

  @override
  String get reportIssuePlaceholder =>
      'Npr. CTCSS ton je promijenjen na 88.5Hz, ili je lokacija malo sjevernije, upravitelj je...';

  @override
  String get reportIssueVerifiedTitle => 'Provjerene prijave';

  @override
  String get reportIssueVerifiedDescription =>
      'Vašu prijavu će pregledati regionalni koordinator prije ažuriranja javne baze podataka. Hvala vam na doprinosu zajednici.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Potvrđujem da su ove informacije točne na temelju mog zapažanja.';

  @override
  String get reportIssueSubmit => 'Pošalji';

  @override
  String get reportIssueMinChars => 'Potrebno najmanje 10 znakova';

  @override
  String get reportIssueMaxChars => 'Najviše 2000 znakova';

  @override
  String get reportIssueSuccess => 'Prijava uspješno poslana';

  @override
  String get reportIssueError => 'Greška pri slanju prijave';

  @override
  String get registrationPromptTitle => 'Otključajte puni potencijal';

  @override
  String get registrationPromptDescription =>
      'Pridružite se zajednici radioamatera i podignite svoje iskustvo na višu razinu.';

  @override
  String get registrationBenefitInteractTitle => 'Interakcija';

  @override
  String get registrationBenefitInteractDescription =>
      'Ocijenite repetitore i ostavite komentare za druge.';

  @override
  String get registrationBenefitFavoritesTitle => 'Favoriti';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Spremite najčešće korištene frekvencije i repetitore.';

  @override
  String get registrationBenefitLogbookTitle => 'Dnevnik';

  @override
  String get registrationBenefitLogbookDescription =>
      'Pratite svoje QSO-ove i vodite osobnu povijest.';

  @override
  String get registrationSignInApple => 'Prijava s Apple';

  @override
  String get registrationSignInGoogle => 'Prijava s Google';

  @override
  String get registrationPromptFooter =>
      'Besplatna registracija. Za pregledavanje javnih podataka nije potrebna dozvola.';

  @override
  String get postLoginOnboardingWelcome => 'Dobrodošli u';

  @override
  String get postLoginOnboardingQuestion => 'Jeste li licencirani radioamater?';

  @override
  String get postLoginOnboardingHelpText =>
      'Ovo nam pomaže prilagoditi vaše iskustvo i prikazati vam prave frekvencije.';

  @override
  String get postLoginOnboardingYesLicensed => 'Da, jesam';

  @override
  String get postLoginOnboardingNoListener => 'Ne, samo sam slušatelj';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identificirajte se';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Unesite svoj službeni pozivni znak za pristup mrežnim značajkama.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Pozivni znak';

  @override
  String get postLoginOnboardingCallsignHint => 'Npr. 9A2XYZ';

  @override
  String get postLoginOnboardingComplete => 'Dovrši profil';

  @override
  String get postLoginOnboardingBack => 'Natrag';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Ovo možete promijeniti kasnije u postavkama.';

  @override
  String get postLoginOnboardingSwlTitle => 'SWL pozivni znak';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Imate li službeni SWL pozivni znak?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'SWL pozivni znakovi pomažu u identifikaciji unutar globalne zajednice slušatelja.';

  @override
  String get postLoginOnboardingSwlYes => 'Da, imam';

  @override
  String get postLoginOnboardingSwlNo => 'Ne, nemam';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Unesite pozivni znak';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Npr. 9A-12345-SWL';

  @override
  String get timeAgoJustNow => 'upravo sada';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count minuta',
      few: 'prije $count minute',
      one: 'prije 1 minutu',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count sati',
      few: 'prije $count sata',
      one: 'prije 1 sat',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count dana',
      few: 'prije $count dana',
      one: 'prije 1 dan',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count tjedana',
      few: 'prije $count tjedna',
      one: 'prije 1 tjedan',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count mjeseci',
      few: 'prije $count mjeseca',
      one: 'prije 1 mjesec',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prije $count godina',
      few: 'prije $count godine',
      one: 'prije 1 godinu',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Tema';

  @override
  String get profileThemeModeSystem => 'Sustav';

  @override
  String get profileThemeModeLight => 'Svijetla';

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
  String get repeaterDetailManager => 'Upravitelj';

  @override
  String get repeaterDetailSuggestManager =>
      'Znate li upravitelja repetitora? Prijavite to!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Karta povratnih informacija';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Pogledajte gdje su zabilježena sviđanja i prijave';

  @override
  String get repeaterDetailAltimetricProfile => 'Visinomjerni profil';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Pogledajte profil terena između vas i repetitora';

  @override
  String get repeaterCoverageTitle => 'Pokrivenost';

  @override
  String get repeaterCoverageCardTitle => 'Karta pokrivenosti';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Procjenjuje signal repetitora na području';

  @override
  String get repeaterCoverageLoading => 'Izračun pokrivenosti…';

  @override
  String get repeaterCoverageError => 'Pokrivenost nije moguće izračunati';

  @override
  String get repeaterCoverageRetry => 'Pokušaj ponovno';

  @override
  String get repeaterCoverageLegendTitle => 'Procijenjeni signal (dBm)';

  @override
  String get repeaterCoverageCta => 'Prikaži pokrivenost';

  @override
  String get repeaterDetailLosClear =>
      'Čista optička vidljivost između vas i repetitora';

  @override
  String get repeaterDetailLosObstructed =>
      'Optička vidljivost blokirana terenom';

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
  String get repeaterDetailFunFacts => 'Jeste li znali?';

  @override
  String get repeaterDetailWavelength => 'Valna duljina';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'Valna duljina ovog repetitora je $value';
  }

  @override
  String get repeaterDetailOscillations => 'Oscilacija u sekundi';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Signal oscilira $value puta u sekundi';
  }

  @override
  String get repeaterDetailPropagationTime => 'Vrijeme propagacije';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Vašem signalu treba $value da dođe do repetitora';
  }

  @override
  String get repeaterDetailWaveCycles => 'Ciklusi vala u prijenosu';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'Val završava $value punih ciklusa u prijenosu';
  }

  @override
  String get userReportsTitle => 'Moje aktivnosti';

  @override
  String get userReportsTabReports => 'Prijave';

  @override
  String get userReportsTabSubmissions => 'Novi repetitori';

  @override
  String get userReportsFilterAll => 'Sve';

  @override
  String get userReportsFilterOpen => 'Otvorene';

  @override
  String get userReportsFilterClosed => 'Zatvorene';

  @override
  String get userReportsEmpty => 'Nema poslanih prijava';

  @override
  String get userReportsEmptyDescription =>
      'Vaše prijave repetitora pojavit će se ovdje';

  @override
  String get userReportsEmptyFiltered => 'Nema prijava s ovim filtrom';

  @override
  String get userReportsStatusPending => 'Na čekanju';

  @override
  String get userReportsStatusReviewed => 'U pregledu';

  @override
  String get userReportsStatusResolved => 'Riješeno';

  @override
  String get userReportsStatusRejected => 'Odbijeno';

  @override
  String get userReportsRetryBanner => 'Nije moguće ažurirati popis';

  @override
  String get userReportsProfileTile => 'Moje prijave';

  @override
  String get userReportsProfileTileSubtitle =>
      'Pogledajte status svojih prijava';

  @override
  String get userReportsError => 'Greška pri učitavanju prijava';

  @override
  String get userReportsCoordinatorResponse => 'Odgovor koordinatora';

  @override
  String get userSubmissionsEmpty => 'Nema predloženih repetitora';

  @override
  String get userSubmissionsEmptyDescription =>
      'Predloženi repetitori će se prikazati ovdje';

  @override
  String get userSubmissionsEmptyFiltered => 'Nema repetitora s ovim filtrom';

  @override
  String get userSubmissionsStatusPending => 'Na čekanju';

  @override
  String get userSubmissionsStatusApproved => 'Odobreno';

  @override
  String get userSubmissionsStatusRejected => 'Odbijeno';

  @override
  String get userSubmissionsCoordinatorResponse => 'Odgovor koordinatora';

  @override
  String get userSubmissionsFrequency => 'Frekvencija';

  @override
  String get potaTitle => 'POTA spotovi';

  @override
  String get potaSearchHint => 'Pretraži po aktivatoru, parku ili načinu rada…';

  @override
  String get potaNoSpots => 'Trenutno nema aktivnih POTA spotova.';

  @override
  String get potaLoadError => 'Nije moguće učitati POTA spotove';

  @override
  String get potaRetry => 'Pokušaj ponovno';

  @override
  String get potaViewAll => 'Prikaži sve';

  @override
  String get potaActivator => 'Aktivator';

  @override
  String get potaFrequency => 'Frekvencija';

  @override
  String get potaMode => 'Način rada';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Referenca';

  @override
  String get potaSpotter => 'Spottao';

  @override
  String get potaComments => 'Komentari';

  @override
  String get potaLastSpotted => 'Zadnji spot';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Nije moguće otvoriti QRZ.com';

  @override
  String get potaParkWebsite => 'Web stranica parka';

  @override
  String get potaParkType => 'Vrsta parka';

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
    return '$distance daleko';
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
  String get potaFilterMode => 'Način rada';

  @override
  String get potaSortByTime => 'Najnovije';

  @override
  String get potaSortByDistance => 'Najbliže';

  @override
  String get profileLanguage => 'Jezik';

  @override
  String get profileUnitSystem => 'Mjerne jedinice';

  @override
  String get profileUnitSystemAuto => 'Automatski';

  @override
  String get profileUnitSystemMetric => 'Metrički';

  @override
  String get profileUnitSystemImperial => 'Imperijalni';

  @override
  String get profileLanguageSystem => 'Sustav';

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
      'Otkrijte aktivne repetitore u vašem području, s frekvencijama, tonovima i tehničkim detaljima.';

  @override
  String get onboardingWelcomeCredits =>
      'Podaci o repetitorima omogućeni od IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtrirajte po načinu rada';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analogni, DMR, C4FM, D-STAR — pronađite pravi repetitor za vas odmah.';

  @override
  String get onboardingWelcomeTitle3 => 'POTA spotovi u stvarnom vremenu';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Pratite Parks on the Air aktivacije s ažuriranjima uživo, filtrima opsega i udaljenošću.';

  @override
  String get onboardingWelcomeTitle4 => 'Spremite svoje favorite';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Držite najčešće korištene repetitore pri ruci za brzi pristup.';

  @override
  String get onboardingLocationTitle => 'Lokacija';

  @override
  String get onboardingLocationSubtitle =>
      'Koristimo vašu lokaciju za prikaz obližnjih repetitora i POTA aktivacija.';

  @override
  String get onboardingLocationEnable => 'Omogući lokaciju';

  @override
  String get onboardingLocationSkip => 'Ne sada';

  @override
  String get onboardingDiscoveryTitle => 'Vaš prvi repetitor';

  @override
  String get onboardingDiscoverySubtitle => 'Evo što je u vašoj blizini!';

  @override
  String get onboardingDiscoveryViewDetails => 'Pogledaj detalje';

  @override
  String get onboardingDiscoveryViewSpot => 'Pogledaj spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Istraži kartu';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Istražite kartu za pronalaženje repetitora i POTA aktivacija';

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
      'Pridružite se HamQRG Telegram grupi za ažuriranja, prijave repetitora i upoznavanje drugih radioamatera.';

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
      'Prijavite repetitor koji još nije na popisu';

  @override
  String get addRepeaterTitle => 'Novi repetitor';

  @override
  String get addRepeaterHeadline => 'Prijavite repetitor koji nedostaje';

  @override
  String get addRepeaterDescription =>
      'Ispunite podatke o repetitoru koji želite dodati. Prijava će biti pregledana prije objave.';

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
  String get addRepeaterNameHint => 'Npr. Monte Cimone';

  @override
  String get addRepeaterCallsign => 'Pozivni znak';

  @override
  String get addRepeaterCallsignHint => 'Npr. IR4AB';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Unesite barem naziv ili pozivni znak';

  @override
  String get addRepeaterFrequency => 'Frekvencija (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Npr. 145.000 ili 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frekvencija je obavezna';

  @override
  String get addRepeaterFrequencyInvalid => 'Nevažeća frekvencija';

  @override
  String get addRepeaterShift => 'Pomak (MHz)';

  @override
  String get addRepeaterShiftHint => 'Npr. -0.600 ili -0,600';

  @override
  String get addRepeaterRegion => 'Regija';

  @override
  String get addRepeaterRegionHint => 'Npr. Emilia-Romagna';

  @override
  String get addRepeaterProvinceCode => 'Pokrajina';

  @override
  String get addRepeaterProvinceCodeHint => 'Npr. MO';

  @override
  String get addRepeaterLocality => 'Mjesto';

  @override
  String get addRepeaterLocalityHint => 'Npr. Fanano';

  @override
  String get addRepeaterLatitude => 'Zemljopisna širina';

  @override
  String get addRepeaterLatitudeHint => 'Npr. 44.2100';

  @override
  String get addRepeaterLongitude => 'Zemljopisna duljina';

  @override
  String get addRepeaterLongitudeHint => 'Npr. 10.7900';

  @override
  String get addRepeaterLocator => 'Lokator';

  @override
  String get addRepeaterLocatorHint => 'Npr. JN54QF';

  @override
  String get addRepeaterNotes => 'Dodatne napomene';

  @override
  String get addRepeaterNotesHint => 'Dodatne informacije o repetitoru...';

  @override
  String get addRepeaterAddAccess => 'Dodaj pristup';

  @override
  String get addRepeaterRemoveAccess => 'Ukloni';

  @override
  String get addRepeaterAccessMode => 'Način rada';

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
      'Potvrđujem da su ove informacije točne prema mom saznanju.';

  @override
  String get addRepeaterVerifiedTitle => 'Provjerena prijava';

  @override
  String get addRepeaterVerifiedDescription =>
      'Vašu prijavu će pregledati tim prije objave u bazi podataka.';

  @override
  String get addRepeaterSubmit => 'Pošalji';

  @override
  String get addRepeaterSuccess => 'Prijava uspješno poslana!';

  @override
  String get addRepeaterError => 'Greška pri slanju prijave';

  @override
  String get addRepeaterAtLeastOneAccess => 'Dodajte barem jedan pristup';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Pristup $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'POTA spotovi u stvarnom vremenu s kartom i detaljima parkova';

  @override
  String get changelog1017SubmitRepeater =>
      'Predložite novi repetitor izravno iz aplikacije';

  @override
  String get changelog1017MultiLanguage =>
      'Aplikacija dostupna na engleskom, španjolskom i francuskom';

  @override
  String get changelog1017Onboarding => 'Novo iskustvo prvog pokretanja';

  @override
  String get changelog1017ReportAnonymous =>
      'Prijave dostupne bez registracije';

  @override
  String get changelog1020ClusterSpots =>
      'Cluster spotovi u stvarnom vremenu: vidite tko sluša na repetitorima, s obavijestima i postavkama';

  @override
  String get changelog1020DetailTabs =>
      'Stranica repetitora s karticama Info, Cluster i Zajednica';

  @override
  String get changelog1020TabletLayout => 'Raspored optimiziran za tablete';

  @override
  String get changelog110Coverage =>
      'Karta pokrivenosti repetitora: pogledajte procijenjeni signal izravno na karti (PRO)';

  @override
  String get changelog110Reachable =>
      'Što dosežeš odavde: otkrij repetitore koje hvataš sa svoje lokacije, sa signalom i profilom terena (PRO)';

  @override
  String get changelogTitle => 'Što je novo';

  @override
  String get changelogSubtitle => 'Evo što je novo u ovoj verziji';

  @override
  String get changelogCategoryAdded => 'Novo';

  @override
  String get changelogCategoryImproved => 'Poboljšano';

  @override
  String get changelogCategoryFixed => 'Ispravljeno';

  @override
  String get changelogDismiss => 'Razumijem!';

  @override
  String get spotCreateTitle => 'Spottaj sebe';

  @override
  String get spotCreateOtherTitle => 'Spottaj OM-a';

  @override
  String get spotCreateDuration => 'Trajanje';

  @override
  String get spotCreateAccess => 'Način rada (opcionalno)';

  @override
  String get spotCreateCallsign => 'Pozivni znak čutog OM-a';

  @override
  String get spotCreateCallsignHint => 'Npr. 9A1ABC';

  @override
  String get spotCreateConfirm => 'Potvrdi';

  @override
  String get spotCreateSuccessSelf => 'Spot kreiran!';

  @override
  String get spotCreateSuccessOther => 'OM spottan!';

  @override
  String get spotActiveYou => 'Spottani ste';

  @override
  String get spotActiveClose => 'Zatvori spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'na $repeaterName';
  }

  @override
  String get spotActiveNone => 'Trenutno nitko nije spottan';

  @override
  String get spotActiveCta => 'Budite prvi!';

  @override
  String get spotActiveSection => 'Aktivni spotovi';

  @override
  String get spotHistorySection => 'Povijest spotova';

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
  String get spotListEmpty => 'Nema spotova u zadnjih 24 sata';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Prijavio $callsign';
  }

  @override
  String get spotNotificationToggle => 'Obavijesti klastera';

  @override
  String get spotNotificationDisabled =>
      'Obavijesti klastera isključene u postavkama profila';

  @override
  String get spotNotificationPerFavorite => 'Obavijesti o spotovima';

  @override
  String get spotPreviousClosed => 'Vaš prethodni spot više nije aktivan';

  @override
  String get spotErrorAuthRequired => 'Morate biti prijavljeni.';

  @override
  String get spotErrorCallsignRequired =>
      'Postavite pozivni znak u profilu za korištenje klastera.';

  @override
  String get spotErrorInvalidDuration =>
      'Trajanje mora biti između 5 i 60 minuta.';

  @override
  String get spotErrorRepeaterNotFound => 'Repetitor nije pronađen.';

  @override
  String get spotErrorInvalidAccess =>
      'Nevažeći način pristupa za ovaj repetitor.';

  @override
  String get spotErrorSpotNotFound => 'Spot nije pronađen.';

  @override
  String get spotErrorForbidden => 'Ne možete zatvoriti spot koji nije vaš.';

  @override
  String get spotErrorAlreadyClosed => 'Spot je već zatvoren.';

  @override
  String get spotErrorGeneric =>
      'Greška pri kreiranju spota. Pokušajte ponovno.';

  @override
  String get spotAccessUnavailable => '(način rada više nije dostupan)';

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
  String get spotsFiltersTitle => 'Filteri';

  @override
  String get spotsFilterBand => 'Pojas';

  @override
  String get spotsFilterMode => 'Način';

  @override
  String get spotsFilterAll => 'Sve';

  @override
  String get spotsFiltersReset => 'Obriši filtere';

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
  String get reachSheetError => 'Nije moguće izračunati dostupne repetitore.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dosežeš $count repetitora',
      few: 'Dosežeš $count repetitora',
      one: 'Dosežeš 1 repetitor',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'S tvoje lokacije, poredano po signalu';

  @override
  String get reachSheetEmpty => 'Nema dostupnih repetitora u blizini.';

  @override
  String get reachBadgeTitle => 'Dosežeš li ga odavde?';

  @override
  String get reachBadgeSubtitle =>
      'Otkrij pokriva li te ovaj repetitor i s kojim signalom';

  @override
  String get reachDiscoverCta => 'Otkrij uz PRO';

  @override
  String get reachReachable => 'Dosežeš ga';

  @override
  String get reachOutOfCoverage => 'Izvan pokrivenosti';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · dodirni za profil';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance odavde';
  }

  @override
  String get reachComputing => 'Izračun pokrivenosti…';

  @override
  String get reachRepeaterFallback => 'Repetitor';

  @override
  String get reachMapButton => 'Što dosežeš?';

  @override
  String get reachUpsellTitle => 'Što dosežeš odavde? 📡';

  @override
  String get reachUpsellBody =>
      'Vidi u stvarnom vremenu SVE repetitore koje hvataš sa svoje lokacije, s predviđenim signalom i profilom terena. Koliko ih stvarno dosežeš odakle si sada?';

  @override
  String get reachUpsellLater => 'Kasnije';

  @override
  String get linkProfileObstructed => 'Prepreka na putu (signal difrakcijom)';

  @override
  String get linkProfileClear => 'Slobodna optička vidljivost';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Profil terena i linija vidljivosti · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Otključaj uz PRO';

  @override
  String get proWelcomeTitle => 'Dobro došao u PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Otključao si kartu pokrivenosti, repetitore koje dosežeš sa svoje lokacije i sve PRO značajke. 📡';

  @override
  String get proWelcomeCta => 'Počni istraživati';

  @override
  String get commonCancel => 'Odustani';

  @override
  String get commonDelete => 'Izbriši';

  @override
  String get commonEdit => 'Uredi';

  @override
  String get commonOpenSettings => 'Otvori postavke';

  @override
  String get commonFieldRequired => 'Obavezno polje';

  @override
  String get fieldName => 'Ime';

  @override
  String get fieldAddress => 'Adresa';

  @override
  String get fieldCity => 'Grad';

  @override
  String get fieldDescription => 'Opis';

  @override
  String get fieldYear => 'Godina';

  @override
  String get fieldSelectDateHint => 'Odaberi datum';

  @override
  String get validationInvalidYear => 'Odaberi valjanu godinu';

  @override
  String get validationPasswordMinLength =>
      'Lozinka mora imati najmanje 6 znakova';

  @override
  String get permissionsMissingTitle => 'Nedostaju dopuštenja!';

  @override
  String get imageUploadError => 'Pogreška pri učitavanju slike';

  @override
  String get uploadImageLabel => 'Učitaj sliku';

  @override
  String get sourceGallery => 'Galerija';

  @override
  String get sourceCamera => 'Kamera';

  @override
  String get changePasswordTitle => 'Promijeni lozinku';

  @override
  String get fieldNewPassword => 'Nova lozinka';

  @override
  String get fieldConfirmNewPassword => 'Potvrdi novu lozinku';

  @override
  String get validationPasswordsNoMatch => 'Lozinke se ne podudaraju';

  @override
  String get passwordChangedSuccess => 'Lozinka uspješno promijenjena';

  @override
  String errorWithMessage(String message) {
    return 'Pogreška: $message';
  }

  @override
  String get updateRequiredTitle => 'Potrebno ažuriranje';

  @override
  String get updateRequiredAction => 'Ažuriraj sada';

  @override
  String get yearPickerTitle => 'Odaberi godinu';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Zajednica';

  @override
  String get updateRequiredBody =>
      'Dostupna je nova verzija aplikacije. Ažurirajte da biste je nastavili koristiti.';

  @override
  String get errorOpeningStore => 'Pogreška pri otvaranju trgovine';

  @override
  String get deleteConfirmTitle => 'Potvrdi brisanje';

  @override
  String get deleteConfirmContent => 'Jeste li sigurni da želite izbrisati?';

  @override
  String get cameraPermissionRationale =>
      'Za snimanje fotografije dopustite pristup kameri u postavkama.';

  @override
  String get coverageSearchHint => 'Potražite mjesto ili zalijepite koordinate';

  @override
  String get coverageSearchRecentTitle => 'Nedavna pretraživanja';

  @override
  String get coverageSearchNoResults => 'Nije pronađeno nijedno mjesto';

  @override
  String get coverageSearchTip =>
      'Možete zalijepiti koordinate (46.4879, 11.8123) ili dugo pritisnuti kartu';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Koordinate izvan raspona: širina ±90, dužina ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Nema veze: pretraživanje mjesta zahtijeva mrežu';

  @override
  String get coverageSearchErrorFailed =>
      'Pretraživanje nije uspjelo. Pokušajte ponovno.';

  @override
  String get coverageSearchClearPoint => 'Ukloni točku';

  @override
  String get coverageSearchPointSemantics => 'Odabrana točka pretraživanja';

  @override
  String get coverageBreadthTitle => 'Opseg pretraživanja';

  @override
  String get coverageBreadthQuick => 'Brzo';

  @override
  String get coverageBreadthMedium => 'Srednje';

  @override
  String get coverageBreadthExtended => 'Prošireno';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · najbrži odgovor';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · uravnoteženo';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · dalje, duže čekanje';
  }

  @override
  String get coverageResultSubtitle => 'S odabrane točke';

  @override
  String get coverageResultEmptyNoReachable =>
      'S ove točke nije dostupan nijedan repetitor';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'U ovom području nije zabilježen nijedan repetitor';

  @override
  String get coverageResultClearFilters => 'Ukloni filtre';

  @override
  String get coverageResultError => 'Izračun nije uspio';

  @override
  String get coverageResultComputing => 'Izračun prijema…';

  @override
  String get coverageResultCancel => 'Odustani';

  @override
  String coverageResultCount(int count) {
    return 'Dostupni repetitori: $count';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown od $total dostupnih';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    return 'Skriveno filtrima: $count';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Što dosežete s lokacije $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Svaki repetitor dostupan s te točke, s predviđenim signalom i udaljenošću — prije nego što krenete.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Bilo koja točka na planetu';

  @override
  String get coverageTeaserBenefitOffline => 'Dostupno bez mreže, na terenu';

  @override
  String get coverageTeaserBenefitSave =>
      'Spremite postaju i ponovno je pronađete';

  @override
  String get stationSaveCta => 'Spremi postaju';

  @override
  String get stationSaveTitle => 'Naziv postaje';

  @override
  String get stationRename => 'Preimenuj';

  @override
  String get stationDelete => 'Obriši';

  @override
  String get stationRefresh => 'Osvježi';

  @override
  String get stationRefreshAll => 'Osvježi sve';

  @override
  String get stationOfflineNotice => 'Podaci pohranjeni na uređaju';

  @override
  String get stationStaleNotice => 'Podaci možda nisu ažurni';

  @override
  String get stationMissingEntry => 'Podaci nisu dostupni izvan mreže';

  @override
  String get stationDuplicateTitle => 'Točka je već spremljena';

  @override
  String stationDuplicateBody(String distance) {
    return 'Unutar $distance već postoji postaja. Ažurirati je ili stvoriti zasebnu?';
  }

  @override
  String get stationDuplicateUpdate => 'Ažuriraj';

  @override
  String get stationDuplicateCreate => 'Stvori zasebnu';

  @override
  String get stationSaveFailed => 'Spremanje nije uspjelo: nedovoljno prostora';

  @override
  String get stationSavedCta => 'Lokacija spremljena';

  @override
  String get stationRemoveCta => 'Ukloni';

  @override
  String get stationRemoveTitle => 'Ukloniti lokaciju?';

  @override
  String stationRemoveBody(String name) {
    return '„$name” i njezini izvanmrežni podaci bit će izbrisani s ovog uređaja.';
  }

  @override
  String get stationRemovedSnack => 'Lokacija uklonjena';

  @override
  String get stationSaveError => 'Spremanje nije uspjelo. Pokušajte ponovno.';

  @override
  String get stationsTitle => 'Moje postaje';

  @override
  String get stationsProfileSubtitle =>
      'Točke koje si procijenio, dostupne i bez mreže';

  @override
  String get stationsEmptyTitle => 'Nema spremljenih postaja';

  @override
  String get stationsEmptyBody =>
      'Postaja je točka na karti za koju si već izračunao pokrivenost, spremljena da je pronađeš i bez mreže.';

  @override
  String get stationsEmptyStep1 =>
      'Odaberi točku na karti: dugo pritisni, potraži je po imenu ili zalijepi koordinate.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Dodirni „$action” da vidiš koje repetitore dosežeš odande.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Spremi točku: pronaći ćeš je ovdje, i na terenu bez mreže.';

  @override
  String get stationsGoToMap => 'Idi na kartu';

  @override
  String get stationsRefreshDone => 'Osvježavanje dovršeno';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Ažurirano $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Ažuriranje za $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Ažuriranje za $minutes min';
  }

  @override
  String get spotsUpdating => 'Ažuriranje…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Automatsko osvježavanje svakih $seconds sekundi';
  }

  @override
  String get spotsManualRefreshHint => 'Dodirnite za osvježavanje';

  @override
  String coverageResultScope(String km, int count) {
    return 'unutar $km · procijenjeno: $count';
  }

  @override
  String get coverageResultRecalculating => 'Ponovni izračun';

  @override
  String get offlineBannerMessage =>
      'Izvan mreže: pregledavate spremljene podatke';

  @override
  String get offlineMapsTitle => 'Izvanmrežne karte';

  @override
  String get offlineMapsEntrySubtitle => 'Preuzmite karte za upotrebu bez veze';

  @override
  String get offlineMapsEmpty =>
      'Nema preuzetih regija. Preuzmite područje da biste kartu vidjeli i bez veze.';

  @override
  String get offlineMapsAddRegion => 'Preuzmi regiju';

  @override
  String get offlineMapsRegionNameLabel => 'Naziv regije';

  @override
  String get offlineMapsRegionNameHint =>
      'Npr. Dom, Planinarski dom, SOTA aktivacija';

  @override
  String get offlineMapsRadiusLabel => 'Polumjer';

  @override
  String get offlineMapsDownload => 'Preuzmi';

  @override
  String get offlineMapsDownloadingStyle => 'Preuzimanje stila karte…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Preuzimanje karata… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Procijenjena veličina: $size';
  }

  @override
  String get offlineMapsDownloadError =>
      'Preuzimanje nije uspjelo. Pokušajte ponovno.';

  @override
  String get offlineMapsDeleteError =>
      'Brisanje nije uspjelo. Pokušajte ponovno.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Izbrisati regiju?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '„$name“ više neće biti dostupna izvan mreže.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Izbriši';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Polumjer $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Nepotpuno preuzimanje';

  @override
  String get offlineMapsResume => 'Nastavi';

  @override
  String get offlineMapsCenterInfo =>
      'Regija će biti centrirana na vašu trenutnu lokaciju.';

  @override
  String get dashboardOfflineTitle => 'Izvan mreže ste';

  @override
  String get dashboardOfflineMessage =>
      'Nema spremljenih podataka za ovo područje. Vaše spremljene lokacije i preuzete karte i dalje su dostupne.';

  @override
  String get offlineMapsCenterMine => 'Moja lokacija';

  @override
  String get offlineMapsCenterSearch => 'Pretraži mjesto';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Pretražite grad ili mjesto: regija će biti centrirana ondje.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Središte: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Izvanmrežni način: repetitori, favoriti, profil, pokrivenost i dosežnost dostupni i bez mreže (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Izvanmrežne karte: preuzmite područje gdje se nalazite ili mjesto po izboru i koristite ga bez veze (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Pretraga pokrivenosti s bilo koje točke: potražite mjesto, zalijepite koordinate ili dugo pritisnite kartu da otkrijete što dosežete odande';

  @override
  String get changelog120SavedStations =>
      'Moje postaje: spremite točke koje vas zanimaju i pregledajte ih i izvan mreže (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'SOTA i POTA spotovi osvježavaju se sami svake minute, s obojenim značkama po modu (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Bez veze aplikacija se pokreće odmah, prikazuje što je dostupno i onemogućuje radnje koje traže mrežu';

  @override
  String get changelog130ImperialUnits =>
      'Milje i stope: aplikacija sada slijedi mjerne jedinice uređaja, a sustav možete odabrati i sami u Postavkama';

  @override
  String get profileUnitSystemAutoShort => 'Auto';
}
