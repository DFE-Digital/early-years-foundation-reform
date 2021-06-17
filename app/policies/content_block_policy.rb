class ContentBlockPolicy
    attr_reader :user, :content_block

    def initialize(user, content_block)
        @user = user
        @content_block = content_block
    end

    def index?
        true
      end
    
      def show?
        true
      end
    
      def create?
        user.role == "editor"
      end
    
      def new?
        user.role == "editor"
      end
    
      def update?
        user.role == "editor"
      end
    
      def edit?
        user.role == "editor"
      end
    
      def destroy?
        user.role == "editor"
      end

end