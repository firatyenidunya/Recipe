# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
inhibit_all_warnings!

def recipe_pods
  pod 'SDWebImage', '5.0' # Asynchronous image downloader with cache support as a UIImageView category
  pod 'DisplaySwitcher', '~> 2.0' # Custom transition between two collection view layouts
  pod 'RxSwift', '6.2.0' # Reactive programming in swift
  pod 'RxCocoa' # Reactive programming in swift
  pod "Resolver", '1.5.0' # Dependency Injection / Service Locator framework
end

target 'Recipe' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Recipe
  recipe_pods

  target 'RecipeTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxTest' # Provides testing capabilities for Rx-based systems. It depends on RxSwift.
    pod 'RxSwift', '6.2.0' # Reactive programming in swift
  end

  target 'RecipeUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
