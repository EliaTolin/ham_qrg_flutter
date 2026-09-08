// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get proSectionTitle => 'Előfizetés';

  @override
  String get proCardUpgradeTitle => 'Fedezd fel, mit érsz el';

  @override
  String get proCardUpgradeSubtitle =>
      'Lefedettség, átjátszók és offline térképek';

  @override
  String get proCardActiveTitle => 'HamQRG Pro aktív';

  @override
  String get proCardActiveSubtitle => 'Köszönjük a támogatást!';

  @override
  String proPriceFromMonth(String price) {
    return 'Havonta már $price · Bármikor lemondható';
  }

  @override
  String proPriceTrialThenMonth(String price) {
    return 'Ingyenes próba, utána havonta $price · Bármikor lemondható';
  }

  @override
  String proPriceLifetime(String price) {
    return 'Egyszeri $price · Örökre';
  }

  @override
  String proPriceFromMonthUpfront(String price, String total) {
    return 'Havonta már $price · $total előre · Bármikor lemondható';
  }

  @override
  String proPriceTrialThenMonthUpfront(String price, String total) {
    return 'Ingyenes próba, utána havonta $price · $total előre · Bármikor lemondható';
  }

  @override
  String get proRestoreSuccess =>
      'Vásárlások visszaállítva: a HamQRG Pro aktív';

  @override
  String get proRestoreNone => 'Nincs visszaállítható vásárlás';

  @override
  String get proManageSubscription => 'Előfizetés kezelése';

  @override
  String get proLinkAccountTitle => 'Kapcsold össze a fiókodat';

  @override
  String get proLinkAccountBody =>
      'Kapcsold a HamQRG Prót egy fiókhoz, hogy minden eszközön megmaradjon – újratelepítés után is.';

  @override
  String get stationsShowcaseTitle => 'A helyszíneid, hálózat nélkül is';

  @override
  String get stationsShowcaseBody =>
      'Mentsd el az otthont, a menedékházat, az aktiválási helyet: amit elérsz, hálózat nélkül is megvan.';

  @override
  String get offlineMapsUpsellTitle => 'A térkép a telefonodon marad 🗺️';

  @override
  String get offlineMapsUpsellBody =>
      'Töltsd le a szükséges területeket, és nyisd meg ott, ahol nincs térerő: a gerincen, alagútban, külföldön adatforgalom nélkül.';

  @override
  String get offlineMapsBenefitRegions =>
      'Te választod ki a letöltendő területeket';

  @override
  String get reachUpsellBenefitSignal => 'Várható jel minden átjátszóhoz';

  @override
  String get reachUpsellBenefitTerrain =>
      'Terepprofil közted és az átjátszó között';

  @override
  String get proRestoreCta => 'Vásárlások visszaállítása';

  @override
  String get error => 'Hiba';

  @override
  String get error_message => 'Hiba történt a betöltés során';

  @override
  String get error_message_retry =>
      'Hiba történt a betöltés során. Kérjük, próbáld újra később';

  @override
  String get retry => 'Újra';

  @override
  String get back => 'Vissza';

  @override
  String get loading => 'Betöltés';

  @override
  String get details => 'Részletek';

  @override
  String pages_number(Object number) {
    return '$number felfedezésre váró oldal';
  }

  @override
  String get january => 'Január';

  @override
  String get february => 'Február';

  @override
  String get march => 'Március';

  @override
  String get april => 'Április';

  @override
  String get may => 'Május';

  @override
  String get june => 'Június';

  @override
  String get july => 'Július';

  @override
  String get august => 'Augusztus';

  @override
  String get september => 'Szeptember';

  @override
  String get october => 'Október';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get logout => 'Kijelentkezés';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Beállítások';

  @override
  String get contact_us => 'Kapcsolat';

  @override
  String get error_opening_email => 'Hiba történt az e-mail megnyitásakor';

  @override
  String get register_now => 'Regisztrálj most';

  @override
  String get tracking_permission_title => 'Támogasd az alkalmazást';

  @override
  String get tracking_permission_message =>
      'Az élményed javítása és a számodra releváns tartalmak megjelenítése érdekében segíts nekünk ingyenesen tartani az alkalmazást.\n\nKoppints az Engedélyezés gombra a támogatáshoz.';

  @override
  String get tracking_permission_next => 'Tovább';

  @override
  String get skip => 'Kihagyás';

  @override
  String get done => 'Kész';

  @override
  String get next => 'Tovább';

  @override
  String get joinCommunityTitle => 'Csatlakozz a közösségünkhöz!';

  @override
  String get joinCommunityDescription =>
      'Fedezd fel a Telegram közösséghez való csatlakozás előnyeit:';

  @override
  String get benefitSupportMembers => 'Tagok támogatása';

  @override
  String get benefitSuggestFeatures => 'Új funkciók javaslása';

  @override
  String get benefitContactDevelopers => 'Kapcsolat a fejlesztőkkel';

  @override
  String get benefitExclusivePreviews => 'Exkluzív előzetesek és béták';

  @override
  String get benefitActiveCommunity => 'Aktív közösség';

  @override
  String get joinNowButton => 'Csatlakozz most!';

  @override
  String get alreadyMemberButton => 'Már tag vagyok';

  @override
  String get laterButton => 'Később';

  @override
  String get errorOpenTelegram => 'Hiba a Telegram megnyitásakor';

  @override
  String get disclaimerTitle => 'Adatforrás';

  @override
  String get disclaimerDescription =>
      'Az alkalmazásban szereplő átjátszó adatok az IZ8WNH oldaláról származnak.\n\nTovábbi információkért, rádiók programozásához szükséges CSV fájlok letöltéséhez, vagy az alkalmazásban nem elérhető adatok megtekintéséhez látogass el a hivatalos weboldalra.';

  @override
  String get disclaimerVisitSite => 'Látogass el az iz8wnh.it oldalra';

  @override
  String get disclaimerUnderstood => 'Értem';

  @override
  String get errorOpenDisclaimerSite => 'Hiba a weboldal megnyitásakor';

  @override
  String get repeatersMapTitle => 'Átjátszó térkép';

  @override
  String get repeatersListTitle => 'Átjátszó lista';

  @override
  String get repeatersMapLoading => 'Átjátszó térkép betöltése…';

  @override
  String get repeatersMapGenericError =>
      'Nem sikerült betölteni az átjátszókat.';

  @override
  String get repeatersMapEmpty => 'Nem található átjátszó a közeledben.';

  @override
  String get repeatersSearchHint =>
      'Keresés név, hívójel vagy frekvencia MHz alapján…';

  @override
  String get repeatersSearchEmpty => 'Nem található átjátszó.';

  @override
  String get repeatersSortDistance => 'Távolság';

  @override
  String get repeatersSortLikes => 'Kedvelések';

  @override
  String get repeatersSortFrequency => 'Frekvencia';

  @override
  String repeatersNearbyCount(int count) {
    return '$count közeli átjátszó';
  }

  @override
  String repeatersResultsCount(int count) {
    return '$count találat';
  }

  @override
  String get repeatersMapRetry => 'Újra';

  @override
  String get repeatersMapOpenSettings => 'Beállítások megnyitása';

  @override
  String get repeatersMapPermissionMessage =>
      'Engedélyezd a helymeghatározást a közeli átjátszók megjelenítéséhez.';

  @override
  String get repeatersMapPermissionPermanentlyDenied =>
      'A helymeghatározási engedély véglegesen megtagadva. Engedélyezd a rendszerbeállításokban.';

  @override
  String get repeatersMapLocationServicesDisabled =>
      'Engedélyezd a helymeghatározási szolgáltatásokat a közeli átjátszók kereséséhez.';

  @override
  String repeatersMapFound(int count) {
    return '$count átjátszó található';
  }

  @override
  String get repeaterMode => 'Üzemmód';

  @override
  String get repeaterModeAnalog => 'Analóg';

  @override
  String get repeaterModeC4fm => 'C4FM';

  @override
  String get repeaterModeDstar => 'D-STAR';

  @override
  String get repeaterModeDmr => 'DMR';

  @override
  String get repeaterModeAllmode => 'Minden üzemmód';

  @override
  String get repeaterModeEcholink => 'Echolink';

  @override
  String get repeaterModeAllstar => 'AllStar';

  @override
  String get repeaterModeWinlink => 'Winlink';

  @override
  String get repeaterFrequency => 'Frekvencia';

  @override
  String get repeaterShift => 'Eltolás';

  @override
  String get repeaterCtcss => 'CTCSS';

  @override
  String get repeaterLocation => 'Helyszín';

  @override
  String get repeaterDistance => 'Távolság';

  @override
  String get repeaterViewFullDetails => 'Teljes részletek megtekintése';

  @override
  String get repeatersMapReturnToLocation => 'Vissza a tartózkodási helyemre';

  @override
  String clusterRepeatersTitle(int count) {
    return '$count átjátszó ezen a helyen';
  }

  @override
  String get profileUnlockFeatures => 'Minden funkció feloldása';

  @override
  String get profileUnlockFeaturesDescription =>
      'Regisztrálj az értékelés, a kedvencek mentése és a részletes statisztikák eléréséhez.';

  @override
  String get profileSignUpOrLogin => 'Regisztráció vagy bejelentkezés';

  @override
  String get profileErrorOpeningEmail => 'Hiba az e-mail megnyitásakor';

  @override
  String get profileJoinTelegramCommunity =>
      'Csatlakozz a Telegram közösséghez';

  @override
  String get profileWelcomeTitle => 'Üdvözöl a HamQRG';

  @override
  String get profileWelcomeDescription =>
      'Csatlakozz a rádióamatőr közösségünkhöz Olaszországban.';

  @override
  String get profileEditProfile => 'Profil szerkesztése';

  @override
  String get profileChangePhoto => 'Fotó módosítása';

  @override
  String get profileFirstName => 'Keresztnév';

  @override
  String get profileLastName => 'Vezetéknév';

  @override
  String get profileCallsign => 'Hívójel';

  @override
  String get profileRestartIdentificationTitle =>
      'Szeretnéd megváltoztatni a státuszodat? Újraindíthatod az azonosítási folyamatot, hogy válts az Engedélyes üzemeltető és az SWL Hallgató között.';

  @override
  String get profileRestartIdentificationButton =>
      'Azonosítási folyamat újraindítása';

  @override
  String get profileSaveChanges => 'Változások mentése';

  @override
  String get profileDangerZone => 'Veszélyes zóna';

  @override
  String get profileDeleteAccount => 'Fiók törlése';

  @override
  String get profileDeleteAccountConfirmTitle => 'Fiók törlése';

  @override
  String get profileDeleteAccountConfirmMessage =>
      'Biztosan törölni szeretnéd a fiókodat? Ez a művelet nem visszavonható.';

  @override
  String get profileDeleteAccountCancel => 'Mégse';

  @override
  String get profileDeleteAccountConfirm => 'Törlés';

  @override
  String profileAppVersion(String version, String buildNumber) {
    return 'Alkalmazás verzió $version (Build $buildNumber)';
  }

  @override
  String get profileSectionCommunity => 'Közösség és támogatás';

  @override
  String get profileSectionSupport => 'Támogatás';

  @override
  String profileVersion(String version, String buildNumber) {
    return 'Verzió: $version+$buildNumber';
  }

  @override
  String profileVersionFormat(String version, String buildNumber) {
    return 'Verzió $version (Build $buildNumber)';
  }

  @override
  String profileError(String error) {
    return 'Hiba: $error';
  }

  @override
  String get authJoinTitle => 'Csatlakozz a HamQRG-hez';

  @override
  String get authUnlockFeatures =>
      'Jelentkezz be az összes funkció feloldásához!';

  @override
  String get authWhatYouGet => 'Amit kapsz:';

  @override
  String get authBenefitStatsTitle => 'Részletes statisztikák';

  @override
  String get authBenefitStatsDescription => 'Kövesd a fejlődésedet és fejlődj';

  @override
  String get authBenefitQuizTitle => 'Különféle kvíz módok';

  @override
  String get authBenefitQuizDescription =>
      'Gyakorolj maraton, témaalapú és egyéb módokban.';

  @override
  String get authBenefitSyncTitle => 'Szinkronizálás';

  @override
  String get authBenefitSyncDescription => 'Hozzáférés bármely eszközről';

  @override
  String get authOrSignInWithEmail => 'Vagy jelentkezz be e-maillel';

  @override
  String get authEnterEmail => 'Add meg az e-mail címed';

  @override
  String get authEnterPassword => 'Add meg a jelszavad';

  @override
  String get authForgotPassword => 'Elfelejtetted a jelszavad?';

  @override
  String get authSignIn => 'Bejelentkezés';

  @override
  String get authSignUp => 'Regisztráció';

  @override
  String get authPasswordLengthError => 'A jelszónak hosszabbnak kell lennie';

  @override
  String get authDontHaveAccount => 'Nincs fiókod? Regisztrálj';

  @override
  String get authHaveAccount => 'Már van fiókod? Jelentkezz be';

  @override
  String get authBackToSignIn => 'Vissza a bejelentkezéshez';

  @override
  String get authUnexpectedError => 'Hitelesítési hiba: ';

  @override
  String get authValidEmailError => 'Adj meg érvényes e-mail címet';

  @override
  String get authSendPasswordReset => 'Jelszó-visszaállítás küldése';

  @override
  String get authPasswordResetSent => 'Jelszó-visszaállítás elküldve';

  @override
  String get authVerifyEmailMessage =>
      'A regisztráció befejezéséhez erősítsd meg az e-mail címedet, ellenőrizd a postaládádat.';

  @override
  String get authInvalidCredentials => 'Érvénytelen e-mail cím vagy jelszó';

  @override
  String get authEmailNotConfirmed =>
      'A bejelentkezéshez erősítsd meg az e-mail címedet';

  @override
  String get authFirstName => 'Keresztnév';

  @override
  String get authFirstNameRequired => 'A keresztnév megadása kötelező';

  @override
  String get authLastName => 'Vezetéknév';

  @override
  String get authLastNameRequired => 'A vezetéknév megadása kötelező';

  @override
  String get authContinueAsGuest => 'Folytatás vendégként';

  @override
  String get commonAppNamePart1 => 'Ham';

  @override
  String get commonAppNamePart2 => 'QRG';

  @override
  String get commonAppTagline => 'Fedezd fel a körülötted lévő átjátszókat';

  @override
  String get commonPoweredBy => 'POWERED BY IU4VRB';

  @override
  String get homeQuickAccess => 'Gyors hozzáférés';

  @override
  String get homeRepeaterList => 'Átjátszó lista';

  @override
  String get homeMyFavorites => 'Kedvenceim';

  @override
  String get homeNearby => 'A közeledben';

  @override
  String get homeViewAll => 'Összes megtekintése';

  @override
  String get dashboardTabRepeaters => 'Átjátszók';

  @override
  String get dashboardTabPota => 'POTA';

  @override
  String get dashboardNearbyEmpty => 'Nincs közeli átjátszó';

  @override
  String get dashboardViewAllRepeaters => 'Összes átjátszó megtekintése';

  @override
  String get dashboardViewAllPotaSpots => 'Összes POTA spot megtekintése';

  @override
  String homeStations(int count) {
    return '$count állomás';
  }

  @override
  String homeSaved(int count) {
    return '$count mentett';
  }

  @override
  String get homeActive => 'Aktív';

  @override
  String get homeIdle => 'Inaktív';

  @override
  String get homeNavHome => 'Kezdőlap';

  @override
  String get homeNavList => 'Lista';

  @override
  String get homeNavFavorites => 'Kedvencek';

  @override
  String get homeNavMap => 'Térkép';

  @override
  String get homeNavProfile => 'Profil';

  @override
  String get favoritesTitle => 'Kedvenceim';

  @override
  String get favoritesSearchHint => 'Keresés a mentett átjátszók között...';

  @override
  String get favoritesFilterAllSaved => 'Összes mentett';

  @override
  String get favoritesEmpty => 'Nincsenek mentett átjátszók';

  @override
  String get favoritesEmptyDescription =>
      'Adj hozzá átjátszókat a kedvencekhez, hogy itt megjelenjenek';

  @override
  String favoritesShowing(int showing, int total) {
    return '$showing/$total kedvenc állomás megjelenítése';
  }

  @override
  String get favoritesRemove => 'Eltávolítás a kedvencekből';

  @override
  String get favoritesAdd => 'Hozzáadás a kedvencekhez';

  @override
  String get repeaterDetailSave => 'Mentés';

  @override
  String get repeaterDetailShare => 'Megosztás';

  @override
  String get repeaterDetailReport => 'Bejelentés';

  @override
  String get repeaterDetailTotalLikes => 'Összes kedvelés';

  @override
  String get repeaterDetailReports1Yr => 'Bejelentések (1 év)';

  @override
  String get repeaterDetailHealthScore => 'Állapotpontszám';

  @override
  String get repeaterDetailExcellent => 'Kiváló';

  @override
  String get repeaterDetailGood => 'Jó';

  @override
  String get repeaterDetailFair => 'Megfelelő';

  @override
  String get repeaterDetailToVerify => 'Ellenőrizendő';

  @override
  String repeaterDetailScoreCalculated(int count) {
    return 'Az elmúlt év $count negatív bejelentése alapján számított pontszám';
  }

  @override
  String get repeaterDetailLastLike => 'Utolsó kedvelés';

  @override
  String get repeaterDetailLastDownReport => 'Utolsó negatív bejelentés';

  @override
  String get repeaterDetailTechnicalData => 'Műszaki adatok';

  @override
  String get repeaterDetailFrequency => 'Frekvencia';

  @override
  String get repeaterDetailShift => 'Eltolás';

  @override
  String get repeaterDetailSubtone => 'Altónus (SQL)';

  @override
  String get repeaterDetailMode => 'Üzemmód';

  @override
  String get repeaterDetailLocation => 'Helyszín';

  @override
  String repeaterDetailAway(String distance) {
    return '$distance távolságra';
  }

  @override
  String get repeaterDetailCommunityReports => 'Közösségi bejelentések';

  @override
  String get repeaterDetailUpdateStatusFeedback =>
      'Állapot és visszajelzés frissítése';

  @override
  String get repeaterDetailEquipment => 'Felszerelés';

  @override
  String get repeaterDetailEquipmentRequired => 'Felszerelés *';

  @override
  String get repeaterDetailAccessModes => 'Hozzáférési módok';

  @override
  String get repeaterDetailNetwork => 'Hálózat';

  @override
  String get repeaterDetailLocationField => 'Helyszín';

  @override
  String get repeaterDetailLocationRequired => 'Helyszín *';

  @override
  String get repeaterDetailComment => 'Megjegyzés';

  @override
  String get repeaterDetailCommentOptional => 'Megjegyzés (Opcionális)';

  @override
  String get repeaterDetailCommentPlaceholder =>
      'Jelminőség, audio jelentés vagy általános megjegyzések...';

  @override
  String get repeaterDetailReportDown => 'Probléma bejelentése';

  @override
  String get repeaterDetailCheckinLike => 'Bejelentkezés és kedvelés';

  @override
  String get repeaterDetailYourFeedback => 'Visszajelzésed';

  @override
  String get repeaterDetailPostedJustNow => 'Most közzétéve';

  @override
  String get repeaterDetailDeleteEntry => 'Bejegyzés törlése';

  @override
  String repeaterDetailViewAllReports(int count) {
    return 'Mind a(z) $count bejelentés megtekintése';
  }

  @override
  String get repeaterDetailStationPortable => 'Hordozható';

  @override
  String get repeaterDetailStationMobile => 'Mobil';

  @override
  String get repeaterDetailStationFixed => 'Fix';

  @override
  String get repeaterDetailLike => 'Kedvelés';

  @override
  String get repeaterDetailReportLabel => 'Bejelentés';

  @override
  String get repeaterDetailSaved => 'Mentve';

  @override
  String get repeaterDetailShareMessage =>
      'Nézd meg ezt az átjátszót a HamQRG-ben!';

  @override
  String get repeaterDetailReportDescription =>
      'A bejelentési funkció hamarosan elérhető lesz. Jelentheted majd a helytelen információkat vagy az átjátszóval kapcsolatos problémákat.';

  @override
  String get commonClose => 'Bezárás';

  @override
  String get favorite => 'Kedvenc';

  @override
  String get accessConfiguration => 'Hozzáférés beállítása';

  @override
  String get noAccessConfiguration => 'Nincs elérhető konfiguráció';

  @override
  String get repeaterDetailAddFeedback => 'Visszajelzés hozzáadása';

  @override
  String get repeaterDetailOthersReports => 'Más felhasználók bejelentései';

  @override
  String get repeaterDetailRemove => 'Eltávolítás';

  @override
  String get repeaterDetailSelectAccess => 'Hozzáférés kiválasztása';

  @override
  String repeaterDetailDistanceWarning(String distance) {
    return 'A visszajelzés küldéséhez $distance-en belül kell lenned az átjátszótól.';
  }

  @override
  String get repeaterDetailInteractive => 'Interaktív';

  @override
  String get repeaterDetailLogYourSignal => 'Jel naplózása';

  @override
  String get repeaterDetailUsedEquipment => 'Használt felszerelés';

  @override
  String get repeaterDetailYourLocation => 'Tartózkodási helyed';

  @override
  String get repeaterDetailLocationPlaceholder => 'Hol voltál? (pl. Budapest)';

  @override
  String get repeaterDetailLocationSelectHint =>
      'Válassz egy helyet a javaslatokból';

  @override
  String get feedbackDistanceConfirmTitle => 'Beküldés megerősítése';

  @override
  String feedbackDistanceConfirmMessage(String distance) {
    return 'A kiválasztott helyszín $distance-re van az átjátszótól. Megerősíted, hogy saját felelősségedre küldöd el ezt a visszajelzést?';
  }

  @override
  String get feedbackDistanceConfirmButton => 'Megerősítés';

  @override
  String get feedbackDistanceConfirmCancel => 'Mégse';

  @override
  String get repeaterDetailSelectAccessInstance =>
      'Hozzáférési példány kiválasztása';

  @override
  String get repeaterDetailSignalObservations => 'Jelmegfigyelések';

  @override
  String get repeaterDetailSignalObservationsPlaceholder =>
      'Milyen volt a hangminőség?';

  @override
  String get repeaterDetailSendLike => 'Kedvelés küldése';

  @override
  String get repeaterDetailReportIssue => 'Probléma bejelentése';

  @override
  String get repeaterDetailRecentActivity => 'Legutóbbi tevékenység';

  @override
  String get reportIssueTitle => 'Bejelentés';

  @override
  String get reportIssueHeadline =>
      'Segíts nekünk pontosan tartani az adatokat';

  @override
  String get reportIssueDescription =>
      'Találtál valami hibásat vagy hiányzót ennél az átjátszónál? Jelezd, mit kell módosítani, és ellenőrizzük.';

  @override
  String get reportIssueWhatToCorrect =>
      'Mit szeretnél javítani vagy hozzáadni?';

  @override
  String get reportIssuePlaceholder =>
      'Pl. A CTCSS tónus 88,5 Hz-re változott, vagy a helyszín kissé északabbra van, az üzemeltető...';

  @override
  String get reportIssueVerifiedTitle => 'Ellenőrzött bejelentések';

  @override
  String get reportIssueVerifiedDescription =>
      'A bejelentésedet a regionális koordinátor felülvizsgálja, mielőtt a nyilvános adatbázis frissül. Köszönjük a közösséghez való hozzájárulásodat.';

  @override
  String get reportIssueConfirmCheckbox =>
      'Megerősítem, hogy ez az információ a megfigyelésem alapján helyes.';

  @override
  String get reportIssueSubmit => 'Beküldés';

  @override
  String get reportIssueMinChars => 'Minimum 10 karakter szükséges';

  @override
  String get reportIssueMaxChars => 'Maximum 2000 karakter';

  @override
  String get reportIssueSuccess => 'Bejelentés sikeresen elküldve';

  @override
  String get reportIssueError => 'Hiba a bejelentés elküldésekor';

  @override
  String get registrationPromptTitle => 'Használd ki a lehetőségeket';

  @override
  String get registrationPromptDescription =>
      'Csatlakozz a rádióamatőr közösséghez és emeld új szintre az élményed.';

  @override
  String get registrationBenefitInteractTitle => 'Interakció';

  @override
  String get registrationBenefitInteractDescription =>
      'Értékeld az átjátszókat és hagyj megjegyzéseket másoknak.';

  @override
  String get registrationBenefitFavoritesTitle => 'Kedvencek';

  @override
  String get registrationBenefitFavoritesDescription =>
      'Mentsd el a leggyakrabban használt frekvenciáidat és átjátszóidat.';

  @override
  String get registrationBenefitLogbookTitle => 'Naplókönyv';

  @override
  String get registrationBenefitLogbookDescription =>
      'Tartsd nyilván a QSO-idat és vezess személyes előzménynaplót.';

  @override
  String get registrationSignInApple => 'Bejelentkezés Apple-lel';

  @override
  String get registrationSignInGoogle => 'Bejelentkezés Google-lel';

  @override
  String get registrationPromptFooter =>
      'Ingyenes regisztráció. A nyilvános adatok böngészéséhez nem szükséges engedély.';

  @override
  String get postLoginOnboardingWelcome => 'Üdvözlünk a';

  @override
  String get postLoginOnboardingQuestion =>
      'Engedéllyel rendelkező rádióamatőr vagy?';

  @override
  String get postLoginOnboardingHelpText =>
      'Ez segít személyre szabni az élményedet és a megfelelő frekvenciákat megmutatni.';

  @override
  String get postLoginOnboardingYesLicensed => 'Igen, az vagyok';

  @override
  String get postLoginOnboardingNoListener => 'Nem, csak hallgató vagyok';

  @override
  String get postLoginOnboardingCallsignTitle => 'Azonosítsd magad';

  @override
  String get postLoginOnboardingCallsignSubtitle =>
      'Add meg a hivatalos hívójeledet a hálózati funkciók eléréséhez.';

  @override
  String get postLoginOnboardingCallsignLabel => 'Hívójel';

  @override
  String get postLoginOnboardingCallsignHint => 'Pl. HA5XYZ';

  @override
  String get postLoginOnboardingComplete => 'Profil befejezése';

  @override
  String get postLoginOnboardingBack => 'Vissza';

  @override
  String get postLoginOnboardingChangeInSettings =>
      'Ezt később a beállításokban módosíthatod.';

  @override
  String get postLoginOnboardingSwlTitle => 'SWL hívójel';

  @override
  String get postLoginOnboardingSwlQuestion => 'Van hivatalos SWL hívójeled?';

  @override
  String get postLoginOnboardingSwlHelpText =>
      'A rövidhullámú hallgatói hívójelek segítenek az azonosításban a globális megfigyelő közösségben.';

  @override
  String get postLoginOnboardingSwlYes => 'Igen, van';

  @override
  String get postLoginOnboardingSwlNo => 'Nem, nincs';

  @override
  String get postLoginOnboardingSwlEnterCallsign => 'Add meg a hívójelet';

  @override
  String get postLoginOnboardingSwlCallsignHint => 'Pl. HA-12345-SWL';

  @override
  String get timeAgoJustNow => 'épp most';

  @override
  String timeAgoMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perce',
      one: '1 perce',
    );
    return '$_temp0';
  }

  @override
  String timeAgoHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count órája',
      one: '1 órája',
    );
    return '$_temp0';
  }

  @override
  String timeAgoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count napja',
      one: '1 napja',
    );
    return '$_temp0';
  }

  @override
  String timeAgoWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hete',
      one: '1 hete',
    );
    return '$_temp0';
  }

  @override
  String timeAgoMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hónapja',
      one: '1 hónapja',
    );
    return '$_temp0';
  }

  @override
  String timeAgoYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éve',
      one: '1 éve',
    );
    return '$_temp0';
  }

  @override
  String get profileThemeMode => 'Téma';

  @override
  String get profileThemeModeSystem => 'Rendszer';

  @override
  String get profileThemeModeLight => 'Világos';

  @override
  String get profileThemeModeDark => 'Sötét';

  @override
  String get repeaterDetailBeFirstFeedback =>
      'Legyél az első, aki visszajelzést ad erről az átjátszóról!';

  @override
  String get repeaterDetailDistanceFromYou => 'Távolság tőled';

  @override
  String get repeaterDistanceMapNoLocation => 'Helymeghatározás nem elérhető';

  @override
  String get repeaterDetailNever => 'Soha';

  @override
  String get repeaterDetailInfo => 'Információ';

  @override
  String get repeaterDetailSource => 'Forrás';

  @override
  String get repeaterDetailManager => 'Üzemeltető';

  @override
  String get repeaterDetailSuggestManager =>
      'Ismered az átjátszó üzemeltetőjét? Jelezd nekünk!';

  @override
  String get repeaterDetailViewFeedbackMap => 'Visszajelzés térkép';

  @override
  String get repeaterDetailViewFeedbackMapSubtitle =>
      'Nézd meg, hol rögzítettek kedveléseket és bejelentéseket';

  @override
  String get repeaterDetailAltimetricProfile => 'Magassági profil';

  @override
  String get repeaterDetailAltimetricProfileSubtitle =>
      'Nézd meg a terep profilt közted és az átjátszó között';

  @override
  String get repeaterCoverageTitle => 'Lefedettség';

  @override
  String get repeaterCoverageCardTitle => 'Lefedettségi térkép';

  @override
  String get repeaterCoverageCardSubtitle =>
      'Megbecsüli az átjátszó jelét a területen';

  @override
  String get repeaterCoverageLoading => 'Lefedettség számítása…';

  @override
  String get repeaterCoverageError =>
      'Nem sikerült kiszámítani a lefedettséget';

  @override
  String get repeaterCoverageRetry => 'Újrapróbálkozás';

  @override
  String get repeaterCoverageLegendTitle => 'Becsült jel (dBm)';

  @override
  String get repeaterCoverageCta => 'Lefedettség megtekintése';

  @override
  String get repeaterDetailLosClear =>
      'Szabad rálátás közted és az átjátszó között';

  @override
  String get repeaterDetailLosObstructed => 'A rálátást akadályozza a terep';

  @override
  String get repeaterDetailTerrainProfile => 'Terepprofil';

  @override
  String get repeaterDetailLineOfSight => 'Rálátás';

  @override
  String get repeaterDetailTotalDistance => 'Távolság';

  @override
  String get repeaterDetailRepeaterElevation => 'Átjátszó magassága';

  @override
  String get repeaterDetailYourElevation => 'A te magasságod';

  @override
  String get repeaterDetailYou => 'Te';

  @override
  String get repeaterDetailRepeaterLabel => 'Átjátszó';

  @override
  String get repeaterDetailFunFacts => 'Tudtad?';

  @override
  String get repeaterDetailWavelength => 'Hullámhossz';

  @override
  String repeaterDetailWavelengthValue(String value) {
    return 'Ennek az átjátszónak a hullámhossza $value';
  }

  @override
  String get repeaterDetailOscillations => 'Rezgés másodpercenként';

  @override
  String repeaterDetailOscillationsValue(String value) {
    return 'A jel másodpercenként $value alkalommal rezeg';
  }

  @override
  String get repeaterDetailPropagationTime => 'Terjedési idő';

  @override
  String repeaterDetailPropagationTimeValue(String value) {
    return 'A jeled $value alatt éri el az átjátszót';
  }

  @override
  String get repeaterDetailWaveCycles => 'Hullámciklusok útközben';

  @override
  String repeaterDetailWaveCyclesValue(String value) {
    return 'A hullám $value teljes ciklust tesz meg útközben';
  }

  @override
  String get userReportsTitle => 'Tevékenységeim';

  @override
  String get userReportsTabReports => 'Bejelentések';

  @override
  String get userReportsTabSubmissions => 'Új átjátszók';

  @override
  String get userReportsFilterAll => 'Összes';

  @override
  String get userReportsFilterOpen => 'Nyitott';

  @override
  String get userReportsFilterClosed => 'Lezárt';

  @override
  String get userReportsEmpty => 'Nincsenek beküldött bejelentések';

  @override
  String get userReportsEmptyDescription =>
      'Az átjátszó bejelentéseid itt fognak megjelenni';

  @override
  String get userReportsEmptyFiltered => 'Nincs bejelentés ezzel a szűrővel';

  @override
  String get userReportsStatusPending => 'Függőben';

  @override
  String get userReportsStatusReviewed => 'Felülvizsgálat alatt';

  @override
  String get userReportsStatusResolved => 'Megoldva';

  @override
  String get userReportsStatusRejected => 'Elutasítva';

  @override
  String get userReportsRetryBanner => 'Nem sikerült frissíteni a listát';

  @override
  String get userReportsProfileTile => 'Bejelentéseim';

  @override
  String get userReportsProfileTileSubtitle =>
      'Bejelentéseid állapotának megtekintése';

  @override
  String get userReportsError => 'Hiba a bejelentések betöltésekor';

  @override
  String get userReportsCoordinatorResponse => 'Koordinátor válasza';

  @override
  String get userSubmissionsEmpty => 'Nincs javasolt átjátszó';

  @override
  String get userSubmissionsEmptyDescription =>
      'A javasolt átjátszók itt jelennek meg';

  @override
  String get userSubmissionsEmptyFiltered => 'Nincs átjátszó ezzel a szűrővel';

  @override
  String get userSubmissionsStatusPending => 'Függőben';

  @override
  String get userSubmissionsStatusApproved => 'Jóváhagyva';

  @override
  String get userSubmissionsStatusRejected => 'Elutasítva';

  @override
  String get userSubmissionsCoordinatorResponse => 'Koordinátor válasza';

  @override
  String get userSubmissionsFrequency => 'Frekvencia';

  @override
  String get potaTitle => 'POTA Spotok';

  @override
  String get potaSearchHint => 'Keresés aktiváló, park vagy üzemmód alapján…';

  @override
  String get potaNoSpots => 'Jelenleg nincsenek aktív POTA spotok.';

  @override
  String get potaLoadError => 'Nem sikerült betölteni a POTA spotokat';

  @override
  String get potaRetry => 'Újra';

  @override
  String get potaViewAll => 'Összes megtekintése';

  @override
  String get potaActivator => 'Aktiváló';

  @override
  String get potaFrequency => 'Frekvencia';

  @override
  String get potaMode => 'Üzemmód';

  @override
  String get potaPark => 'Park';

  @override
  String get potaReference => 'Hivatkozás';

  @override
  String get potaSpotter => 'Bejelentő';

  @override
  String get potaComments => 'Megjegyzések';

  @override
  String get potaLastSpotted => 'Utoljára észlelve';

  @override
  String get potaOpenQrz => 'QRZ.com';

  @override
  String get potaQrzError => 'Nem sikerült megnyitni a QRZ.com-ot';

  @override
  String get potaParkWebsite => 'Park weboldal';

  @override
  String get potaParkType => 'Park típusa';

  @override
  String get potaLocation => 'Helyszín';

  @override
  String get potaCountry => 'Ország';

  @override
  String get potaFirstActivation => 'Első aktiválás';

  @override
  String get potaBand => 'Sáv';

  @override
  String potaDistanceAway(String distance) {
    return '$distance távolságra';
  }

  @override
  String potaSpotsCount(int count) {
    return '$count aktív spot';
  }

  @override
  String get potaFilterAll => 'Összes';

  @override
  String get potaFilterBand => 'Sáv';

  @override
  String get potaFilterMode => 'Üzemmód';

  @override
  String get potaSortByTime => 'Legújabb';

  @override
  String get potaSortByDistance => 'Legközelebbi';

  @override
  String get profileLanguage => 'Nyelv';

  @override
  String get profileUnitSystem => 'Mértékegységek';

  @override
  String get profileUnitSystemAuto => 'Automatikus';

  @override
  String get profileUnitSystemMetric => 'Metrikus';

  @override
  String get profileUnitSystemImperial => 'Angolszász';

  @override
  String get profileLanguageSystem => 'Rendszer';

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
  String get onboardingSkip => 'Kihagyás';

  @override
  String get onboardingGetStarted => 'Kezdjük';

  @override
  String get onboardingNext => 'Tovább';

  @override
  String get onboardingWelcomeTitle1 => 'Találj átjátszókat a közeledben';

  @override
  String get onboardingWelcomeSubtitle1 =>
      'Fedezd fel a környéked aktív átjátszóit frekvenciákkal, tónusokkal és műszaki részletekkel.';

  @override
  String get onboardingWelcomeCredits =>
      'Az átjátszó adatokat az IZ8WNH biztosítja';

  @override
  String get onboardingWelcomeTitle2 => 'Szűrés üzemmód szerint';

  @override
  String get onboardingWelcomeSubtitle2 =>
      'Analóg, DMR, C4FM, D-STAR — találd meg azonnal a neked megfelelő átjátszót.';

  @override
  String get onboardingWelcomeTitle3 => 'Valós idejű POTA spotok';

  @override
  String get onboardingWelcomeSubtitle3 =>
      'Kövesd a Parks on the Air aktiválásokat élő frissítésekkel, sávszűrőkkel és távolsággal.';

  @override
  String get onboardingWelcomeTitle4 => 'Mentsd el a kedvenceidet';

  @override
  String get onboardingWelcomeSubtitle4 =>
      'Tartsd kéznél a leggyakrabban használt átjátszóidat a gyors hozzáféréshez.';

  @override
  String get onboardingLocationTitle => 'Helymeghatározás';

  @override
  String get onboardingLocationSubtitle =>
      'A tartózkodási helyedet használjuk a közeli átjátszók és POTA aktiválások megjelenítéséhez.';

  @override
  String get onboardingLocationEnable => 'Helymeghatározás engedélyezése';

  @override
  String get onboardingLocationSkip => 'Most nem';

  @override
  String get onboardingDiscoveryTitle => 'Az első átjátszód';

  @override
  String get onboardingDiscoverySubtitle => 'Íme, mi van a közeledben!';

  @override
  String get onboardingDiscoveryViewDetails => 'Részletek megtekintése';

  @override
  String get onboardingDiscoveryViewSpot => 'Spot megtekintése';

  @override
  String get onboardingDiscoveryExploreMap => 'Térkép felfedezése';

  @override
  String get onboardingDiscoveryNoLocation =>
      'Fedezd fel a térképet átjátszók és POTA aktiválások kereséséhez';

  @override
  String get onboardingDiscoveryNearbyRepeater => 'Közeli átjátszó';

  @override
  String get onboardingDiscoveryLivePota => 'Élő POTA spot';

  @override
  String get onboardingDiscoveryNoRepeaters => 'Nem található közeli átjátszó';

  @override
  String get onboardingTelegramTitle => 'Csatlakozz a közösséghez';

  @override
  String get onboardingTelegramSubtitle =>
      'Csatlakozz a HamQRG Telegram csoporthoz frissítésekért, átjátszó bejelentésekért és más rádióamatőrökkel való találkozásért.';

  @override
  String get onboardingTelegramJoin => 'Csatlakozás a Telegram csoporthoz';

  @override
  String get onboardingTelegramLater => 'Talán később';

  @override
  String get onboardingTelegramAlreadyMember => 'Már tag vagyok';

  @override
  String get addRepeaterProfileTile => 'Új átjátszó javaslása';

  @override
  String get addRepeaterProfileTileSubtitle =>
      'Még nem listázott átjátszó bejelentése';

  @override
  String get addRepeaterTitle => 'Új átjátszó';

  @override
  String get addRepeaterHeadline => 'Hiányzó átjátszó bejelentése';

  @override
  String get addRepeaterDescription =>
      'Töltsd ki a hozzáadni kívánt átjátszó adatait. A beküldést közzététel előtt felülvizsgálják.';

  @override
  String get addRepeaterSectionRepeater => 'Átjátszó adatai';

  @override
  String get addRepeaterSectionAccesses => 'Hozzáférések';

  @override
  String get addRepeaterSectionLocation => 'Helyszín';

  @override
  String get addRepeaterSectionNotes => 'Megjegyzések';

  @override
  String get addRepeaterName => 'Név';

  @override
  String get addRepeaterNameHint => 'Pl. Kékestető';

  @override
  String get addRepeaterCallsign => 'Hívójel';

  @override
  String get addRepeaterCallsignHint => 'Pl. HA5KDR';

  @override
  String get addRepeaterNameOrCallsignRequired =>
      'Adj meg legalább egy nevet vagy hívójelet';

  @override
  String get addRepeaterFrequency => 'Frekvencia (MHz)';

  @override
  String get addRepeaterFrequencyHint => 'Pl. 145.000 vagy 145,000';

  @override
  String get addRepeaterFrequencyRequired => 'Frekvencia megadása kötelező';

  @override
  String get addRepeaterFrequencyInvalid => 'Érvénytelen frekvencia';

  @override
  String get addRepeaterShift => 'Eltolás (MHz)';

  @override
  String get addRepeaterShiftHint => 'Pl. -0,600 vagy -0.600';

  @override
  String get addRepeaterRegion => 'Régió';

  @override
  String get addRepeaterRegionHint => 'Pl. Pest megye';

  @override
  String get addRepeaterProvinceCode => 'Megye';

  @override
  String get addRepeaterProvinceCodeHint => 'Pl. PE';

  @override
  String get addRepeaterLocality => 'Település';

  @override
  String get addRepeaterLocalityHint => 'Pl. Budapest';

  @override
  String get addRepeaterLatitude => 'Szélesség';

  @override
  String get addRepeaterLatitudeHint => 'Pl. 47.4979';

  @override
  String get addRepeaterLongitude => 'Hosszúság';

  @override
  String get addRepeaterLongitudeHint => 'Pl. 19.0402';

  @override
  String get addRepeaterLocator => 'Lokátor';

  @override
  String get addRepeaterLocatorHint => 'Pl. JN97PM';

  @override
  String get addRepeaterNotes => 'További megjegyzések';

  @override
  String get addRepeaterNotesHint => 'További információk az átjátszóról...';

  @override
  String get addRepeaterAddAccess => 'Hozzáférés hozzáadása';

  @override
  String get addRepeaterRemoveAccess => 'Eltávolítás';

  @override
  String get addRepeaterAccessMode => 'Üzemmód';

  @override
  String get addRepeaterAccessCtcssTx => 'CTCSS TX (Hz)';

  @override
  String get addRepeaterAccessCtcssTxHint => 'Pl. 88,5';

  @override
  String get addRepeaterAccessCtcssRx => 'CTCSS RX (Hz)';

  @override
  String get addRepeaterAccessCtcssRxHint => 'Pl. 88,5';

  @override
  String get addRepeaterAccessDcsCode => 'DCS kód';

  @override
  String get addRepeaterAccessDcsCodeHint => 'Pl. 23';

  @override
  String get addRepeaterAccessColorCode => 'Színkód';

  @override
  String get addRepeaterAccessColorCodeHint => 'Pl. 1';

  @override
  String get addRepeaterAccessTalkgroup => 'Beszédcsoport';

  @override
  String get addRepeaterAccessTalkgroupHint => 'Pl. 222801';

  @override
  String get addRepeaterAccessDgId => 'DG-ID';

  @override
  String get addRepeaterAccessDgIdHint => 'Pl. 0';

  @override
  String get addRepeaterAccessNodeId => 'Csomópont azonosító';

  @override
  String get addRepeaterAccessNodeIdHint => 'Pl. 1234';

  @override
  String get addRepeaterAccessNetworkName => 'Hálózat neve';

  @override
  String get addRepeaterAccessNetworkNameHint => 'Pl. BM Magyarország';

  @override
  String get addRepeaterAccessNotes => 'Hozzáférési megjegyzések';

  @override
  String get addRepeaterAccessNotesHint =>
      'Ehhez a hozzáféréshez tartozó megjegyzések...';

  @override
  String get addRepeaterConfirmCheckbox =>
      'Megerősítem, hogy ez az információ a legjobb tudásom szerint helyes.';

  @override
  String get addRepeaterVerifiedTitle => 'Ellenőrzött beküldés';

  @override
  String get addRepeaterVerifiedDescription =>
      'A beküldésedet a csapat felülvizsgálja, mielőtt megjelenne az adatbázisban.';

  @override
  String get addRepeaterSubmit => 'Beküldés';

  @override
  String get addRepeaterSuccess => 'Beküldés sikeresen elküldve!';

  @override
  String get addRepeaterError => 'Hiba a beküldés elküldésekor';

  @override
  String get addRepeaterAtLeastOneAccess =>
      'Adj hozzá legalább egy hozzáférést';

  @override
  String addRepeaterAccessNumber(int number) {
    return 'Hozzáférés $number';
  }

  @override
  String get changelog1017PotaSpots =>
      'Valós idejű POTA spotok térképpel és park részletekkel';

  @override
  String get changelog1017SubmitRepeater =>
      'Új átjátszó javaslása közvetlenül az alkalmazásból';

  @override
  String get changelog1017MultiLanguage =>
      'Alkalmazás elérhető angolul, spanyolul és franciául';

  @override
  String get changelog1017Onboarding => 'Új első indítási élmény';

  @override
  String get changelog1017ReportAnonymous =>
      'Bejelentések regisztráció nélkül is elérhetők';

  @override
  String get changelog1020ClusterSpots =>
      'Valós idejű cluster spotok: nézd meg, ki hallgat az átjátszókon, értesítésekkel és beállításokkal';

  @override
  String get changelog1020DetailTabs =>
      'Átjátszó oldal Info, Cluster és Közösség fülekkel';

  @override
  String get changelog1020TabletLayout => 'Táblagépre optimalizált elrendezés';

  @override
  String get changelog110Coverage =>
      'Átjátszók lefedettségi térképe: nézd meg a becsült jelet közvetlenül a térképen (PRO)';

  @override
  String get changelog110Reachable =>
      'Mit érsz el innen: fedezd fel az átjátszókat, amelyeket a helyzetedből elérsz, jellel és terepprofillal (PRO)';

  @override
  String get changelogTitle => 'Újdonságok';

  @override
  String get changelogSubtitle => 'Íme, mi újság ebben a verzióban';

  @override
  String get changelogCategoryAdded => 'Új';

  @override
  String get changelogCategoryImproved => 'Javított';

  @override
  String get changelogCategoryFixed => 'Hibajavítás';

  @override
  String get changelogDismiss => 'Értem!';

  @override
  String get spotCreateTitle => 'Magad spottolása';

  @override
  String get spotCreateOtherTitle => 'OM spottolása';

  @override
  String get spotCreateDuration => 'Időtartam';

  @override
  String get spotCreateAccess => 'Üzemmód (opcionális)';

  @override
  String get spotCreateCallsign => 'A hallott OM hívójele';

  @override
  String get spotCreateCallsignHint => 'Pl. HA1ABC';

  @override
  String get spotCreateConfirm => 'Megerősítés';

  @override
  String get spotCreateSuccessSelf => 'Spot létrehozva!';

  @override
  String get spotCreateSuccessOther => 'OM spottolva!';

  @override
  String get spotActiveYou => 'Spottolva vagy';

  @override
  String get spotActiveClose => 'Spot lezárása';

  @override
  String spotActiveOn(String repeaterName) {
    return 'a következőn: $repeaterName';
  }

  @override
  String get spotActiveNone => 'Jelenleg senki sincs spottolva';

  @override
  String get spotActiveCta => 'Légy te az első!';

  @override
  String get spotActiveSection => 'Aktív spotok';

  @override
  String get spotHistorySection => 'Spot előzmények';

  @override
  String get spotListTitle => 'Legújabb spotok';

  @override
  String get spotListViewAll => 'Összes megtekintése';

  @override
  String get spotListBadgeActive => 'Hallgatózik';

  @override
  String get spotListBadgeClosed => 'Befejezve';

  @override
  String get spotListBadgeReport => 'Jelentés';

  @override
  String get spotListEmpty => 'Nincs spot az elmúlt 24 órában';

  @override
  String spotListSpottedBy(String callsign) {
    return 'Jelentette: $callsign';
  }

  @override
  String get spotNotificationToggle => 'Klaszter értesítések';

  @override
  String get spotNotificationDisabled =>
      'Klaszter értesítések kikapcsolva a profilbeállításokban';

  @override
  String get spotNotificationPerFavorite => 'Spot értesítések';

  @override
  String get spotPreviousClosed => 'Az előző spotod már nem aktív';

  @override
  String get spotErrorAuthRequired => 'Be kell jelentkezned.';

  @override
  String get spotErrorCallsignRequired =>
      'Állítsd be a hívójeledet a profilodban a klaszter használatához.';

  @override
  String get spotErrorInvalidDuration =>
      'Az időtartamnak 5 és 60 perc között kell lennie.';

  @override
  String get spotErrorRepeaterNotFound => 'Átjátszó nem található.';

  @override
  String get spotErrorInvalidAccess =>
      'Érvénytelen hozzáférési mód ehhez az átjátszóhoz.';

  @override
  String get spotErrorSpotNotFound => 'Spot nem található.';

  @override
  String get spotErrorForbidden => 'Nem zárhatod le más spotját.';

  @override
  String get spotErrorAlreadyClosed => 'A spot már le van zárva.';

  @override
  String get spotErrorGeneric =>
      'Hiba a spot létrehozásakor. Kérjük, próbáld újra.';

  @override
  String get spotAccessUnavailable => '(üzemmód már nem elérhető)';

  @override
  String spotDurationMinutes(int minutes) {
    return '$minutes perc';
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
  String get spotsFiltersTitle => 'Szűrők';

  @override
  String get spotsFilterBand => 'Sáv';

  @override
  String get spotsFilterMode => 'Mód';

  @override
  String get spotsFilterAll => 'Összes';

  @override
  String get spotsFiltersReset => 'Szűrők törlése';

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
      'Nem sikerült kiszámítani az elérhető átjátszókat.';

  @override
  String reachSheetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count átjátszót érsz el',
      one: '1 átjátszót érsz el',
    );
    return '$_temp0';
  }

  @override
  String get reachSheetSubtitle => 'A helyzetedből, jel szerint rendezve';

  @override
  String get reachSheetEmpty => 'Nincs elérhető átjátszó a közelben.';

  @override
  String get reachBadgeTitle => 'Eléred innen?';

  @override
  String get reachBadgeSubtitle =>
      'Tudd meg, hogy ez az átjátszó lefed-e, és milyen jellel';

  @override
  String get reachDiscoverCta => 'Fedezd fel a PRO-val';

  @override
  String get reachReachable => 'Eléred';

  @override
  String get reachOutOfCoverage => 'Lefedettségen kívül';

  @override
  String reachReachableDetail(String signal, String distance) {
    return '$signal · $distance · koppints a profilért';
  }

  @override
  String reachDistanceFromHere(String distance) {
    return '$distance innen';
  }

  @override
  String get reachComputing => 'Lefedettség számítása…';

  @override
  String get reachRepeaterFallback => 'Átjátszó';

  @override
  String get reachMapButton => 'Mit érsz el?';

  @override
  String get reachUpsellTitle => 'Mit érsz el innen? 📡';

  @override
  String get reachUpsellBody =>
      'Lásd valós időben az ÖSSZES átjátszót, amelyet a helyzetedből fogsz, várható jellel és terepprofillal. Hányat érsz el valójában onnan, ahol most vagy?';

  @override
  String get reachUpsellLater => 'Később';

  @override
  String get linkProfileObstructed =>
      'Akadály az útvonalon (jel diffrakcióval)';

  @override
  String get linkProfileClear => 'Szabad rálátás';

  @override
  String linkProfileCaption(String tx, String rx) {
    return 'Terepprofil és rálátás · TX $tx · RX $rx';
  }

  @override
  String get proUnlockCta => 'Feloldás PRO-val';

  @override
  String get proWelcomeTitle => 'Üdvözlünk a PRO-ban! 🎉';

  @override
  String get proWelcomeBody =>
      'Feloldottad a lefedettségi térképet, a helyzetedből elérhető átjátszókat és az összes PRO funkciót. 📡';

  @override
  String get proWelcomeCta => 'Kezdj felfedezni';

  @override
  String get commonCancel => 'Mégse';

  @override
  String get commonDelete => 'Törlés';

  @override
  String get commonEdit => 'Szerkesztés';

  @override
  String get commonOpenSettings => 'Beállítások megnyitása';

  @override
  String get commonFieldRequired => 'Kötelező mező';

  @override
  String get fieldName => 'Név';

  @override
  String get fieldAddress => 'Cím';

  @override
  String get fieldCity => 'Város';

  @override
  String get fieldDescription => 'Leírás';

  @override
  String get fieldYear => 'Év';

  @override
  String get fieldSelectDateHint => 'Válassz dátumot';

  @override
  String get validationInvalidYear => 'Válassz érvényes évet';

  @override
  String get validationPasswordMinLength =>
      'A jelszónak legalább 6 karakter hosszúnak kell lennie';

  @override
  String get permissionsMissingTitle => 'Hiányzó engedélyek!';

  @override
  String get imageUploadError => 'Hiba a kép feltöltése közben';

  @override
  String get uploadImageLabel => 'Kép feltöltése';

  @override
  String get sourceGallery => 'Galéria';

  @override
  String get sourceCamera => 'Kamera';

  @override
  String get changePasswordTitle => 'Jelszó módosítása';

  @override
  String get fieldNewPassword => 'Új jelszó';

  @override
  String get fieldConfirmNewPassword => 'Új jelszó megerősítése';

  @override
  String get validationPasswordsNoMatch => 'A jelszavak nem egyeznek';

  @override
  String get passwordChangedSuccess => 'Jelszó sikeresen módosítva';

  @override
  String errorWithMessage(String message) {
    return 'Hiba: $message';
  }

  @override
  String get updateRequiredTitle => 'Frissítés szükséges';

  @override
  String get updateRequiredAction => 'Frissítés most';

  @override
  String get yearPickerTitle => 'Válassz évet';

  @override
  String get repeaterTabInfo => 'Infó';

  @override
  String get repeaterTabCluster => 'Cluster';

  @override
  String get repeaterTabCommunity => 'Közösség';

  @override
  String get updateRequiredBody =>
      'Elérhető az alkalmazás új verziója. Frissíts a további használathoz.';

  @override
  String get errorOpeningStore => 'Hiba az áruház megnyitásakor';

  @override
  String get deleteConfirmTitle => 'Törlés megerősítése';

  @override
  String get deleteConfirmContent => 'Biztosan törölni szeretnéd?';

  @override
  String get cameraPermissionRationale =>
      'Fénykép készítéséhez engedélyezd a kamera-hozzáférést a beállításokban.';

  @override
  String get coverageSearchHint =>
      'Keressen helyet vagy illesszen be koordinátákat';

  @override
  String get coverageSearchRecentTitle => 'Legutóbbi keresések';

  @override
  String get coverageSearchNoResults => 'Nem található hely';

  @override
  String get coverageSearchTip =>
      'Beilleszthet koordinátákat (46.4879, 11.8123) vagy hosszan nyomhat a térképen';

  @override
  String get coverageSearchErrorOutOfRange =>
      'Koordináták tartományon kívül: szélesség ±90, hosszúság ±180';

  @override
  String get coverageSearchErrorOffline =>
      'Nincs kapcsolat: a helykereséshez hálózat kell';

  @override
  String get coverageSearchErrorFailed =>
      'A keresés sikertelen. Próbálja újra.';

  @override
  String get coverageSearchClearPoint => 'Pont eltávolítása';

  @override
  String get coverageSearchPointSemantics => 'Kiválasztott keresési pont';

  @override
  String get coverageBreadthTitle => 'Keresési hatókör';

  @override
  String get coverageBreadthQuick => 'Gyors';

  @override
  String get coverageBreadthMedium => 'Közepes';

  @override
  String get coverageBreadthExtended => 'Kiterjesztett';

  @override
  String coverageBreadthQuickHint(String radius) {
    return '$radius · leggyorsabb válasz';
  }

  @override
  String coverageBreadthMediumHint(String radius) {
    return '$radius · kiegyensúlyozott';
  }

  @override
  String coverageBreadthExtendedHint(String radius) {
    return '$radius · távolabb, hosszabb várakozás';
  }

  @override
  String get coverageResultSubtitle => 'A kiválasztott pontból';

  @override
  String get coverageResultEmptyNoReachable =>
      'Erről a pontról egyetlen átjátszó sem érhető el';

  @override
  String get coverageResultEmptyNoRepeaters =>
      'Ezen a területen nincs nyilvántartott átjátszó';

  @override
  String get coverageResultClearFilters => 'Szűrők törlése';

  @override
  String get coverageResultError => 'A számítás sikertelen';

  @override
  String get coverageResultComputing => 'Vétel számítása…';

  @override
  String get coverageResultCancel => 'Mégse';

  @override
  String coverageResultCount(int count) {
    return '$count elérhető átjátszó';
  }

  @override
  String coverageResultCountFiltered(int shown, int total) {
    return '$shown / $total elérhető';
  }

  @override
  String coverageResultHiddenByFilters(int count) {
    return 'A szűrők $count elérhetőt rejtenek el';
  }

  @override
  String coverageTeaserTitle(String place) {
    return 'Mit érsz el innen: $place? 📡';
  }

  @override
  String get coverageTeaserBody =>
      'Minden átjátszó, amit onnan elérsz, várható jellel és távolsággal — még indulás előtt.';

  @override
  String get coverageTeaserBenefitAnywhere => 'A bolygó bármely pontja';

  @override
  String get coverageTeaserBenefitOffline =>
      'Hálózat nélkül is olvasható, terepen';

  @override
  String get coverageTeaserBenefitSave =>
      'Elmented a helyet és újra megtalálod';

  @override
  String get stationSaveCta => 'Hely mentése';

  @override
  String get stationSaveTitle => 'A hely neve';

  @override
  String get stationRename => 'Átnevezés';

  @override
  String get stationDelete => 'Törlés';

  @override
  String get stationRefresh => 'Frissítés';

  @override
  String get stationRefreshAll => 'Összes frissítése';

  @override
  String get stationOfflineNotice => 'Az eszközön tárolt adat';

  @override
  String get stationStaleNotice => 'Az adat elavult lehet';

  @override
  String get stationMissingEntry => 'Az adat offline nem érhető el';

  @override
  String get stationDuplicateTitle => 'A pont már mentve van';

  @override
  String stationDuplicateBody(String distance) {
    return '$distance-en belül már van egy hely. Frissíted, vagy külön hozol létre?';
  }

  @override
  String get stationDuplicateUpdate => 'Frissítés';

  @override
  String get stationDuplicateCreate => 'Külön létrehozás';

  @override
  String get stationSaveFailed => 'A mentés sikertelen: nincs elég hely';

  @override
  String get stationSavedCta => 'Helyszín mentve';

  @override
  String get stationRemoveCta => 'Eltávolítás';

  @override
  String get stationRemoveTitle => 'Eltávolítja a helyszínt?';

  @override
  String stationRemoveBody(String name) {
    return 'A(z) „$name” és offline adatai törlődnek erről az eszközről.';
  }

  @override
  String get stationRemovedSnack => 'Helyszín eltávolítva';

  @override
  String get stationSaveError => 'A mentés nem sikerült. Próbálja újra.';

  @override
  String get stationsTitle => 'Helyeim';

  @override
  String get stationsProfileSubtitle =>
      'Az általad kiértékelt pontok, hálózat nélkül is';

  @override
  String get stationsEmptyTitle => 'Még nincs mentett hely';

  @override
  String get stationsEmptyBody =>
      'A hely egy térképpont, amelynek a lefedettségét már kiszámoltad, elmentve, hogy hálózat nélkül is megtaláld.';

  @override
  String get stationsEmptyStep1 =>
      'Válassz egy pontot a térképen: tartsd nyomva, keresd névre vagy illeszd be a koordinátákat.';

  @override
  String stationsEmptyStep2(String action) {
    return 'Koppints a(z) „$action” gombra, hogy lásd, mely átjátszókat éred el onnan.';
  }

  @override
  String get stationsEmptyStep3 =>
      'Mentsd el a pontot: itt megtalálod, terepen, hálózat nélkül is.';

  @override
  String get stationsGoToMap => 'Ugrás a térképre';

  @override
  String get stationsRefreshDone => 'A frissítés kész';

  @override
  String spotsUpdatedAgo(String time) {
    return 'Frissítve: $time';
  }

  @override
  String spotsNextUpdateSeconds(int seconds) {
    return 'Frissítés $seconds mp múlva';
  }

  @override
  String spotsNextUpdateMinutes(int minutes) {
    return 'Frissítés $minutes perc múlva';
  }

  @override
  String get spotsUpdating => 'Frissítés…';

  @override
  String spotsAutoRefreshHint(int seconds) {
    return 'Automatikus frissítés $seconds másodpercenként';
  }

  @override
  String get spotsManualRefreshHint => 'Koppintson a frissítéshez';

  @override
  String coverageResultScope(String km, int count) {
    return '$km-en belül · $count kiértékelve';
  }

  @override
  String get coverageResultRecalculating => 'Újraszámítás';

  @override
  String get offlineBannerMessage => 'Offline vagy: a mentett adatokat látod';

  @override
  String get offlineMapsTitle => 'Offline térképek';

  @override
  String get offlineMapsEntrySubtitle =>
      'Tölts le térképeket kapcsolat nélküli használatra';

  @override
  String get offlineMapsEmpty =>
      'Nincs letöltött régió. Tölts le egy területet, hogy a térképet kapcsolat nélkül is lásd.';

  @override
  String get offlineMapsAddRegion => 'Régió letöltése';

  @override
  String get offlineMapsRegionNameLabel => 'Régió neve';

  @override
  String get offlineMapsRegionNameHint =>
      'Pl. Otthon, Menedékház, SOTA aktiválás';

  @override
  String get offlineMapsRadiusLabel => 'Sugár';

  @override
  String get offlineMapsDownload => 'Letöltés';

  @override
  String get offlineMapsDownloadingStyle => 'Térképstílus letöltése…';

  @override
  String offlineMapsDownloadingTiles(String percent) {
    return 'Térképek letöltése… $percent%';
  }

  @override
  String offlineMapsEstimatedSize(String size) {
    return 'Becsült méret: $size';
  }

  @override
  String get offlineMapsDownloadError =>
      'A letöltés nem sikerült. Próbáld újra.';

  @override
  String get offlineMapsDeleteError => 'A törlés nem sikerült. Próbáld újra.';

  @override
  String get offlineMapsDeleteConfirmTitle => 'Törlöd a régiót?';

  @override
  String offlineMapsDeleteConfirmMessage(String name) {
    return '„$name” többé nem lesz elérhető offline.';
  }

  @override
  String get offlineMapsDeleteConfirm => 'Törlés';

  @override
  String offlineMapsRegionSubtitle(String radius, String size) {
    return 'Sugár: $radius · $size';
  }

  @override
  String get offlineMapsIncomplete => 'Befejezetlen letöltés';

  @override
  String get offlineMapsResume => 'Folytatás';

  @override
  String get offlineMapsCenterInfo =>
      'A régió a jelenlegi helyzeted köré lesz központosítva.';

  @override
  String get dashboardOfflineTitle => 'Offline vagy';

  @override
  String get dashboardOfflineMessage =>
      'Ehhez a területhez nincs mentett adat. A mentett helyeid és a letöltött térképek továbbra is elérhetők.';

  @override
  String get offlineMapsCenterMine => 'Saját helyzetem';

  @override
  String get offlineMapsCenterSearch => 'Hely keresése';

  @override
  String get offlineMapsCenterSearchInfo =>
      'Keress egy várost vagy helyet: a régió oda lesz középre igazítva.';

  @override
  String offlineMapsCenterSelected(String label) {
    return 'Közép: $label';
  }

  @override
  String get changelog120OfflineMode =>
      'Offline mód: átjátszók, kedvencek, profil, lefedettség és elérhetőség hálózat nélkül is elérhető (PRO)';

  @override
  String get changelog120OfflineMaps =>
      'Offline térképek: töltsd le a környéked vagy egy tetszőleges helyet, és használd kapcsolat nélkül (PRO)';

  @override
  String get changelog120CoverageSearch =>
      'Lefedettség keresése bármely pontról: keress egy helyet, illessz be koordinátákat vagy nyomd hosszan a térképet, és nézd meg, mit érsz el onnan';

  @override
  String get changelog120SavedStations =>
      'Állomásaim: mentsd el a fontos pontokat, és nézd meg őket offline is (PRO)';

  @override
  String get changelog120SpotsRefresh =>
      'A SOTA és POTA spotok percenként maguktól frissülnek, módonként színes jelvényekkel (CW, SSB, FT8…)';

  @override
  String get changelog120NoNetwork =>
      'Kapcsolat nélkül az app azonnal indul, megmutatja, mi érhető el, és letiltja a hálózatot igénylő műveleteket';

  @override
  String get changelog130ImperialUnits =>
      'Mérföld és láb: az alkalmazás mostantól követi a készülék mértékegységeit, a rendszert a Beállításokban is kiválaszthatod';

  @override
  String get profileUnitSystemAutoShort => 'Auto';
}
