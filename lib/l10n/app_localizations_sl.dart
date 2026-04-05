// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

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
  String repeaterDetailDistanceWarning(int distance) {
    return 'Za pošiljanje povratne informacije morate biti v razdalji $distance km od repetitorja.';
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
    return 'Izbrana lokacija je $distance km od repetitorja. Potrjujete, da želite poslati to povratno informacijo na lastno odgovornost?';
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
  String get userReportsTitle => 'Moja poročila';

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
}
