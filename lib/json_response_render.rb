module JsonResponseRender
  def create_response(response, response_code)
    if (200..299).cover?(response_code)
      render json: { status: 'success', data: response, code: response_code }, status: response_code
    else
      render json: { status: 'error', message: response, code: response_code }, status: response_code
    end
  end
end
