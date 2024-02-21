class Page
  include ActiveModel::Model

  attr_accessor :slug, :title, :body, :menu_title, :parent_path, :hero_attributes, :card_attributes

  def full_path
    ["/", parent_path, slug].join("/").squeeze("/")
  end

  def meta_description
    'placeholder'
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

    attr_accessor :slug, :image_id, :title, :body, :parent_path, :subpages

    def path
      [parent_path, slug].join("/")
    end

    def meta_description
      'card description'
    end

    def thumbnail
      OpenStruct.new(
        url: 'https://placehold.co/380x254/347ca9/FFFFFF/png',
        description: 'A placeholder picture',
        title: 'Title for a placeholder picture',
      )
    end
  end
end
