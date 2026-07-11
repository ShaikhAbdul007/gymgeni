import 'dart:io';
import 'dart:typed_data';

import 'package:gymgeni/data/networking.dart';
import 'package:gymgeni/module/member/model/members_model.dart';

import '../data/apiendpoint.dart';
import '../module/member/model/create_member_model.dart';

class MemberRepo {
  final networking = Networking();

  Future<MembersModel> getMemberData({required String memberStatus}) async {
    try {
      var res = await networking.getData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.getMembers}$memberStatus',
      );
      return MembersModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<CreateMemberModel> createMemberData({
    required dynamic body,
    String? fileField,
    File? file,
    Uint8List? fileBytes,
    String? fileName,
  }) async {
    try {
      var res = await networking.postMultipartRequestData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createMember}',
        body: body,
        file: file,
        fileBytes: fileBytes,
        fileField: fileField,
        fileName: fileName,
      );
      return CreateMemberModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<CreateMemberModel> deleteMemberData({
    required Map<String, dynamic> body,
  }) async {
    try {
      var res = await networking.deleteData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.deleteMember}',
        body: body,
      );
      return CreateMemberModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<CreateMemberModel> updateMemberData({
    required dynamic body,
    String? fileField,
    File? file,
    Uint8List? fileBytes,
    String? fileName,
  }) async {
    try {
      var res = await networking.postMultipartRequestData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.createMember}',
        method: 'PUT',
        body: body,
        file: file,
        fileBytes: fileBytes,
        fileField: fileField,
        fileName: fileName,
      );
      return CreateMemberModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<CreateMemberModel> transferMember({required Map<String, dynamic> body}) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}members/transfer',
        body: body,
      );
      return CreateMemberModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<CreateMemberModel> freezeMember({required Map<String, dynamic> body}) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}${ApiEndPoint.freezeMember}',
        body: body,
      );
      return CreateMemberModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }

  Future<CreateMemberModel> unFreezeMember({required Map<String, dynamic> body}) async {
    try {
      var res = await networking.postData(
        url: '${ApiEndPoint.fullBaseUrl}members/unfreeze',
        body: body,
      );
      return CreateMemberModel.fromJson(res);
    } catch (e) {
      return throw (e);
    }
  }
}

