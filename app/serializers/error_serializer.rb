class ErrorSerializer
  def initialize(exception)
    @exception = exception
  end

  def format_not_found
    {
      errors: [
        {
          detail: @exception.message
        }
      ]
    }
  end
end
