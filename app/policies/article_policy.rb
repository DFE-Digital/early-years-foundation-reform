class ArticlePolicy < ContentPagePolicy
  def unpublish?
    record.published?
  end

  def publish?
    preview? && record.complete?
  end

  def preview?
    return if record.new_record?

    !record.published?
  end
end
