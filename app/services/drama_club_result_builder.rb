class DramaClubResultBuilder < ResultBuilderBase
  def autocomplete_hint
    "#{record.title}, #{record.city}"
  end
end
