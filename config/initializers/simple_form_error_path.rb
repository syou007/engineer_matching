module SimpleForm::Components::Errors
  def errors_on_attribute
    object.errors.full_messages_for(attribute_name)
  end
end