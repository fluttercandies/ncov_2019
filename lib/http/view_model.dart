class ViewModel {
  List dataListToModel(List<dynamic> data, model) {
    List list = new List();

    data.forEach((json) => list.add(model.fromJson(json)));

    return list;
  }
}
