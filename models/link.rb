class Link < ActiveRecord::Base

  after_create :create_key

  def increment_clicks
    self.update_attribute 'clicks', self.clicks + 1
  end

  private

  def create_key
    self.update_attribute 'key', self.id.base62_encode
  end
end