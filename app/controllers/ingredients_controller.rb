class IngredientsController < ApplicationController
    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
          redirect_to @ingredient
        else
          render 'new'
        end
    end

    def edit
    @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        @ingredient.update(name: params[:ingredient][:name])
        redirect_to ingredient_path(@ingredient)
    end
    def show 
        @ingredient = Ingredient.find(params[:id])
    end
    

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
