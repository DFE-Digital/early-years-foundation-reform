Govspeak::PostProcessor.class_eval do
  extension("use custom footnotes") do |document|
    document.css("div.footnotes > ol").map do |el|
      el.add_previous_sibling('<h2 class="govuk-heading-m">References</h2>')
      el.prepend_child('<div class="govuk-visually-hidden">Reference</div>')
    end

    document.css("a.footnote").map do |el|
      footnote_number = el[:href].gsub(/\D/, "")
      el.content = "[reference #{footnote_number}]"
    end

    document.css("[role='doc-backlink']").map do |el|
      el.content = "↩"
    end
  end
end
