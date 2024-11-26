import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:watch_store/data/constant.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    emit(LoggedInState());
  }

  Dio _dio = Dio();

  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      await _dio
          .post(Endpoints.sendSms, data: {"mobile": mobile}).then((value) {
        debugPrint(value.data.toString());
        if (value.statusCode == 201) {
          emit(SentState(mobile: mobile));
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }

  verifyCode(String mobile, String code) async {
    emit(LoadingState());
    try {
      await _dio.post(Endpoints.checkSmsCode,
          data: {"mobile": mobile, "code": code}).then((value) {
        debugPrint(value.data.toString());
        if (value.statusCode == 201) {
          if (value.data["data"]["is_registered"]) {
            emit(VerifyedIsRegisteredState());
          } else {
            emit(VerifyedNotRegisteredState());
          }
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }

  registration() async {}
  logOut() async {}
}
