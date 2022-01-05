# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Removes field_with_errors wrapper (they sometimes mess up styles after a validation)
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
end