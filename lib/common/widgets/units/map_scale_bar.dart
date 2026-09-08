import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

/// Allinea la scala grafica di Mapbox al sistema di misura scelto.
///
/// La scala è l'unico numero con un'unità che l'app **non disegna**: lo
/// disegna il fornitore della mappa. Restava quindi in chilometri anche con la
/// preferenza su imperiale, ed è esattamente il tipo di superficie dimenticata
/// che rende inaffidabile tutto il resto — l'utente non sa più in quale
/// sistema stia leggendo.
///
/// Va chiamata da `onMapCreated` di ogni mappa che mostra la scala. Le mappe
/// che la disattivano (`ScaleBarSettings(enabled: false)`) non ne hanno
/// bisogno: lì non c'è nulla da allineare.
Future<void> applyUnitAwareScaleBar(
  MapboxMap map, {
  required bool isImperial,
}) =>
    map.scaleBar.updateSettings(ScaleBarSettings(isMetricUnits: !isImperial));
