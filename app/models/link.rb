# encoding: UTF-8
class Link < ActiveRecord::Base
  attr_accessor :password_check
  attr_accessible :full_link, :password, :private
  
  before_save :password_not_empty
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

    def password_not_empty
      self.password = nil if self.password.blank?
    end

    def create_short_url
      chars = [('a'..'z'),('A'..'Z'),('0'..'9')].map(&:to_a).flatten
      self.short_link = chars.shuffle[0..4].join
    end

end
