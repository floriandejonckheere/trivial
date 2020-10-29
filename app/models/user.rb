# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :lockable

  validates :name,
            presence: true

  validates :email,
            presence: true
end

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  current_sign_in_at :datetime
#  current_sign_in_ip :inet
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  failed_attempts    :integer          default(0), not null
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :inet
#  locked_at          :datetime
#  name               :string           default(""), not null
#  sign_in_count      :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
