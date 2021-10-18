class ArticlePolicy < ContentPagePolicy
  def unpublish?
    record.published?
  end

  def publish?
    return if record.new_record?
    record.draft?
  end

  def preview?
    !record.unpublished?
  end
end