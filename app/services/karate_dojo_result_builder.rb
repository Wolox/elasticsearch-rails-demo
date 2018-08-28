class KarateDojoResultBuilder < ResultBuilderBase
  def autocomplete_hint
    "#{record.name}, #{record.city}"
  end
end
