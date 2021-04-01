class AccessibilityController < ApplicationController
    layout "accessibility"
  
    def show
      render template: "accessibility"
    end

end
  