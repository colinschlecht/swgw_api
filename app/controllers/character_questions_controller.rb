class CharacterQuestionsController < ApplicationController

    def index
        characterquestions = CharacterQuestion.all
        render json: characterquestions
    end
end
