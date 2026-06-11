// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;
import 'package:start_it_up/layer_fonctional/objectif/data/dto/objectif_dto.dart'
    as _i4;
import 'package:start_it_up/layer_fonctional/objectif/domain/entity/objectif.dart'
    as _i5;
import 'package:start_it_up/layer_fonctional/project/data/dto/project_dto.dart'
    as _i2;
import 'package:start_it_up/layer_fonctional/project/domain/entity/project.dart'
    as _i3;
import 'package:start_it_up/layer_technical/version/data/dto/version_dto.dart'
    as _i6;
import 'package:start_it_up/layer_technical/version/domain/version.dart' as _i7;

/// {@template package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
/// Available mappings:
/// - `ProjectDto` → `Project`.
/// - `Project` → `ProjectDto`.
/// - `ObjectifDto` → `Objectif`.
/// - `Objectif` → `ObjectifDto`.
/// - `VersionDto` → `Version`.
/// - `Version` → `VersionDto`.
/// {@endtemplate}
class $ProjectMapper implements _i1.AutoMapprInterface {
  const $ProjectMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.ProjectDto>() ||
            sourceTypeOf == _typeOf<_i2.ProjectDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Project>() ||
            targetTypeOf == _typeOf<_i3.Project?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Project>() ||
            sourceTypeOf == _typeOf<_i3.Project?>()) &&
        (targetTypeOf == _typeOf<_i2.ProjectDto>() ||
            targetTypeOf == _typeOf<_i2.ProjectDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.ObjectifDto>() ||
            sourceTypeOf == _typeOf<_i4.ObjectifDto?>()) &&
        (targetTypeOf == _typeOf<_i5.Objectif>() ||
            targetTypeOf == _typeOf<_i5.Objectif?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.Objectif>() ||
            sourceTypeOf == _typeOf<_i5.Objectif?>()) &&
        (targetTypeOf == _typeOf<_i4.ObjectifDto>() ||
            targetTypeOf == _typeOf<_i4.ObjectifDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.VersionDto>() ||
            sourceTypeOf == _typeOf<_i6.VersionDto?>()) &&
        (targetTypeOf == _typeOf<_i7.Version>() ||
            targetTypeOf == _typeOf<_i7.Version?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i7.Version>() ||
            sourceTypeOf == _typeOf<_i7.Version?>()) &&
        (targetTypeOf == _typeOf<_i6.VersionDto>() ||
            targetTypeOf == _typeOf<_i6.VersionDto?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(model, onMappingError: onMappingError);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model, onMappingError: onMappingError);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
        (item) => _safeConvert(item, onMappingError: onMappingError),
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.ProjectDto>() ||
            sourceTypeOf == _typeOf<_i2.ProjectDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Project>() ||
            targetTypeOf == _typeOf<_i3.Project?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$ProjectDto_To__i3$Project((model as _i2.ProjectDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Project>() ||
            sourceTypeOf == _typeOf<_i3.Project?>()) &&
        (targetTypeOf == _typeOf<_i2.ProjectDto>() ||
            targetTypeOf == _typeOf<_i2.ProjectDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Project_To__i2$ProjectDto((model as _i3.Project?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.ObjectifDto>() ||
            sourceTypeOf == _typeOf<_i4.ObjectifDto?>()) &&
        (targetTypeOf == _typeOf<_i5.Objectif>() ||
            targetTypeOf == _typeOf<_i5.Objectif?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$ObjectifDto_To__i5$Objectif((model as _i4.ObjectifDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.Objectif>() ||
            sourceTypeOf == _typeOf<_i5.Objectif?>()) &&
        (targetTypeOf == _typeOf<_i4.ObjectifDto>() ||
            targetTypeOf == _typeOf<_i4.ObjectifDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$Objectif_To__i4$ObjectifDto((model as _i5.Objectif?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.VersionDto>() ||
            sourceTypeOf == _typeOf<_i6.VersionDto?>()) &&
        (targetTypeOf == _typeOf<_i7.Version>() ||
            targetTypeOf == _typeOf<_i7.Version?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$VersionDto_To__i7$Version((model as _i6.VersionDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i7.Version>() ||
            sourceTypeOf == _typeOf<_i7.Version?>()) &&
        (targetTypeOf == _typeOf<_i6.VersionDto>() ||
            targetTypeOf == _typeOf<_i6.VersionDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i7$Version_To__i6$VersionDto((model as _i7.Version?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(model, canReturnNull: true);
    }
    try {
      return _convert(model, canReturnNull: true);
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:start_it_up/layer_fonctional/project/data/mapper/project_mapper.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return true;
  }

  _i3.Project _map__i2$ProjectDto_To__i3$Project(_i2.ProjectDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping ProjectDto → Project failed because ProjectDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<ProjectDto, Project> to handle null values during mapping.',
      );
    }
    return _i3.Project(
      id: model.id,
      name: model.name,
      version: _map__i6$VersionDto_To__i7$Version(model.version),
      listObjectif: model.objectifs
          .map<_i5.Objectif>(
            (value) => _map__i4$ObjectifDto_To__i5$Objectif(value),
          )
          .toList(),
    );
  }

  _i2.ProjectDto _map__i3$Project_To__i2$ProjectDto(_i3.Project? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping Project → ProjectDto failed because Project was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<Project, ProjectDto> to handle null values during mapping.',
      );
    }
    return _i2.ProjectDto(
      id: model.id,
      name: model.name,
      version: _map__i7$Version_To__i6$VersionDto(model.version),
      objectifs: model.listObjectif
          .map<_i4.ObjectifDto>(
            (value) => _map__i5$Objectif_To__i4$ObjectifDto(value),
          )
          .toList(),
    );
  }

  _i5.Objectif _map__i4$ObjectifDto_To__i5$Objectif(_i4.ObjectifDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping ObjectifDto → Objectif failed because ObjectifDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<ObjectifDto, Objectif> to handle null values during mapping.',
      );
    }
    return _i5.Objectif(
      id: model.id,
      title: model.title,
      description: model.description,
      deadline: model.deadline,
      status: model.status,
    );
  }

  _i4.ObjectifDto _map__i5$Objectif_To__i4$ObjectifDto(_i5.Objectif? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping Objectif → ObjectifDto failed because Objectif was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<Objectif, ObjectifDto> to handle null values during mapping.',
      );
    }
    return _i4.ObjectifDto(
      id: model.id,
      title: model.title,
      description: model.description,
      deadline: model.deadline,
      status: model.status,
    );
  }

  _i7.Version _map__i6$VersionDto_To__i7$Version(_i6.VersionDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping VersionDto → Version failed because VersionDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<VersionDto, Version> to handle null values during mapping.',
      );
    }
    return _i7.Version(
      major: model.major,
      minor: model.minor,
      patch: model.patch,
    );
  }

  _i6.VersionDto _map__i7$Version_To__i6$VersionDto(_i7.Version? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping Version → VersionDto failed because Version was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<Version, VersionDto> to handle null values during mapping.',
      );
    }
    return _i6.VersionDto(
      major: model.major,
      minor: model.minor,
      patch: model.patch,
    );
  }
}
