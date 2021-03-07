class CharacterQuestionsController < ApplicationController

    def index
        CharacterQuestions = CharacterQuestions.all
        render json: CharacterQuestions
    end
end
