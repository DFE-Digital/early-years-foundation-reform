class Page
  include ActiveModel::Model

  attr_accessor :slug, :title, :body, :menu_title, :parent_path, :hero_attributes, :card_attributes

  def full_path
    ["/", parent_path, slug].join("/").squeeze("/")
  end

  def cards
    if card_attributes.present?
      card_attributes.map { |attrs| Card.new(attrs) }
    else
      []
    end
  end

  def hero
    Hero.new(hero_attributes)
  end

  class Hero
    include ActiveModel::Model

    attr_accessor :title, :body
  end

  class Card
    include ActiveModel::Model

    attr_accessor :slug, :image_id, :title, :body, :thumbnail, :parent_path, :subpages

    def path
      [parent_path, slug].join("/")
    end

    def asset
      @asset = if image_id.blank?
                 default_asset
               else
                 Asset.new(id: image_id)
               end
    end

    def default_asset
      @default_asset ||= Asset.new(id: '706uv3PhtBRxqRffZKa2b3')
    end
  end
end
