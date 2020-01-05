module ActiveStorageUrlHelper
  def attachment_url(file)
    Rails.application.routes.url_helpers.url_for(file) if file.attachment.present?
  end
end
