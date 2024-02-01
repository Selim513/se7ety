import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety_app_1/features/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(initAuth());
  //--------------Login----------------
  Login(String email, String password) async {
    emit(LoadingLoginAuth());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SuccessLoginAuth());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(ErrorLoginAuth(Error: 'لقد ادخلت كلمه مرور ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorLoginAuth(Error: 'لقد ادلخت حساب موجود بالفعل .'));
      }
    } catch (e) {
      emit(ErrorLoginAuth(Error: 'لقد حدث خطاء حاول لاحقا'));
    }
  }

//-----------------register----------------
  registerAsDoctor(String name, String password, String email) async {
    emit(LoadingRegisterAuth());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      await user.updateDisplayName(name);
      FirebaseFirestore.instance.collection('Doctors').doc(user.uid).set({
        'id': user.uid,
        'name': name,
        'specialization': null,
        'rating': null,
        'email': user.email,
        'phone1': null,
        'phone2': null,
        'bio': null,
        'openHour': null,
        'closeHour': null,
        'address': null,
      }, SetOptions(merge: true));

      emit(SuccessRegisterAuth());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(ErrorRegisterAuth(Error: 'لقد ادخلت كلمه مرور ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorRegisterAuth(Error: 'لقد ادلخت حساب موجود بالفعل .'));
      }
    } catch (e) {
      emit(ErrorRegisterAuth(Error: 'لقد حدث خطاء حاول لاحقا'));
    }
  }

  //----------------------register for patients------------------------
  registerForPatients(String email, String password, String name) async {
    emit(PatientLoadingRegisterAuth());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      await user.updateDisplayName(name);
      FirebaseFirestore.instance.collection('Patients').doc(user.uid).set({
        "name": name,
        "image": null,
        "age": null,
        "email": email,
        "phone": null,
        "city": null,
        "bio": null,
      }, SetOptions(merge: true));

      emit(PatientSuccessRegisterAuth());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(PatientErrorRegisterAuth(Error: 'لقد ادخلت كلمه مرور ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        emit(PatientErrorRegisterAuth(Error: 'لقد ادلخت حساب موجود بالفعل .'));
      }
    } catch (e) {
      emit(PatientErrorRegisterAuth(Error: 'لقد حدث خطاء حاول لاحقا'));
    }
  }
}
