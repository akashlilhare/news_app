import 'package:news_app/models/categori_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> myCategories = List<CategoryModel>();
  CategoryModel categorieModel;

  //1
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Business";
    categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
    myCategories.add(categorieModel);

    //2
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Entertainment";
    categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
    myCategories.add(categorieModel);

    //3
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "General";
    categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
    myCategories.add(categorieModel);

    //4
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Health";
    categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
    myCategories.add(categorieModel);

    //5
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Science";
    categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
    myCategories.add(categorieModel);

    //6
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Sports";
    categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
    myCategories.add(categorieModel);

    //7
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Technology";
    categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
    myCategories.add(categorieModel);

    return myCategories;
}