//
//  ContentView.swift
//  Cookcademy
//
//  Created by Mia on 13/4/2023.
//

import SwiftUI

struct RecipesListView: View {
    // create an instance of the view model
    // needs state to update view when the model changes
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        List {
          ForEach(recipes) { recipe in
              NavigationLink(recipe.mainInformation.name,
              destination: RecipeDetailView(recipe: recipe))
          }
        }
        .navigationTitle(navigationTitle)
      }
    }
     
    extension RecipesListView {
      var recipes: [Recipe] {
        recipeData.recipes
      }
     
      var navigationTitle: String {
        "All Recipes"
      }
    }

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
    }
}
