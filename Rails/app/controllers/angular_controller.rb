class AngularController < ActionController::Base
    def index
        render file: "public/index.html", layout: false
    end
end
