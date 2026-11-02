class CategoryModel {
  String id;
  String image = " " ;
  CategoryModel(this.image,this.id);

  static List<CategoryModel> getCategories(){
    return [
      CategoryModel("general","general"),
      CategoryModel("busseniss","business"),
      CategoryModel("sport","sports"),
      CategoryModel("technology","technology"),
      CategoryModel("entertainment","entertainment"),
      CategoryModel("health","health"),
      CategoryModel("sceince","science")
      
    ];
  }
}