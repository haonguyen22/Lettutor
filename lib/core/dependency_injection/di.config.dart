// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../data/datasource/remote/auth/auth_service.dart' as _i9;
import '../../data/datasource/remote/tutor/tutor_service.dart' as _i7;
import '../../data/datasource/remote/user/user_service.dart' as _i8;
import '../../data/repositories/auth_repository_impl.dart' as _i17;
import '../../data/repositories/tutor_repository_impl.dart' as _i11;
import '../../data/repositories/user_repository_impl.dart' as _i14;
import '../../domain/repositories/auth_repository.dart' as _i16;
import '../../domain/repositories/tutor_repository.dart' as _i10;
import '../../domain/repositories/user_repository.dart' as _i13;
import '../../domain/usecase/auth_usecase.dart' as _i18;
import '../../domain/usecase/shared_preferences_usecase.dart' as _i4;
import '../../domain/usecase/tutor_usecase.dart' as _i12;
import '../../domain/usecase/user_usecase.dart' as _i15;
import '../../presentation/app_setting/bloc/app_setting_bloc.dart' as _i5;
import '../../presentation/auth/bloc/auth_bloc.dart' as _i20;
import '../../presentation/home/view/tab/home/bloc/tutor_bloc.dart' as _i19;
import 'modules/service_modules.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModules = _$ServiceModules();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => serviceModules.prefs,
      preResolve: true,
    );
    gh.singleton<_i4.SharedPreferencesUseCase>(
        _i4.SharedPreferencesUseCase(gh<_i3.SharedPreferences>()));
    gh.factory<String>(
      () => serviceModules.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i5.AppSettingBloc>(
        () => _i5.AppSettingBloc(gh<_i4.SharedPreferencesUseCase>()));
    gh.lazySingleton<_i6.Dio>(
        () => serviceModules.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i7.TutorService>(() => _i7.TutorService(gh<_i6.Dio>()));
    gh.factory<_i8.UserService>(() => _i8.UserService(gh<_i6.Dio>()));
    gh.factory<_i9.AuthService>(() => _i9.AuthService(gh<_i6.Dio>()));
    gh.factory<_i10.TutorRepository>(
        () => _i11.TutorRepositoryImpl(gh<_i7.TutorService>()));
    gh.factory<_i12.TutorUseCase>(
        () => _i12.TutorUseCase(gh<_i10.TutorRepository>()));
    gh.factory<_i13.UserRepository>(
        () => _i14.UserRepositoryImplement(gh<_i8.UserService>()));
    gh.factory<_i15.UserUseCase>(
        () => _i15.UserUseCase(gh<_i13.UserRepository>()));
    gh.factory<_i16.AuthRepository>(
        () => _i17.AuthRepositoryImpl(gh<_i9.AuthService>()));
    gh.factory<_i18.AuthUseCase>(() => _i18.AuthUseCase(
          gh<_i16.AuthRepository>(),
          gh<_i3.SharedPreferences>(),
        ));
    gh.factory<_i19.TutorBloc>(() => _i19.TutorBloc(gh<_i12.TutorUseCase>()));
    gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(
          gh<_i18.AuthUseCase>(),
          gh<_i15.UserUseCase>(),
        ));
    return this;
  }
}

class _$ServiceModules extends _i21.ServiceModules {}
