class PhotographyWorkshopResultBuilder < ResultBuilderBase
  def autocomplete_hint
    "#{record.name}, #{record.city}"
  end
end
