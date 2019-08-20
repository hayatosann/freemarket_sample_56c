module DeviseHelper
  def devise_error_messages!
    resource.valid?
    excluded_columns = [:password_confirmation, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :phone, :image, :profile, :uid, :provider]
    excluded_columns.each {|column| resource.errors.delete(column)}
    resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
  end
end

# module DeviseHelper
#   def devise_error_messages!
#     return "" unless devise_error_messages?

#     messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
#     sentence = I18n.t("errors.messages.not_saved",
#                       :count => resource.errors.count,
#                       :resource => resource.class.model_name.human.downcase)

#     html = <<-HTML
#     <div id="error_explanation">
#       <h2>#{sentence}</h2>
#       <ul>#{messages}</ul>
#     </div>
#     HTML

#     html.html_safe
#   end

  # def devise_error_messages?
  #   !resource.errors.empty?
  # end

# end

# module DeviseHelper
#   def devise_error_messages!
#     'KABOOM!'
#   end

#   def devise_error_messages1!
#     resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
#   end

#   def devise_error_messages2!
#     resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
#   end
# end