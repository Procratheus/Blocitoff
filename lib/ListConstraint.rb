class ListConstraint

  def matches?(request)
    request.session["list_id"].present?
  end
  
end
