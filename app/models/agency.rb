class Agency < ActiveRecord::Base
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  validates :name, :grade, presence: true
  validates :grade, inclusion: { in: %w(padawan jedi master), message: "%{value} is not a valid grade" }

  scope :by_name, ->(name) { where('name LIKE ?', "%#{name}%") }
  scope :by_tags, ->(tags) { joins(:taggings).joins(:tags).where('tags.name LIKE ?', "%#{tags}%") }
end
