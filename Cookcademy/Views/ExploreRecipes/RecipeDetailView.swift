//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Mia on 14/4/2023.
//

import SwiftUI

struct RecipeDetailView: View {
    // recipe provided by RecipesListView
    let recipe: Recipe
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground

    var body: some View {
      VStack {
        // Author
        HStack {
          Text("Author: \(recipe.mainInformation.author)")
            .font(.subheadline)
            .padding()
          Spacer()
        }
        // Description
        HStack {
          Text(recipe.mainInformation.description)
            .font(.subheadline)
            .padding()
          Spacer()
        }
        List {
            // Ingredients
            Section(header: Text("Ingredients")) {
                ForEach(recipe.ingredients.indices, id: \.self) { index in
                    let ingredient = recipe.ingredients[index]
                    Text(ingredient.description)
                        .foregroundColor(listTextColor)
                }
            }
            // Directions
            Section(header: Text("Directions")) {
                ForEach(recipe.directions.indices, id: \.self) { index in
                    let direction = recipe.directions[index]
                    HStack {
                        Text("\(index + 1). ").bold()
                        Text("\(direction.isOptional ? "(Optional) " : "")"
                             + "\(direction.description)")
                    }.foregroundColor(listTextColor)
                }
            }.listRowBackground(listBackgroundColor)
        }
      }
      .navigationTitle(recipe.mainInformation.name)
    }
  }


struct RecipeDetailView_Previews: PreviewProvider {
    @State static var recipe = Recipe.testRecipes[0]
    static var previews: some View {
        NavigationView {
              RecipeDetailView(recipe: recipe)
            }
    }
}
