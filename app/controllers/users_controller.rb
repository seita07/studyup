class UsersController < ApplicationController
    def top
        @users = User.all
    end
end
