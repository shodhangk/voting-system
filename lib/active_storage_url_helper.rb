module ActiveStorageUrlHelper
  def attachment_url(attachment)
    Rails.application.routes.url_helpers.url_for(attachment) if attachment.present?
  end
end
