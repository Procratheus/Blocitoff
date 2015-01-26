class ListOneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.user_id 
      value.errors[attribute] << (options[:message] || "There can be only one! 'Highlander proceeds to chop the Kurgans head off.'")
    end
  end
end

