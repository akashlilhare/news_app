import 'package:news_app/models/categori_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> myCategories = [];
  CategoryModel categorieModel;

  //1
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Business";
    categorieModel.imageAssetUrl = "https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    myCategories.add(categorieModel);

    //2
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Entertainment";
    categorieModel.imageAssetUrl = "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    myCategories.add(categorieModel);

    //3
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "General";
    categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
    myCategories.add(categorieModel);

    //4
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Health";
    categorieModel.imageAssetUrl = "https://images.pexels.com/photos/4117545/pexels-photo-4117545.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    myCategories.add(categorieModel);

    //5
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Science";
    categorieModel.imageAssetUrl = "https://images.pexels.com/photos/2034892/pexels-photo-2034892.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    myCategories.add(categorieModel);

    //6
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Sports";
    categorieModel.imageAssetUrl = "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
    myCategories.add(categorieModel);

    //7
    categorieModel = new CategoryModel();
    categorieModel.categoryName = "Technology";
    categorieModel.imageAssetUrl = "https://images.pexels.com/photos/3912981/pexels-photo-3912981.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    myCategories.add(categorieModel);

    return myCategories;
}

List<CategoryModel> getDrawerCategories(){

  List<CategoryModel> myCategories = [];
  CategoryModel categorieModel;

  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Home";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80";
  myCategories.add(categorieModel);

  //1
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Business";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Entertainment";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "General";
  categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Health";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/4117545/pexels-photo-4117545.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Science";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/2034892/pexels-photo-2034892.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  //6
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Sports";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
  myCategories.add(categorieModel);

  //7
  categorieModel = new CategoryModel();
  categorieModel.categoryName = "Technology";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/3912981/pexels-photo-3912981.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);

  categorieModel = new CategoryModel();
  categorieModel.categoryName = "About app";
  categorieModel.imageAssetUrl = "https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  myCategories.add(categorieModel);
  return myCategories;
}
