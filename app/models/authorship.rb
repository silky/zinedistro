# Authorship ties Zines to Authors
class Authorship < ActiveRecord::Base
  belongs_to(:author,
             validate: true,
             dependent: :destroy)
  validates :author_id, presence: true
  validates_numericality_of :author_id

  belongs_to :zine, validate: true
  validates :zine_id, presence: true
  validates_uniqueness_of :author_id, scope: [:zine_id]
end
