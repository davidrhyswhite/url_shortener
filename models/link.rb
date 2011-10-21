class Link < ActiveRecord::Base

  after_save :create_key, :unless => :key_exists?

  def increment_clicks
    self.update_attribute 'clicks', self.clicks + 1
  end

  private

  def create_key
    self.key = self.id.base62_encode
    self.save
  end

  def key_exists?
    return !self.key.blank?
  end

end