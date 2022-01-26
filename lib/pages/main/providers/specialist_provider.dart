import 'package:flutter/cupertino.dart';
import 'package:location_specialist/helpers/interface/abstract_paginator.dart';
import 'package:location_specialist/helpers/models/base/base_provider.dart';
import 'package:location_specialist/helpers/models/specialist/specialist.dart';
import 'package:location_specialist/helpers/models/specialist/specialist_paginate.dart';
import 'package:location_specialist/repository/specialist/specialist_repository.dart';

class SpecialistProvider extends BaseProvider implements AbstractPaginator {
  late SpecialistPaginate _paginate = new SpecialistPaginate();
  List<Specialist> _specialists = [];
  List<Specialist> get specialists => _specialists;
  SpecialistPaginate get paginate => _paginate;

  set paginate(SpecialistPaginate paginate) {
    _paginate = paginate;
    _specialists.addAll(paginate.list);
    notifyListeners();
  }

  @override
  initAsync() async {
    this.paginate = await SpecialistRepository().specialistList();
  }

  Future refresh() async {
    this._paginate = await SpecialistRepository().specialistList();
    this._specialists = this._paginate.list;
    notifyListeners();
  }

  @override
  bool get loading => this.paginate.loading;

  @override
  bool get next => this.paginate.next.isEmpty;

  @override
  void nextPage() async {
    this.paginate =
        await SpecialistRepository().specialistListPaginate(paginate.next);
  }
}
