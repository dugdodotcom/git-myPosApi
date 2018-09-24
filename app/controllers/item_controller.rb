class ItemController < ApplicationController
    def index
        p "This is environment"
        p ENV['PRIVATE_KEY']
    end
end
