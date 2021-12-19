# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def recipe_pods
  pod 'NVActivityIndicatorView', '5.1.1' # NVActivityIndicatorView is a collecion of loading animations.
  pod 'RxSwift', '6.2.0' # Reactive programming in swift
  pod "Resolver", '1.5.0' # Dependency Injection / Service Locator framework
end

target 'Recipe' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Recipe
  recipe_pods

  # Pods for Recipe

  target 'RecipeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'RecipeUITests' do
    # Pods for testing
  end

end
