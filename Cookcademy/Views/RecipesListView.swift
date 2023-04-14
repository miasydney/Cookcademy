//
//  ContentView.swift
//  Cookcademy
//
//  Created by Mia on 13/4/2023.
//

import SwiftUI

struct RecipesListView: View {
    // create an instance of the view model
    // needs envnironment object as its being passed this object
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
          ForEach(recipes) { recipe in
              NavigationLink(recipe.mainInformation.name,
              destination: RecipeDetailView(recipe: recipe))
          }
          .listRowBackground(listBackgroundColor)
          .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
      }
    }
     
extension RecipesListView {
 
  private var recipes: [Recipe] {
    recipeData.recipes(for: category)
  }
 
  private var navigationTitle: String {
    "\(category.rawValue) Recipes"
  }
}
        

struct RecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      RecipesListView(category: .breakfast)
        .environmentObject(RecipeData())
    }
  }
}
