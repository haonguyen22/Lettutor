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

import '../../data/datasource/remote/auth/auth_service.dart' as _i10;
import '../../data/datasource/remote/course/course_service.dart' as _i11;
import '../../data/datasource/remote/schedule/schedule_service.dart' as _i7;
import '../../data/datasource/remote/tutor/tutor_service.dart' as _i8;
import '../../data/datasource/remote/user/user_service.dart' as _i9;
import '../../data/repositories/auth_repository_impl.dart' as _i22;
import '../../data/repositories/course_repository_impl.dart' as _i25;
import '../../data/repositories/schedule_repository_impl.dart' as _i13;
import '../../data/repositories/tutor_repository_impl.dart' as _i16;
import '../../data/repositories/user_repository_impl.dart' as _i19;
import '../../domain/entities/tutor.dart' as _i31;
import '../../domain/repositories/auth_repository.dart' as _i21;
import '../../domain/repositories/course_repository.dart' as _i24;
import '../../domain/repositories/schedule_repository.dart' as _i12;
import '../../domain/repositories/tutor_repository.dart' as _i15;
import '../../domain/repositories/user_repository.dart' as _i18;
import '../../domain/usecase/auth_usecase.dart' as _i23;
import '../../domain/usecase/course_usecase.dart' as _i26;
import '../../domain/usecase/schedule_usecase.dart' as _i14;
import '../../domain/usecase/shared_preferences_usecase.dart' as _i4;
import '../../domain/usecase/tutor_usecase.dart' as _i17;
import '../../domain/usecase/user_usecase.dart' as _i20;
import '../../presentation/app_setting/bloc/app_setting_bloc.dart' as _i5;
import '../../presentation/auth/bloc/auth_bloc.dart' as _i32;
import '../../presentation/home/course_tab/bloc/course_bloc.dart' as _i33;
import '../../presentation/home/home_tab/bloc/tutor_bloc.dart' as _i29;
import '../../presentation/home/tutor_tab/bloc/search_tutor_bloc.dart' as _i28;
import '../../presentation/schedule/history/bloc/history_bloc.dart' as _i27;
import '../../presentation/tutor/bloc/tutor_detail_bloc.dart' as _i30;
import 'modules/service_modules.dart' as _i34;

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
    gh.factory<_i7.ScheduleService>(() => _i7.ScheduleService(gh<_i6.Dio>()));
    gh.factory<_i8.TutorService>(() => _i8.TutorService(gh<_i6.Dio>()));
    gh.factory<_i9.UserService>(() => _i9.UserService(gh<_i6.Dio>()));
    gh.factory<_i10.AuthService>(() => _i10.AuthService(gh<_i6.Dio>()));
    gh.factory<_i11.CourseService>(() => _i11.CourseService(gh<_i6.Dio>()));
    gh.factory<_i12.ScheduleRepository>(
        () => _i13.ScheduleRepositoryImpl(gh<_i7.ScheduleService>()));
    gh.factory<_i14.ScheduleUseCase>(
        () => _i14.ScheduleUseCase(gh<_i12.ScheduleRepository>()));
    gh.factory<_i15.TutorRepository>(
        () => _i16.TutorRepositoryImpl(gh<_i8.TutorService>()));
    gh.factory<_i17.TutorUseCase>(
        () => _i17.TutorUseCase(gh<_i15.TutorRepository>()));
    gh.factory<_i18.UserRepository>(
        () => _i19.UserRepositoryImplement(gh<_i9.UserService>()));
    gh.factory<_i20.UserUseCase>(
        () => _i20.UserUseCase(gh<_i18.UserRepository>()));
    gh.factory<_i21.AuthRepository>(
        () => _i22.AuthRepositoryImpl(gh<_i10.AuthService>()));
    gh.factory<_i23.AuthUseCase>(() => _i23.AuthUseCase(
          gh<_i21.AuthRepository>(),
          gh<_i3.SharedPreferences>(),
        ));
    gh.factory<_i24.CourseRepository>(
        () => _i25.CourseRepositoryImpl(gh<_i11.CourseService>()));
    gh.factory<_i26.CourseUseCase>(
        () => _i26.CourseUseCase(gh<_i24.CourseRepository>()));
    gh.factory<_i27.HistoryBloc>(
        () => _i27.HistoryBloc(gh<_i14.ScheduleUseCase>()));
    gh.factory<_i28.SearchTutorBloc>(
        () => _i28.SearchTutorBloc(gh<_i17.TutorUseCase>()));
    gh.factory<_i29.TutorBloc>(() => _i29.TutorBloc(gh<_i17.TutorUseCase>()));
    gh.factoryParam<_i30.TutorDetailBloc, _i31.Tutor, dynamic>((
      tutorParam,
      _,
    ) =>
        _i30.TutorDetailBloc(
          tutorParam,
          gh<_i17.TutorUseCase>(),
        ));
    gh.factory<_i32.AuthBloc>(() => _i32.AuthBloc(
          gh<_i23.AuthUseCase>(),
          gh<_i20.UserUseCase>(),
        ));
    gh.factory<_i33.CourseBloc>(
        () => _i33.CourseBloc(gh<_i26.CourseUseCase>()));
    return this;
  }
}

class _$ServiceModules extends _i34.ServiceModules {}
