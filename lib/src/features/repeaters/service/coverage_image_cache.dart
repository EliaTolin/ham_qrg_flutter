import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coverage_image_cache.g.dart';

/// Archivio locale dei PNG di copertura.
///
/// Il payload di `/coverage` contiene solo l'URL (firmato) del PNG: cacharne il
/// JSON non basta per l'offline, e `TileStore` di Mapbox non copre le
/// `ImageSource`. Qui il PNG viene scaricato al momento della risposta fresca
/// e il modello cachato punta al file locale (`file://`), così online e
/// offline la mappa di copertura legge dallo stesso posto — immune anche alla
/// scadenza dell'URL firmato.
///
/// I file vivono in Application Support (non nei Documents visibili
/// all'utente) e si eliminano solo con [clearAll], invocato quando decade
/// l'entitlement Pro.
class CoverageImageCache {
  CoverageImageCache(this._dio);

  final Dio _dio;

  static const _dirName = 'coverage_cache';

  Future<Directory> _ensureDir() async {
    final support = await getApplicationSupportDirectory();
    final dir = Directory('${support.path}/$_dirName');
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  /// Scarica [url] e restituisce l'URI `file://` del PNG salvato.
  /// Il nome del file deriva dalla chiave di cache, così la stessa richiesta
  /// sovrascrive sempre lo stesso file.
  Future<String> download({
    required String url,
    required String cacheKey,
  }) async {
    final dir = await _ensureDir();
    final name = sha1.convert(utf8.encode(cacheKey)).toString();
    final file = File('${dir.path}/$name.png');
    final response = await _dio.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    await file.writeAsBytes(response.data!, flush: true);
    return file.uri.toString();
  }

  /// Elimina l'intero archivio (decadenza Pro).
  Future<void> clearAll() async {
    final support = await getApplicationSupportDirectory();
    final dir = Directory('${support.path}/$_dirName');
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
  }
}

/// Istanza unica dell'archivio PNG: condivisa fra il datasource di coverage e
/// il watcher che la svuota alla decadenza dell'entitlement.
@Riverpod(keepAlive: true)
CoverageImageCache coverageImageCache(Ref ref) => CoverageImageCache(Dio());
