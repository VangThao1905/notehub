// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:notehub_app/application/auth/auth_cubit.dart' as _i516;
import 'package:notehub_app/domain/auth/i_auth_repo.dart' as _i228;
import 'package:notehub_app/infrastructure/auth/auth_repo_impl.dart' as _i638;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i516.AuthCubit>(() => _i516.AuthCubit());
    gh.factory<_i228.IAuthRepo>(() => _i638.AuthRepoImpl());
    return this;
  }
}
