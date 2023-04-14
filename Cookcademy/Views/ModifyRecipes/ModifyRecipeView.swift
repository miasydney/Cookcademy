//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Mia on 14/4/2023.
//

import SwiftUI

struct ModifyRecipeView: View {
    // Binding recipe property
    @Binding var recipe: Recipe
    
    var body: some View {
        // When tapped populates the recipe with simple test data
        Button("Fill in the recipe with test data.") {
            recipe.mainInformation = MainInformation(name: "test", description: "test", author: "test", category: .breakfast)
            recipe.directions = [Direction(description: "test", isOptional: false)]
            recipe.ingredients = [Ingredient(name: "test", quantity: 1.0, unit: .none)]
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
