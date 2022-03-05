class API {
  static const baseUrl = 'https://tijarat.devcaptain.com';
  static const login = '$baseUrl/api/login';
  static const signUp = '$baseUrl/api/register';
  static const getPostList = '$baseUrl/api/post/';
  static const getCategory = '$baseUrl/api/category-list/';
  static const getTopRatePost = '$baseUrl/api/get-to-rates-post/';
  static const getProductFactoryList = '$baseUrl/api/get-factory-by-product/';
  static getProduct(String categoryID) {
    return '$baseUrl/api/category-products/$categoryID/';
  }

  static const createPost = '$baseUrl/api/post/';
}
