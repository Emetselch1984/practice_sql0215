class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :access_logs
end
