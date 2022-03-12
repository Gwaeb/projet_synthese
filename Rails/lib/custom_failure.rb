class CustomFailure < Devise::FailureApp
    def respond
        self.status = 200 
        self.content_type = 'json'
        self.response_body = {"errors" => ["le courriel ou le mot de passe est invalide"], success: false}.to_json
    end
end