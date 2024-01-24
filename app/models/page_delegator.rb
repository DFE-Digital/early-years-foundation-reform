class PageDelegator < SimpleDelegator
  def hero
    Hero.new(title: title, body: intro)
  end

  def body
    GovspeakDecorator.translate_markdown(markdown).html_safe
  end

  def cards
    []
  end

  def menu_title
    title
  end

  class Hero
    include ActiveModel::Model

    attr_accessor :title, :body
  end
end
