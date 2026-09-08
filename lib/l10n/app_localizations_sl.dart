// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get proSectionTitle => 'Naročnina';

  @override
  String get proCardUpgradeTitle => 'Odkrij, kaj dosežeš';

  @override
  String get proCardUpgradeSubtitle =>
      'Pokritost, repetitorji in zemljevidi brez povezave';

  @override
  String get proCardActiveTitle => 'HamQRG Pro aktiven';

  @override
  String get proCardActiveSubtitle => 'Hvala za podporo!';

  @override
  String proPriceFromMonth(String price) {
    return 'Od $price na mesec · Prekličeš kadar koli';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Brezplačen preizkus, nato $price na mesec · Prekličeš kadar koli';
  }

  @override
  String proPriceLifetime(String price) {
    return '$price enkratno · Za vedno';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Od $price na mesec · $total vnaprej · Prekličeš kadar koli';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Brezplačen preizkus, nato $price na mesec · $total vnaprej · Prekličeš kadar koli';
  }

  @override
  String get proRestoreSuccess => 'Nakupi obnovljeni: HamQRG Pro je aktiven';

  @override
  String get proRestoreNone => 'Ni nakupov za obnovitev';

  @override
  String get proManageSubscription => 'Upravljaj naročnino';

  @override
  String get proLinkAccountTitle => 'Poveži svoj račun';

  @override
  String get proLinkAccountBody =>
      'Poveži HamQRG Pro z računom, da ga obdržiš na vseh napravah, tudi po ponovni namestitvi.';

  @override
  String get stationsShowcaseTitle => 'Tvoja mesta, tudi brez omrežja';

  @override
  String get stationsShowcaseBody =>
      'Shrani dom, kočo, mesto aktivacije: kar dosežeš, ostane tudi brez omrežja.';

  @override
  String get offlineMapsUpsellTitle => 'Zemljevid ostane v telefonu 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Prenesi območja, ki jih potrebuješ, in jih odpri tam, kjer ni signala: na grebenu, v predoru, v tujini brez prenosa podatkov.';

  @override
  String get offlineMapsBenefitRegions => 'Sam izbereš območja za prenos';

  @override
  String get reachUpsellBenefitSignal => 'Napovedan signal za vsak repetitor';

  @override
  String get reachUpsellBenefitTerrain =>
      'Profil terena med teboj in repetitorjem';

  @override
  String get proRestoreCta => 'Obnovi nakupe';

  @override
  String get error => 'Napaka';

  @override
  String get error_message => 'Pri nalaganju je prišlo do napake';

  @override
  String get error_message_retry =>
      'Pri nalaganju je prišlo do napake. Poskusite znova pozneje';

  @override
  String get retry => 'Poskusi znova';

  @override
  String get back => 'Nazaj';

  @override
  String get loading => 'Nalaganje';

  @override
  String get details => 'Podrobnosti';

  @override
  String pages_number(Object number) {
    return '$number strani za raziskovanje';
  }

  @override
  String get january => 'Januar';

  @override
  String get february => 'Februar';

  @override
  String get march => 'Marec';

  @override
  String get april => 'April';

  @override
  String get may => 'Maj';

  @override
  String get june => 'Junij';

  @override
  String get july => 'Julij';

  @override
  String get august => 'Avgust';

  @override
  String get september => 'September';

  @override
  String get october => 'Oktober';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get logout => 'Odjava';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Nastavitve';

  @override
  String get contact_us => 'Kontaktirajte nas';

  @override
  String get error_opening_email => 'Pri odpiranju e-pošte je prišlo do napake';

  @override
  String get register_now => 'Registrirajte se zdaj';

  @override
  String get tracking_permission_title => 'Podprite aplikacijo';

  @override
  String get tracking_permission_message =>
      'Za izboljšanje vaše izkušnje in prikaz bolj ustrezne vsebine nam pomagajte ohraniti aplikacijo brezplačno.\n\nTapnite Dovoli, da nas podprete.';

  @override
  String get tracking_permission_next => 'Naprej';

  @override
  String get skip => 'Preskoči';

  @override
  String get done => 'Končano';

  @override
  String get next => 'Naprej';

  @override
  String get joinCommunityTitle => 'Pridružite se naši skupnosti!';

  @override
  String get joinCommunityDescription =>
      'Odkrijte prednosti pridružitve skupnosti na Telegramu:';

  @override
  String get benefitSupportMembers => 'Podpora članov';

  @override
  String get benefitSuggestFeatures => 'Predlagajte nove funkcije';

  @override
  String get benefitContactDevelopers => 'Stik z razvijalci';

  @override
  String get benefitExclusivePreviews =>
      'Ekskluzivni predogledi in beta različice';

  @override
  String get benefitActiveCommunity => 'Aktivna skupnost';

  @override
  String get joinNowButton => 'Pridruži se zdaj!';

  @override
  String get alreadyMemberButton => 'Že sem član';

  @override
  String get laterButton => 'Pozneje';

  @override
  String get errorOpenTelegram => 'Napaka pri odpiranju Telegrama';

  @override
  String get disclaimerTitle => 'Vir podatkov';

  @override
  String get disclaimerDescription =>
      'Podatki o repetitorjih v tej aplikaciji prihajajo od IZ8WNH.\n\nZa dodatne informacije, prenos datotek CSV za programiranje radijskih postaj ali za ogled podatkov, ki niso na voljo v tej aplikaciji, obiščite uradno spletno stran.';

  @override
  String get disclaimerVisitSite => 'Obiščite iz8wnh.it';

  @override
  String get disclaimerUnderstood => 'Razumem';

  @override
  String get errorOpenDisclaimerSite => 'Napaka pri odpiranju spletne strani';

  @override
  String get repeatersMapTitle => 'Zemljevid repetitorjev';

  @override
  String get repeatersListTitle => 'Seznam repetitorjev';

  @override
  String get repeatersMapLoading => 'Nalaganje zemljevida repetitorjev…';

  @override
  String get repeatersMapGenericError => 'Repetitorjev ni mogoče naložiti.';

  @override
  String get repeatersMapEmpty =>
      'V vaši bližini ni bilo najdenih repetitorjev.';

  @override
  String get repeatersSearchHint =>
      'Išči po imenu, klicnem znaku ali frekvenci MHz…';

  @override
  String get repeatersSearchEmpty => 'Noben repetitor ni bil najden.';

  @override
  String get repeatersSortDistance => 'Razdalja';

  @override
  String get repeatersSortLikes => 'Všečki';

  @override
  String get repeatersSortFrequency => 'Frekvenca';

  @override
  String repeatersNearbyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bližnjih repetitorjev',
      few: '$count bližnji repetitorji',
      two: '$count bližnja repetitorja',
      one: '$count bližnji repetitor',
    );
    return '$_temp0';
  }

  @override
  String repeatersResultsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rezultatov',
      few: '$count rezultati',
      two: '$count rezultata',
      one: '$count rezultat',
    );
    return '$_temp0';
  }

  @override
  String get repeatersMapRetry => 'Poskusi znova';

  @override
  String get repeatersMapOpenSettings => 'Odpri nastavitve';

  @override
  String get repeatersMapPermissionMessage =>
      'Dovolite dostop do lokacije za prikaz repetitorjev v vaši bližini.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'Dovoljenje za lokacijo je trajno zavrnjeno. Omogočite ga v sistemskih nastavitvah.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Omogočite lokacijske storitve za iskanje bližnjih repetitorjev.';

  @override
  String repeatersMapFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count najdenih repetitorjev',
      few: '$count najdeni repetitorji',
      two: '$count najdena repetitorja',
      one: '$count najden repetitor',
    );
    return '$_temp0';
  }

  @override
  String get repeaterMode => 'Način';

  @override
  String get repeaterModeAnalog => 'Analogni';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Vsi načini';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frekvenca';

  @override
  String get repeaterShift => 'Premik';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Lokacija';

  @override
  String get repeaterDistance => 'Razdalja';

  @override
  String get repeaterViewFullDetails => 'Prikaži vse podrobnosti';

  @override
  String get repeatersMapReturnToLocation => 'Vrni se na mojo lokacijo';

  @override
  String clusterRepeatersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count repetitorjev na tej lokaciji',
      few: '$count repetitorji na tej lokaciji',
      two: '$count repetitorja na tej lokaciji',
      one: '$count repetitor na tej lokaciji',
    );
    return '$_temp0';
  }

  @override
  String get profileUnlockFeatures => 'Odklenite vse funkcije';

  @override
  String get profileUnlockFeaturesDescription =>
      'Registrirajte se za uporabo ocenjevanja, shranjevanja priljubljenih in dostop do podrobnih statistik.';

  @override
  String get profileSignUpOrLogin => 'Registracija ali prijava';

  @override
  String get profileErrorOpeningEmail => 'Napaka pri odpiranju e-pošte';

  @override
  String get profileJoinTelegramCommunity =>
      'Pridružite se skupnosti na Telegramu';

  @override
  String get profileWelcomeTitle => 'Dobrodošli v HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Pridružite se naši skupnosti radioamaterjev v Italiji.';

  @override
  String get profileEditProfile => 'Uredi profil';

  @override
  String get profileChangePhoto => 'Spremeni fotografijo';

  @override
  String get profileFirstName => 'Ime';

  @override
  String get profileLastName => 'Priimek';

  @override
  String get profileCallsign => 'Klicni znak';

  @override
  String get profileRestartIdentificationTitle =>
      'Želite spremeniti svoj status? Ponovno zaženite postopek identifikacije za preklop med licenciranim operaterjem in SWL poslušalcem.';

  @override
  String get profileRestartIdentificationButton =>
      'Ponovno zaženi postopek identifikacije';

  @override
  String get profileSaveChanges => 'Shrani spremembe';

  @override
  String get profileDangerZone => 'Nevarno območje';

  @override
  String get profileDeleteAccount => 'Izbriši račun';

  @override
  String get profileDeleteAccountConfirmTitle => 'Izbriši račun';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Ali ste prepričani, da želite izbrisati svoj račun? To dejanje je nepreklicno.';

  @override
  String get profileDeleteAccountCancel => 'Prekliči';

  @override
  String get profileDeleteAccountConfirm => 'Izbriši';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Različica aplikacije $version (Gradnja $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Skupnost in podpora';

  @override
  String get profileSectionSupport => 'Podpora';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Različica: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Različica $version (Gradnja $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Napaka: $error';
  }

  @override
  String get authJoinTitle => 'Pridružite se HamQRG';

  @override
  String get authUnlockFeatures => 'Prijavite se za odklepanje vseh funkcij!';

  @override
  String get authWhatYouGet => 'Kaj boste dobili:';

  @override
  String get authBenefitStatsTitle => 'Podrobne statistike';

  @override
  String get authBenefitStatsDescription =>
      'Spremljajte svoj napredek in se izboljšujte';

  @override
  String get authBenefitQuizTitle => 'Različni načini kvizov';

  @override
  String get authBenefitQuizDescription =>
      'Vadite v maratonu, po temah in drugih načinih.';

  @override
  String get authBenefitSyncTitle => 'Sinhronizacija';

  @override
  String get authBenefitSyncDescription => 'Dostop z vseh naprav';

  @override
  String get authOrSignInWithEmail => 'Ali se prijavite z e-pošto';

  @override
  String get authEnterEmail => 'Vnesite e-pošto';

  @override
  String get authEnterPassword => 'Vnesite geslo';

  @override
  String get authForgotPassword => 'Pozabljeno geslo?';

  @override
  String get authSignIn => 'Prijava';

  @override
  String get authSignUp => 'Registracija';

  @override
  String get authPasswordLengthError => 'Geslo mora biti daljše';

  @override
  String get authDontHaveAccount => 'Nimate računa? Registrirajte se';

  @override
  String get authHaveAccount => 'Že imate račun? Prijavite se';

  @override
  String get authBackToSignIn => 'Nazaj na prijavo';

  @override
  String get authUnexpectedError => 'Napaka pri preverjanju pristnosti: ';

  @override
  String get authValidEmailError => 'Vnesite veljaven e-poštni naslov';

  @override
  String get authSendPasswordReset => 'Pošlji ponastavitev gesla';

  @override
  String get authPasswordResetSent => 'Ponastavitev gesla poslana';

  @override
  String get authVerifyEmailMessage =>
      'Za dokončanje registracije potrdite svoj e-poštni naslov, preverite prejeto pošto.';

  @override
  String get authInvalidCredentials => 'Napačna e-pošta ali geslo';

  @override
  String get authEmailNotConfirmed => 'Potrdite svojo e-pošto za prijavo';

  @override
  String get authFirstName => 'Ime';

  @override
  String get authFirstNameRequired => 'Ime je obvezno';

  @override
  String get authLastName => 'Priimek';

  @override
  String get authLastNameRequired => 'Priimek je obvezen';

  @override
  String get authContinueAsGuest => 'Nadaljuj kot gost';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Odkrijte repetitorje v vaši okolici';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Hiter dostop';

  @override
  String get homeRepeaterList => 'Seznam repetitorjev';

  @override
  String get homeMyFavorites => 'Moji priljubljeni';

  @override
  String get homeNearby => 'V bližini';

  @override
  String get homeViewAll => 'Prikaži vse';

  @override
  String get dashboardTabRepeaters => 'Repetitorji';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'V bližini ni repetitorjev';

  @override
  String get dashboardViewAllRepeaters => 'Prikaži vse repetitorje';

  @override
  String get dashboardViewAllPotaSpots => 'Prikaži vse POTA spote';

  @override
  String homeStations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count postaj',
      few: '$count postaje',
      two: '$count postaji',
      one: '$count postaja',
    );
    return '$_temp0';
  }

  @override
  String homeSaved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count shranjenih',
      few: '$count shranjeni',
      two: '$count shranjena',
      one: '$count shranjen',
    );
    return '$_temp0';
  }

  @override
  String get homeActive => 'Aktivno';

  @override
  String get homeIdle => 'Neaktivno';

  @override
  String get homeNavHome => 'Domov';

  @override
  String get homeNavList => 'Seznam';

  @override
  String get homeNavFavorites => 'Priljubljeni';

  @override
  String get homeNavMap => 'Zemljevid';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Moji priljubljeni';

  @override
  String get favoritesSearchHint => 'Išči shranjene repetitorje...';

  @override
  String get favoritesFilterAllSaved => 'Vsi shranjeni';

  @override
  String get favoritesEmpty => 'Ni shranjenih repetitorjev';

  @override
  String get favoritesEmptyDescription =>
      'Dodajte repetitorje med priljubljene, da jih vidite tukaj';

  @override
  String favoritesShowing(int showing, int total) {
    return 'Prikazanih $showing od $total priljubljenih postaj';
  }

  @override
  String get favoritesRemove => 'Odstrani iz priljubljenih';

  @override
  String get favoritesAdd => 'Dodaj med priljubljene';

  @override
  String get repeaterDetailSave => 'Shrani';

  @override
  String get repeaterDetailShare => 'Deli';

  @override
  String get repeaterDetailReport => 'Prijavi';

  @override
  String get repeaterDetailTotalLikes => 'Skupno všečkov';

  @override
  String get repeaterDetailReports1Yr => 'Prijave (1 leto)';

  @override
  String get repeaterDetailHealthScore => 'Ocena stanja';

  @override
  String get repeaterDetailExcellent => 'Odlično';

  @override
  String get repeaterDetailGood => 'Dobro';

  @override
  String get repeaterDetailFair => 'Zadovoljivo';

  @override
  String get repeaterDetailToVerify => 'Za preveriti';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Ocena izračunana na podlagi $count negativnih prijav v zadnjem letu';
  }

  @override
  String get repeaterDetailLastLike => 'Zadnji všeček';

  @override
  String get repeaterDetailLastDownReport => 'Zadnja negativna prijava';

  @override
  String get repeaterDetailTechnicalData => 'Tehnični podatki';

  @override
  String get repeaterDetailFrequency => 'Frekvenca';

  @override
  String get repeaterDetailShift => 'Premik';

  @override
  String get repeaterDetailSubtone => 'Podton (SQL)';

  @override
  String get repeaterDetailMode => 'Način';

  @override
  String get repeaterDetailLocation => 'Lokacija';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance stran';
  }

  @override
  String get repeaterDetailCommunityReports => 'Poročila skupnosti';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Posodobi stanje in povratne informacije';

  @override
  String get repeaterDetailEquipment => 'Oprema';

  @override
  String get repeaterDetailEquipmentRequired => 'Oprema *';

  @override
  String get repeaterDetailAccessModes => 'Načini dostopa';

  @override
  String get repeaterDetailNetwork => 'Omrežje';

  @override
  String get repeaterDetailLocationField => 'Lokacija';

  @override
  String get repeaterDetailLocationRequired => 'Lokacija *';

  @override
  String get repeaterDetailComment => 'Komentar';

  @override
  String get repeaterDetailCommentOptional => 'Komentar (neobvezno)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Kakovost signala, poročilo o zvoku ali splošne opombe...';

  @override
  String get repeaterDetailReportDown => 'Prijavi težavo';

  @override
  String get repeaterDetailCheckinLike => 'Prijava in všeček';

  @override
  String get repeaterDetailYourFeedback => 'Vaša povratna informacija';

  @override
  String get repeaterDetailPostedJustNow => 'Objavljeno pravkar';

  @override
  String get repeaterDetailDeleteEntry => 'Izbriši vnos';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Prikaži vseh $count poročil';
  }

  @override
  String get repeaterDetailStationPortable => 'Prenosna';

  @override
  String get repeaterDetailStationMobile => 'Mobilna';

  @override
  String get repeaterDetailStationFixed => 'Fiksna';

  @override
  String get repeaterDetailLike => 'Všeček';

  @override
  String get repeaterDetailReportLabel => 'Prijava';

  @override
  String get repeaterDetailSaved => 'Shranjeno';

  @override
  String get repeaterDetailShareMessage => 'Oglejte si ta repetitor na HamQRG!';

  @override
  String get repeaterDetailReportDescription =>
      'Funkcija prijavljanja bo kmalu na voljo. Lahko boste prijavili napačne podatke ali težave s tem repetitorjem.';

  @override
  String get commonClose => 'Zapri';

  @override
  String get favorite => 'Priljubljeni';

  @override
  String get accessConfiguration => 'Konfiguracija dostopa';

  @override
  String get noAccessConfiguration => 'Ni razpoložljive konfiguracije';

  @override
  String get repeaterDetailAddFeedback => 'Dodaj povratno informacijo';

  @override
  String get repeaterDetailOthersReports => 'Poročila drugih uporabnikov';

  @override
  String get repeaterDetailRemove => 'Odstrani';

  @override
  String get repeaterDetailSelectAccess => 'Izberi dostop';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'Za pošiljanje povratne informacije morate biti v razdalji $distance od repetitorja.';
  }

  @override
  String get repeaterDetailInteractive => 'Interaktivno';

  @override
  String get repeaterDetailLogYourSignal => 'Zabeležite svoj signal';

  @override
  String get repeaterDetailUsedEquipment => 'Uporabljena oprema';

  @override
  String get repeaterDetailYourLocation => 'Vaša lokacija';

  @override
  String get repeaterDetailLocationPlaceholder =>
      'Kje ste bili? (npr. Ljubljana)';

  @override
  String get repeaterDetailLocationSelectHint => 'Izberite kraj med predlogi';

  @override
  String get feedbackDistanceConfirmTitle => 'Potrditev oddaje';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'Izbrana lokacija je $distance od repetitorja. Potrjujete, da želite poslati to povratno informacijo na lastno odgovornost?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Potrdi';

  @override
  String get feedbackDistanceConfirmCancel => 'Prekliči';

  @override
  String get repeaterDetailSelectAccessInstance => 'Izberite dostopno instanco';

  @override
  String get repeaterDetailSignalObservations => 'Opažanja signala';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Kakšna je bila kakovost zvoka?';

  @override
  String get repeaterDetailSendLike => 'Pošlji všeček';

  @override
  String get repeaterDetailReportIssue => 'Prijavi težavo';

  @override
  String get repeaterDetailRecentActivity => 'Nedavna dejavnost';

  @override
  String get reportIssueTitle => 'Prijava';

  @override
  String get reportIssueHeadline => 'Pomagajte nam ohranjati točne podatke';

  @override
  String get reportIssueDescription =>
      'Ste našli nekaj napačnega ali manjkajočega pri tem repetitorju? Sporočite nam, kaj je treba spremeniti, in to bomo preverili.';

  @override
  String get reportIssueWhatToCorrect => 'Kaj želite popraviti ali dodati?';

  @override
  String get reportIssuePlaceholder =>
      'Npr. CTCSS ton se je spremenil na 88,5 Hz, ali je lokacija nekoliko bolj severno, upravljavec je...';

  @override
  String get reportIssueVerifiedTitle => 'Preverjena oddaja';

  @override
  String get reportIssueVerifiedDescription =>
      'Vaše poročilo bo pregledal regionalni koordinator, preden bo javna baza podatkov posodobljena. Hvala za vaš prispevek skupnosti.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Potrjujem, da so te informacije pravilne na podlagi mojega opazovanja.';

  @override
  String get reportIssueSubmit => 'Oddaj';

  @override
  String get reportIssueMinChars => 'Zahtevanih je najmanj 10 znakov';

  @override
  String get reportIssueMaxChars => 'Največ 2000 znakov';

  @override
  String get reportIssueSuccess => 'Poročilo uspešno oddano';

  @override
  String get reportIssueError => 'Napaka pri oddaji poročila';

  @override
  String get registrationPromptTitle => 'Odklenite polni potencial';

  @override
  String get registrationPromptDescription =>
      'Pridružite se skupnosti radioamaterjev in dvignite svojo izkušnjo na višjo raven.';

  @override
  String get registrationBenefitInteractTitle => 'Interakcija';

  @override
  String get registrationBenefitInteractDescription =>
      'Ocenjujte repetitorje in pustite komentarje za druge.';

  @override
  String get registrationBenefitFavoritesTitle => 'Priljubljeni';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Shranite svoje najpogosteje uporabljene frekvence in repetitorje.';

  @override
  String get registrationBenefitLogbookTitle => 'Dnevnik';

  @override
  String get registrationBenefitLogbookDescription =>
      'Spremljajte svoje QSO zveze in vodite osebno zgodovino.';

  @override
  String get registrationSignInApple => 'Prijava z Apple';

  @override
  String get registrationSignInGoogle => 'Prijava z Google';

  @override
  String get registrationPromptFooter =>
      'Brezplačna registracija. Za brskanje po javnih podatkih licenca ni potrebna.';

  @override
  String get postLoginOnboardingWelcome => 'Dobrodošli v';

  @override
  String get postLoginOnboardingQuestion => 'Ali ste licencirani radioamater?';

  @override
  String get postLoginOnboardingHelpText =>
      'To nam pomaga prilagoditi vašo izkušnjo in prikazati prave frekvence.';

  @override
  String get postLoginOnboardingYesLicensed => 'Da, sem';

  @override
  String get postLoginOnboardingNoListener => 'Ne, samo poslušam';

  @override
  String get postLoginOnboardingCallsignTitle => 'Identificirajte se';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Vnesite svoj uradni klicni znak za dostop do omrežnih funkcij.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Klicni znak';

  @override
  String get postLoginOnboardingCallsignHint => 'Npr. S51ABC';

  @override
  String get postLoginOnboardingComplete => 'Dokončaj profil';

  @override
  String get postLoginOnboardingBack => 'Nazaj';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'To lahko pozneje spremenite v nastavitvah.';

  @override
  String get postLoginOnboardingSwlTitle => 'SWL klicni znak';

  @override
  String get postLoginOnboardingSwlQuestion =>
      'Ali imate uradni SWL klicni znak?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'SWL klicni znaki pomagajo pri identifikaciji v globalni skupnosti poslušalcev.';

  @override
  String get postLoginOnboardingSwlYes => 'Da, imam ga';

  @override
  String get postLoginOnboardingSwlNo => 'Ne, nimam ga';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Vnesite klicni znak';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Npr. S1-12345-SWL';

  @override
  String get timeAgoJustNow => 'pravkar';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count minutami',
      few: 'pred $count minutami',
      two: 'pred $count minutama',
      one: 'pred $count minuto',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count urami',
      few: 'pred $count urami',
      two: 'pred $count urama',
      one: 'pred $count uro',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count dnevi',
      few: 'pred $count dnevi',
      two: 'pred $count dnevoma',
      one: 'pred $count dnem',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count tedni',
      few: 'pred $count tedni',
      two: 'pred $count tednoma',
      one: 'pred $count tednom',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count meseci',
      few: 'pred $count meseci',
      two: 'pred $count mesecema',
      one: 'pred $count mesecem',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pred $count leti',
      few: 'pred $count leti',
      two: 'pred $count letoma',
      one: 'pred $count letom',
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
  String get profileThemeModeDark => 'Temna';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Bodite prvi, ki pustite povratno informacijo o tem repetitorju!';

  @override
  String get repeaterDetailDistanceFromYou => 'Razdalja od vas';

  @override
  String get repeaterDistanceMapNoLocation => 'Lokacija ni na voljo';

  @override
  String get repeaterDetailNever => 'Nikoli';

  @override
  String get repeaterDetailInfo => 'Informacije';

  @override
  String get repeaterDetailSource => 'Vir';

  @override
  String get repeaterDetailManager => 'Upravljavec';

  @override
  String get repeaterDetailSuggestManager =>
      'Poznate upravljavca repetitorja? Prijavite ga!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Zemljevid povratnih informacij';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Oglejte si, kje so bili zabeleženi všečki in prijave';

  @override
  String get repeaterDetailAltimetricProfile => 'Višinski profil';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Oglejte si profil terena med vami in repetitorjem';

  @override
  String get repeaterCoverageTitle => 'Pokritost';

  @override
  String get repeaterCoverageCardTitle => 'Zemljevid pokritosti';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Oceni signal pretvornika na območju';

  @override
  String get repeaterCoverageLoading => 'Izračun pokritosti…';

  @override
  String get repeaterCoverageError => 'Pokritosti ni mogoče izračunati';

  @override
  String get repeaterCoverageRetry => 'Poskusi znova';

  @override
  String get repeaterCoverageLegendTitle => 'Ocenjeni signal (dBm)';

  @override
  String get repeaterCoverageCta => 'Prikaži pokritost';

  @override
  String get repeaterDetailLosClear =>
      'Jasna vidna povezava med vami in repetitorjem';

  @override
  String get repeaterDetailLosObstructed => 'Vidna povezava ovirana s terenom';

  @override
  String get repeaterDetailTerrainProfile => 'Profil terena';

  @override
  String get repeaterDetailLineOfSight => 'Vidna povezava';

  @override
  String get repeaterDetailTotalDistance => 'Razdalja';

  @override
  String get repeaterDetailRepeaterElevation => 'Nadmorska višina repetitorja';

  @override
  String get repeaterDetailYourElevation => 'Vaša nadmorska višina';

  @override
  String get repeaterDetailYou => 'Vi';

  @override
  String get repeaterDetailRepeaterLabel => 'Repetitor';

  @override
  String get repeaterDetailFunFacts => 'Ali ste vedeli?';

  @override
  String get repeaterDetailWavelength => 'Valovna dolžina';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'Valovna dolžina tega repetitorja je $value';
  }

  @override
  String get repeaterDetailOscillations => 'Nihanja na sekundo';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'Signal niha $value-krat na sekundo';
  }

  @override
  String get repeaterDetailPropagationTime => 'Čas širjenja';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'Vaš signal potrebuje $value, da doseže repetitor';
  }

  @override
  String get repeaterDetailWaveCycles => 'Valovni cikli med prenosom';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'Val opravi $value polnih ciklov med prenosom';
  }

  @override
  String get userReportsTitle => 'Moje dejavnosti';

  @override
  String get userReportsTabReports => 'Prijave';

  @override
  String get userReportsTabSubmissions => 'Novi repetitorji';

  @override
  String get userReportsFilterAll => 'Vsa';

  @override
  String get userReportsFilterOpen => 'Odprta';

  @override
  String get userReportsFilterClosed => 'Zaprta';

  @override
  String get userReportsEmpty => 'Ni oddanih poročil';

  @override
  String get userReportsEmptyDescription =>
      'Vaša poročila o repetitorjih se bodo prikazala tukaj';

  @override
  String get userReportsEmptyFiltered => 'Ni poročil s tem filtrom';

  @override
  String get userReportsStatusPending => 'V čakanju';

  @override
  String get userReportsStatusReviewed => 'V pregledu';

  @override
  String get userReportsStatusResolved => 'Rešeno';

  @override
  String get userReportsStatusRejected => 'Zavrnjeno';

  @override
  String get userReportsRetryBanner => 'Seznama ni mogoče posodobiti';

  @override
  String get userReportsProfileTile => 'Moja poročila';

  @override
  String get userReportsProfileTileSubtitle =>
      'Oglejte si stanje svojih poročil';

  @override
  String get userReportsError => 'Napaka pri nalaganju poročil';

  @override
  String get userReportsCoordinatorResponse => 'Odgovor koordinatorja';

  @override
  String get userSubmissionsEmpty => 'Ni predlaganih repetitorjev';

  @override
  String get userSubmissionsEmptyDescription =>
      'Predlagani repetitorji se bodo prikazali tukaj';

  @override
  String get userSubmissionsEmptyFiltered => 'Ni repetitorjev s tem filtrom';

  @override
  String get userSubmissionsStatusPending => 'V čakanju';

  @override
  String get userSubmissionsStatusApproved => 'Odobreno';

  @override
  String get userSubmissionsStatusRejected => 'Zavrnjeno';

  @override
  String get userSubmissionsCoordinatorResponse => 'Odgovor koordinatorja';

  @override
  String get userSubmissionsFrequency => 'Frekvenca';

  @override
  String get potaTitle => 'POTA spoti';

  @override
  String get potaSearchHint => 'Išči po aktivatorju, parku ali načinu…';

  @override
  String get potaNoSpots => 'Trenutno ni aktivnih POTA spotov.';

  @override
  String get potaLoadError => 'POTA spotov ni mogoče naložiti';

  @override
  String get potaRetry => 'Poskusi znova';

  @override
  String get potaViewAll => 'Prikaži vse';

  @override
  String get potaActivator => 'Aktivator';

  @override
  String get potaFrequency => 'Frekvenca';

  @override
  String get potaMode => 'Način';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Referenca';

  @override
  String get potaSpotter => 'Opazil';

  @override
  String get potaComments => 'Komentarji';

  @override
  String get potaLastSpotted => 'Zadnji spot';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'QRZ.com ni mogoče odpreti';

  @override
  String get potaParkWebsite => 'Spletna stran parka';

  @override
  String get potaParkType => 'Vrsta parka';

  @override
  String get potaLocation => 'Lokacija';

  @override
  String get potaCountry => 'Država';

  @override
  String get potaFirstActivation => 'Prva aktivacija';

  @override
  String get potaBand => 'Pas';

  @override
  String potaDistanceAway(String distance) {
    return '$distance stran';
  }

  @override
  String potaSpotsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktivnih spotov',
      few: '$count aktivni spoti',
      two: '$count aktivna spota',
      one: '$count aktiven spot',
    );
    return '$_temp0';
  }

  @override
  String get potaFilterAll => 'Vsi';

  @override
  String get potaFilterBand => 'Pas';

  @override
  String get potaFilterMode => 'Način';

  @override
  String get potaSortByTime => 'Najnovejše';

  @override
  String get potaSortByDistance => 'Najbližje';

  @override
  String get profileLanguage => 'Jezik';

  @override
  String get profileUnitSystem => 'Merske enote';

  @override
  String get profileUnitSystemAuto => 'Samodejno';

  @override
  String get profileUnitSystemMetric => 'Metrični';

  @override
  String get profileUnitSystemImperial => 'Imperialni';

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
  String get onboardingGetStarted => 'Začnimo';

  @override
  String get onboardingNext => 'Naprej';

  @override
  String get onboardingWelcomeTitle1 => 'Poiščite repetitorje v bližini';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Odkrijte aktivne repetitorje v vaši okolici s frekvencami, toni in tehničnimi podrobnostmi.';

  @override
  String get onboardingWelcomeCredits =>
      'Podatke o repetitorjih zagotavlja IZ8WNH';

  @override
  String get onboardingWelcomeTitle2 => 'Filtrirajte po načinu';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analogni, DMR, C4FM, D-STAR — takoj poiščite pravi repetitor za vas.';

  @override
  String get onboardingWelcomeTitle3 => 'POTA spoti v realnem času';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Spremljajte Parks on the Air aktivacije s posodobitvami v živo, filtri po pasovih in razdalji.';

  @override
  String get onboardingWelcomeTitle4 => 'Shranite priljubljene';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Imejte svoje najpogosteje uporabljene repetitorje pri roki za hiter dostop.';

  @override
  String get onboardingLocationTitle => 'Lokacija';

  @override
  String get onboardingLocationSubtitle =>
      'Vašo lokacijo uporabljamo za prikaz bližnjih repetitorjev in POTA aktivacij.';

  @override
  String get onboardingLocationEnable => 'Omogoči lokacijo';

  @override
  String get onboardingLocationSkip => 'Ne zdaj';

  @override
  String get onboardingDiscoveryTitle => 'Vaš prvi repetitor';

  @override
  String get onboardingDiscoverySubtitle => 'Tukaj je, kaj je v vaši bližini!';

  @override
  String get onboardingDiscoveryViewDetails => 'Prikaži podrobnosti';

  @override
  String get onboardingDiscoveryViewSpot => 'Prikaži spot';

  @override
  String get onboardingDiscoveryExploreMap => 'Razišči zemljevid';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Raziščite zemljevid in poiščite repetitorje ter POTA aktivacije';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Bližnji repetitor';

  @override
  String get onboardingDiscoveryLivePota => 'POTA spot v živo';

  @override
  String get onboardingDiscoveryNoRepeaters =>
      'V bližini ni bilo najdenih repetitorjev';

  @override
  String get onboardingTelegramTitle => 'Pridružite se skupnosti';

  @override
  String get onboardingTelegramSubtitle =>
      'Pridružite se HamQRG Telegram skupini za novice, prijave repetitorjev in spoznavanje drugih radioamaterjev.';

  @override
  String get onboardingTelegramJoin => 'Pridruži se Telegram skupini';

  @override
  String get onboardingTelegramLater => 'Morda pozneje';

  @override
  String get onboardingTelegramAlreadyMember => 'Že sem član';

  @override
  String get addRepeaterProfileTile => 'Predlagaj nov repetitor';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Prijavite repetitor, ki še ni na seznamu';

  @override
  String get addRepeaterTitle => 'Nov repetitor';

  @override
  String get addRepeaterHeadline => 'Prijavite manjkajoči repetitor';

  @override
  String get addRepeaterDescription =>
      'Izpolnite podatke o repetitorju, ki ga želite dodati. Oddaja bo pregledana pred objavo.';

  @override
  String get addRepeaterSectionRepeater => 'Podatki o repetitorju';

  @override
  String get addRepeaterSectionAccesses => 'Dostopi';

  @override
  String get addRepeaterSectionLocation => 'Lokacija';

  @override
  String get addRepeaterSectionNotes => 'Opombe';

  @override
  String get addRepeaterName => 'Ime';

  @override
  String get addRepeaterNameHint => 'Npr. Triglav';

  @override
  String get addRepeaterCallsign => 'Klicni znak';

  @override
  String get addRepeaterCallsignHint => 'Npr. S55VHF';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Vnesite vsaj ime ali klicni znak';

  @override
  String get addRepeaterFrequency => 'Frekvenca (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Npr. 145.000 ali 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frekvenca je obvezna';

  @override
  String get addRepeaterFrequencyInvalid => 'Neveljavna frekvenca';

  @override
  String get addRepeaterShift => 'Premik (MHz)';

  @override
  String get addRepeaterShiftHint => 'Npr. -0.600 ali -0,600';

  @override
  String get addRepeaterRegion => 'Regija';

  @override
  String get addRepeaterRegionHint => 'Npr. Gorenjska';

  @override
  String get addRepeaterProvinceCode => 'Pokrajina';

  @override
  String get addRepeaterProvinceCodeHint => 'Npr. LJ';

  @override
  String get addRepeaterLocality => 'Kraj';

  @override
  String get addRepeaterLocalityHint => 'Npr. Bled';

  @override
  String get addRepeaterLatitude => 'Zemljepisna širina';

  @override
  String get addRepeaterLatitudeHint => 'Npr. 46.3685';

  @override
  String get addRepeaterLongitude => 'Zemljepisna dolžina';

  @override
  String get addRepeaterLongitudeHint => 'Npr. 14.1133';

  @override
  String get addRepeaterLocator => 'Lokator';

  @override
  String get addRepeaterLocatorHint => 'Npr. JN76DB';

  @override
  String get addRepeaterNotes => 'Dodatne opombe';

  @override
  String get addRepeaterNotesHint => 'Dodatne informacije o repetitorju...';

  @override
  String get addRepeaterAddAccess => 'Dodaj dostop';

  @override
  String get addRepeaterRemoveAccess => 'Odstrani';

  @override
  String get addRepeaterAccessMode => 'Način';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Npr. 88.5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Npr. 88.5';

  @override
  String get addRepeaterAccessDcsCode => 'DCS koda';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Npr. 23';

  @override
  String get addRepeaterAccessColorCode => 'Barvna koda';

  @override
  String get addRepeaterAccessColorCodeHint => 'Npr. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Pogovorna skupina';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Npr. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Npr. 0';

  @override
  String get addRepeaterAccessNodeId => 'ID vozlišča';

  @override
  String get addRepeaterAccessNodeIdHint => 'Npr. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Ime omrežja';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Npr. BM Italia';

  @override
  String get addRepeaterAccessNotes => 'Opombe dostopa';

  @override
  String get addRepeaterAccessNotesHint => 'Opombe za ta dostop...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Potrjujem, da so te informacije po mojem najboljšem vedenju pravilne.';

  @override
  String get addRepeaterVerifiedTitle => 'Preverjena oddaja';

  @override
  String get addRepeaterVerifiedDescription =>
      'Vaša oddaja bo pregledana s strani ekipe, preden bo objavljena v bazi podatkov.';

  @override
  String get addRepeaterSubmit => 'Oddaj';

  @override
  String get addRepeaterSuccess => 'Oddaja uspešno poslana!';

  @override
  String get addRepeaterError => 'Napaka pri pošiljanju oddaje';

  @override
  String get addRepeaterAtLeastOneAccess => 'Dodajte vsaj en dostop';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Dostop $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'POTA spoti v realnem času z zemljevidom in podrobnostmi parkov';

  @override
  String get changelog1017SubmitRepeater =>
      'Predlagajte nov repetitor neposredno iz aplikacije';

  @override
  String get changelog1017MultiLanguage =>
      'Aplikacija na voljo v angleščini, španščini in francoščini';

  @override
  String get changelog1017Onboarding => 'Nova izkušnja ob prvem zagonu';

  @override
  String get changelog1017ReportAnonymous =>
      'Prijave na voljo brez registracije';

  @override
  String get changelog1020ClusterSpots =>
      'Cluster spoti v realnem času: glej, kdo posluša na repetitorjih, z obvestili in nastavitvami';

  @override
  String get changelog1020DetailTabs =>
      'Stran repetitorja z zavihki Info, Cluster in Skupnost';

  @override
  String get changelog1020TabletLayout => 'Postavitev, optimizirana za tablice';

  @override
  String get changelog110Coverage =>
      'Zemljevid pokritosti pretvornikov: oglej si predvideni signal neposredno na zemljevidu (PRO)';

  @override
  String get changelog110Reachable =>
      'Kaj dosežeš od tu: odkrij pretvornike, ki jih ujameš s svoje lokacije, s signalom in profilom terena (PRO)';

  @override
  String get changelogTitle => 'Novosti';

  @override
  String get changelogSubtitle => 'Tukaj so novosti v tej različici';

  @override
  String get changelogCategoryAdded => 'Novo';

  @override
  String get changelogCategoryImproved => 'Izboljšano';

  @override
  String get changelogCategoryFixed => 'Popravljeno';

  @override
  String get changelogDismiss => 'Razumem!';

  @override
  String get spotCreateTitle => 'Spottaj sebe';

  @override
  String get spotCreateOtherTitle => 'Spottaj OM-a';

  @override
  String get spotCreateDuration => 'Trajanje';

  @override
  String get spotCreateAccess => 'Način (neobvezno)';

  @override
  String get spotCreateCallsign => 'Klicni znak slišanega OM-a';

  @override
  String get spotCreateCallsignHint => 'Npr. S51ABC';

  @override
  String get spotCreateConfirm => 'Potrdi';

  @override
  String get spotCreateSuccessSelf => 'Spot ustvarjen!';

  @override
  String get spotCreateSuccessOther => 'OM spottan!';

  @override
  String get spotActiveYou => 'Ste spottani';

  @override
  String get spotActiveClose => 'Zapri spot';

  @override
  String spotActiveOn(String repeaterName) {
    return 'na $repeaterName';
  }

  @override
  String get spotActiveNone => 'Trenutno ni nikogar spottanega';

  @override
  String get spotActiveCta => 'Bodite prvi!';

  @override
  String get spotActiveSection => 'Aktivni spoti';

  @override
  String get spotHistorySection => 'Zgodovina spotov';

  @override
  String get spotListTitle => 'Najnovejši spoti';

  @override
  String get spotListViewAll => 'Prikaži vse';

  @override
  String get spotListBadgeActive => 'Posluša';

  @override
  String get spotListBadgeClosed => 'Končano';

  @override
  String get spotListBadgeReport => 'Prijavi';

  @override
  String get spotListEmpty => 'Ni spotov v zadnjih 24 urah';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Prijavil $callsign';
  }

  @override
  String get spotNotificationToggle => 'Obvestila klastra';

  @override
  String get spotNotificationDisabled =>
      'Obvestila klastra onemogočena v nastavitvah profila';

  @override
  String get spotNotificationPerFavorite => 'Obvestila o spotih';

  @override
  String get spotPreviousClosed => 'Vaš prejšnji spot ni več aktiven';

  @override
  String get spotErrorAuthRequired => 'Morate biti prijavljeni.';

  @override
  String get spotErrorCallsignRequired =>
      'Nastavite klicni znak v profilu za uporabo klastra.';

  @override
  String get spotErrorInvalidDuration =>
      'Trajanje mora biti med 5 in 60 minutami.';

  @override
  String get spotErrorRepeaterNotFound => 'Repetitor ni najden.';

  @override
  String get spotErrorInvalidAccess =>
      'Neveljaven dostopni način za ta repetitor.';

  @override
  String get spotErrorSpotNotFound => 'Spot ni najden.';

  @override
  String get spotErrorForbidden => 'Ne morete zapreti spota, ki ni vaš.';

  @override
  String get spotErrorAlreadyClosed => 'Spot je že zaprt.';

  @override
  String get spotErrorGeneric =>
      'Napaka pri ustvarjanju spota. Poskusite znova.';

  @override
  String get spotAccessUnavailable => '(način ni več na voljo)';

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
  String get spotsFiltersTitle => 'Filtri';

  @override
  String get spotsFilterBand => 'Pas';

  @override
  String get spotsFilterMode => 'Način';

  @override
  String get spotsFilterAll => 'Vse';

  @override
  String get spotsFiltersReset => 'Počisti filtre';

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
      'Dosegljivih pretvornikov ni bilo mogoče izračunati.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dosežeš $count pretvornikov',
      few: 'Dosežeš $count pretvornike',
      two: 'Dosežeš $count pretvornika',
      one: 'Dosežeš 1 pretvornik',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'Z tvoje lokacije, razvrščeno po signalu';

  @override
  String get reachSheetEmpty => 'V bližini ni dosegljivih pretvornikov.';

  @override
  String get reachBadgeTitle => 'Ga dosežeš od tu?';

  @override
  String get reachBadgeSubtitle =>
      'Ugotovi, ali te ta pretvornik pokriva in s kakšnim signalom';

  @override
  String get reachDiscoverCta => 'Odkrij s PRO';

  @override
  String get reachReachable => 'Dosežeš ga';

  @override
  String get reachOutOfCoverage => 'Zunaj pokritosti';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · tapni za profil';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance od tu';
  }

  @override
  String get reachComputing => 'Izračun pokritosti…';

  @override
  String get reachRepeaterFallback => 'Pretvornik';

  @override
  String get reachMapButton => 'Kaj dosežeš?';

  @override
  String get reachUpsellTitle => 'Kaj dosežeš od tu? 📡';

  @override
  String get reachUpsellBody =>
      'V realnem času poglej VSE pretvornike, ki jih ujameš s svoje lokacije, s predvidenim signalom in profilom terena. Koliko jih zares dosežeš od tam, kjer si zdaj?';

  @override
  String get reachUpsellLater => 'Pozneje';

  @override
  String get linkProfileObstructed => 'Ovira na poti (signal z uklonom)';

  @override
  String get linkProfileClear => 'Prosta vidna linija';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Profil terena in vidna linija · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Odkleni s PRO';

  @override
  String get proWelcomeTitle => 'Dobrodošel v PRO! 🎉';

  @override
  String get proWelcomeBody =>
      'Odklenil si zemljevid pokritosti, pretvornike, ki jih dosežeš s svoje lokacije, in vse funkcije PRO. 📡';

  @override
  String get proWelcomeCta => 'Začni raziskovati';

  @override
  String get commonCancel => 'Prekliči';

  @override
  String get commonDelete => 'Izbriši';

  @override
  String get commonEdit => 'Uredi';

  @override
  String get commonOpenSettings => 'Odpri nastavitve';

  @override
  String get commonFieldRequired => 'Obvezno polje';

  @override
  String get fieldName => 'Ime';

  @override
  String get fieldAddress => 'Naslov';

  @override
  String get fieldCity => 'Mesto';

  @override
  String get fieldDescription => 'Opis';

  @override
  String get fieldYear => 'Leto';

  @override
  String get fieldSelectDateHint => 'Izberi datum';

  @override
  String get validationInvalidYear => 'Izberi veljavno leto';

  @override
  String get validationPasswordMinLength =>
      'Geslo mora vsebovati vsaj 6 znakov';

  @override
  String get permissionsMissingTitle => 'Manjkajo dovoljenja!';

  @override
  String get imageUploadError => 'Napaka pri nalaganju slike';

  @override
  String get uploadImageLabel => 'Naloži sliko';

  @override
  String get sourceGallery => 'Galerija';

  @override
  String get sourceCamera => 'Kamera';

  @override
  String get changePasswordTitle => 'Spremeni geslo';

  @override
  String get fieldNewPassword => 'Novo geslo';

  @override
  String get fieldConfirmNewPassword => 'Potrdi novo geslo';

  @override
  String get validationPasswordsNoMatch => 'Gesli se ne ujemata';

  @override
  String get passwordChangedSuccess => 'Geslo uspešno spremenjeno';

  @override
  String errorWithMessage(String message) {
    return 'Napaka: $message';
  }

  @override
  String get updateRequiredTitle => 'Potrebna posodobitev';

  @override
  String get updateRequiredAction => 'Posodobi zdaj';

  @override
  String get yearPickerTitle => 'Izberi leto';

  @override
  String get repeaterTabInfo => 'Info';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Skupnost';

  @override
  String get updateRequiredBody =>
      'Na voljo je nova različica aplikacije. Posodobite jo za nadaljnjo uporabo.';

  @override
  String get errorOpeningStore => 'Napaka pri odpiranju trgovine';

  @override
  String get deleteConfirmTitle => 'Potrdi izbris';

  @override
  String get deleteConfirmContent => 'Ali ste prepričani, da želite izbrisati?';

  @override
  String get cameraPermissionRationale =>
      'Za fotografiranje dovolite dostop do kamere v nastavitvah.';

  @override
  String get coverageSearchHint => 'Poiščite kraj ali prilepite koordinate';

  @override
  String get coverageSearchRecentTitle => 'Nedavna iskanja';

  @override
  String get coverageSearchNoResults => 'Nobenega kraja ni bilo mogoče najti';

  @override
  String get coverageSearchTip =>
      'Prilepite lahko koordinate (46.4879, 11.8123) ali dolgo pritisnete na zemljevid';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Koordinate zunaj obsega: širina ±90, dolžina ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Ni povezave: iskanje krajev zahteva omrežje';

  @override
  String get coverageSearchErrorFailed => 'Iskanje ni uspelo. Poskusite znova.';

  @override
  String get coverageSearchClearPoint => 'Odstrani točko';

  @override
  String get coverageSearchPointSemantics => 'Izbrana iskalna točka';

  @override
  String get coverageBreadthTitle => 'Obseg iskanja';

  @override
  String get coverageBreadthQuick => 'Hitro';

  @override
  String get coverageBreadthMedium => 'Srednje';

  @override
  String get coverageBreadthExtended => 'Razširjeno';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · najhitrejši odgovor';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · uravnoteženo';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · dlje, daljše čakanje';
  }

  @override
  String get coverageResultSubtitle => 'Z izbrane točke';

  @override
  String get coverageResultEmptyNoReachable =>
      'S te točke ni dosegljiv noben repetitor';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'Na tem območju ni evidentiranega repetitorja';

  @override
  String get coverageResultClearFilters => 'Odstrani filtre';

  @override
  String get coverageResultError => 'Izračun ni uspel';

  @override
  String get coverageResultComputing => 'Izračun sprejema…';

  @override
  String get coverageResultCancel => 'Prekliči';

  @override
  String coverageResultCount(int count) {
    return 'Dosegljivi repetitorji: $count';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown od $total dosegljivih';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    return 'Skrito s filtri: $count';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Kaj dosežete z $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Vsak repetitor, dosegljiv s te točke, z napovedanim signalom in razdaljo — še preden se odpravite.';

  @override
  String get coverageTeaserBenefitAnywhere => 'Katera koli točka na svetu';

  @override
  String get coverageTeaserBenefitOffline => 'Na voljo brez omrežja, na terenu';

  @override
  String get coverageTeaserBenefitSave =>
      'Shranite postojanko in jo najdete znova';

  @override
  String get stationSaveCta => 'Shrani postojanko';

  @override
  String get stationSaveTitle => 'Ime postojanke';

  @override
  String get stationRename => 'Preimenuj';

  @override
  String get stationDelete => 'Izbriši';

  @override
  String get stationRefresh => 'Osveži';

  @override
  String get stationRefreshAll => 'Osveži vse';

  @override
  String get stationOfflineNotice => 'Podatki shranjeni v napravi';

  @override
  String get stationStaleNotice => 'Podatki morda niso posodobljeni';

  @override
  String get stationMissingEntry => 'Podatki niso na voljo brez povezave';

  @override
  String get stationDuplicateTitle => 'Točka je že shranjena';

  @override
  String stationDuplicateBody(String distance) {
    return 'V $distance že obstaja postojanka. Jo posodobim ali ustvarim ločeno?';
  }

  @override
  String get stationDuplicateUpdate => 'Posodobi';

  @override
  String get stationDuplicateCreate => 'Ustvari ločeno';

  @override
  String get stationSaveFailed => 'Shranjevanje ni uspelo: premalo prostora';

  @override
  String get stationSavedCta => 'Lokacija shranjena';

  @override
  String get stationRemoveCta => 'Odstrani';

  @override
  String get stationRemoveTitle => 'Odstranim lokacijo?';

  @override
  String stationRemoveBody(String name) {
    return '»$name« in njeni podatki brez povezave bodo izbrisani iz te naprave.';
  }

  @override
  String get stationRemovedSnack => 'Lokacija odstranjena';

  @override
  String get stationSaveError => 'Shranjevanje ni uspelo. Poskusite znova.';

  @override
  String get stationsTitle => 'Moje postojanke';

  @override
  String get stationsProfileSubtitle =>
      'Točke, ki si jih ovrednotil, na voljo tudi brez omrežja';

  @override
  String get stationsEmptyTitle => 'Ni shranjenih postojank';

  @override
  String get stationsEmptyBody =>
      'Postaja je točka na zemljevidu, za katero si že izračunal pokritost, shranjena, da jo najdeš tudi brez omrežja.';

  @override
  String get stationsEmptyStep1 =>
      'Izberi točko na zemljevidu: dolgo pritisni, poišči jo po imenu ali prilepi koordinate.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Dotakni se »$action«, da vidiš, katere repetitorje dosežeš od tam.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Shrani točko: našel jo boš tukaj, tudi na terenu brez omrežja.';

  @override
  String get stationsGoToMap => 'Na zemljevid';

  @override
  String get stationsRefreshDone => 'Osveževanje končano';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Posodobljeno $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Posodobitev čez $seconds s';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Posodobitev čez $minutes min';
  }

  @override
  String get spotsUpdating => 'Posodabljanje…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Samodejna posodobitev vsakih $seconds sekund';
  }

  @override
  String get spotsManualRefreshHint => 'Tapnite za posodobitev';

  @override
  String coverageResultScope(String km, int count) {
    return 'v obsegu $km · ovrednotenih: $count';
  }

  @override
  String get coverageResultRecalculating => 'Ponovni izračun';

  @override
  String get offlineBannerMessage => 'Brez povezave: ogled shranjenih podatkov';

  @override
  String get offlineMapsTitle => 'Zemljevidi brez povezave';

  @override
  String get offlineMapsEntrySubtitle =>
      'Prenesite zemljevide za uporabo brez povezave';

  @override
  String get offlineMapsEmpty =>
      'Ni prenesenih območij. Prenesite območje, da boste zemljevid videli tudi brez povezave.';

  @override
  String get offlineMapsAddRegion => 'Prenesi območje';

  @override
  String get offlineMapsRegionNameLabel => 'Ime območja';

  @override
  String get offlineMapsRegionNameHint => 'Npr. Dom, Koča, Aktivacija SOTA';

  @override
  String get offlineMapsRadiusLabel => 'Polmer';

  @override
  String get offlineMapsDownload => 'Prenesi';

  @override
  String get offlineMapsDownloadingStyle => 'Prenašanje sloga zemljevida…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Prenašanje zemljevidov… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Ocenjena velikost: $size';
  }

  @override
  String get offlineMapsDownloadError => 'Prenos ni uspel. Poskusite znova.';

  @override
  String get offlineMapsDeleteError => 'Brisanje ni uspelo. Poskusite znova.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Izbrišem območje?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '„$name“ ne bo več na voljo brez povezave.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Izbriši';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Polmer $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Nepopoln prenos';

  @override
  String get offlineMapsResume => 'Nadaljuj';

  @override
  String get offlineMapsCenterInfo =>
      'Območje bo osredotočeno na vašo trenutno lokacijo.';

  @override
  String get dashboardOfflineTitle => 'Brez povezave';

  @override
  String get dashboardOfflineMessage =>
      'Za to območje ni shranjenih podatkov. Vaše shranjene lokacije in preneseni zemljevidi so še vedno na voljo.';

  @override
  String get offlineMapsCenterMine => 'Moja lokacija';

  @override
  String get offlineMapsCenterSearch => 'Poišči kraj';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Poiščite mesto ali kraj: območje bo osredotočeno tam.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Središče: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Način brez povezave: repetitorji, priljubljeni, profil, pokritost in dosegljivost na voljo tudi brez omrežja (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Zemljevidi brez povezave: prenesite območje, kjer ste, ali poljuben kraj in ga uporabljajte brez povezave (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Iskanje pokritosti s katere koli točke: poiščite kraj, prilepite koordinate ali pridržite zemljevid in odkrijte, kaj dosežete od tam';

  @override
  String get changelog120SavedStations =>
      'Moje postaje: shranite točke, ki vas zanimajo, in jih preglejte tudi brez povezave (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'Spoti SOTA in POTA se samodejno osvežijo vsako minuto, z barvnimi značkami po načinu (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Brez povezave se aplikacija zažene takoj, pokaže, kaj je na voljo, in onemogoči dejanja, ki zahtevajo omrežje';

  @override
  String get changelog130ImperialUnits =>
      'Milje in čevlji: aplikacija zdaj sledi enotam vaše naprave, sistem pa lahko izberete v Nastavitvah';
}
