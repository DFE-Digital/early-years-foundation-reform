class ArticlePolicy < ContentPagePolicy
  def unpublish?
    record.published?
  end

  def publish?
    return if record.new_record?

    !record.published?
  end
end
