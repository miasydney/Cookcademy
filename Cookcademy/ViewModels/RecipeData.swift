//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Mia on 13/4/2023.
//

import Foundation

class RecipeData: ObservableObject {
    // recipes monitors when Recipe.testRecipes changes
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
      var filteredRecipes = [Recipe]()
      for recipe in recipes {
        if recipe.mainInformation.category == category {
          filteredRecipes.append(recipe)
        }
      }
        return filteredRecipes
    }
    
    // Adds a new recipe
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
        }
    }
}
