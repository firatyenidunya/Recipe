Recipe
=== 

Table of Contents
-----

- [Setup](#Setup)
- [Project Architecture](#project-architecture)
- [Project Structure](#project-structure)
- [Unit Test](#unit-test)
- [Features](#features)
- [Things to Do](#things-to-do)
- [Dependency Management](#dependency-management)
- [List of Frameworks](#list-of-frameworks)


### Setup

Open Recipe.xcworkspace and run. There is no any other steps.


### Project Architecture

The app architecture is MVVM + Repository Pattern. Let's see in a simple usage,
    
    ViewController 
        -> ViewModel
            -> Repository 
                -> DataSource (RemoteDataSource || LocalDataSource)
                    -> Service (RemoteService || LocalService)
                        
- ViewModel: Receives information from ViewController and handles it. Interacts with repositories.
- Repository: Gets  data from RemoteDataSource or LocalDataSource and converts it to UIModel then sends it to the ViewModel.
- LocalDataSource: Gets data from local service and sends it to the repository.
- RemoteDataSource: Gets data from remote service and sends it to the repository. It can include more then one service and things like merging two reqeusts can be done here.


### Project Structure

| Folder             | Description                                          |
|-------------------------|-------------------------------------------------------|
|**Application**|  Everything that runs in AppDelegate or SceneDelegate will be defined here.|
|**DependencyRegistrations**| Registrations of the classes will be defined here.|
|**Base**| BaseViewModel, BaseViewController etc...|
|**Scenes** | Application related scenes will be defined here, such as viewcontrollers, xibs...|
|**Network**| Anything related with remote connection will be defined here.|
|**CoreData**| Includes all local data storage.|
|**Data**| Includes all data integration classes. Also UIModels and ResponseModels will be defined here.|
|**Utility**| All utilities.|
|**Resources**| Color, Icon, and Image Assets will be defined here.|


### Unit Test

You can find unit tests under RecipeTests. Current test coverage is %65.


### Features

Basic functionalities are explained here. Recipe app also supports dark mode.

| Feature             | Description                                          | ViewController |
|-------------------------|-------------------------------------------------------|---------------------|
|**Listing All Collections**| Lists all collections as grid or list| CollectionsViewController|
|**Listing All Recipes**| Lists all recipies. User can add a recipe to favorites or remove it from favorites.|RecipesViewController|
|**Listing Favorited Recipies**| Lists all favorited recipies. User can remove a recipe from favorited list.| FavoritesViewController|


### Things to Do 

- Remove Resolver library and write a custom dependency injection with propertyWrappers.
- RecipeDetail screen.
- Protocol oriented router development for navigating between screens.
- Adding some UITests.
- Error management and progress indicator.


### Dependency Management

Cocoapods is the dependency manager for this project.


### List of Frameworks
| Dependency             | Description                                          |
|-------------------------|-------------------------------------------------------|
|**SDWebImage**| Asynchronous image downloader with cache support as a UIImageView category|
|**DisplaySwitcher**| Custom transition between two collection view layouts|
|**RxSwift**| Reactive programming in swift|
|**RxCocoa**| Reactive programming in swift|
|**Resolver**| Dependency Injection / Service Locator framework|
