class AccessibilityPageController < ApplicationController
    layout "accessibility-statement"

    def show; 
        render template: "layouts/accessibility-statement"
    end
    
  end
  