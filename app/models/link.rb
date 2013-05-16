# encoding: UTF-8
class Link < ActiveRecord::Base
  attr_accessible :full_link, :password, :private

  before_save :secure_password
  before_save :create_short_url

  VALID_URL = /(^$)|(^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/

  validates :full_link, presence: true,
                        length: { maximum: 2048 },
                        format: { with: VALID_URL, message: "Enter valid URL" }
  validates :password,  if: :password?, length: { minimum: 8, maximum: 20}
  validates :short_link, uniqueness: true

  def counts
    self.counter += 1
  end

  private

    def secure_password
      if self.password?
        self.password = SecureRandom.urlsafe_base64
      else
        self.password = nil
      end
    end

    def create_short_url
      self.short_link ||= Digest::MD5.hexdigest(self.full_link + "aadamkmmsakd").slice(0..6)
    end

end
