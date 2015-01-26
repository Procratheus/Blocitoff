class ThereCanBeOnlyOneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if List.find_by(user_id: record.user_id).count > 0 
      record.errors[attribute] << (options[:message] || "There can be only one! 'Highlander proceeds to chop the Kurgans head off.'")
    end
  end
end