class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :tags
  has_rich_text :body

  validates :title, presence: true
  validates :sub_text, presence: true, length: { maximum: 110, message: 'must be 110 characters or less' }

  include AASM

  aasm column: 'status' do
    state :draft, initial: true
    state :submitted, :changes_requested, :published, :archived

    event :submit do
      transitions from: %i[draft changes_requested], to: :submitted
    end

    event :request_changes do
      transitions from: %i[submitted draft], to: :changes_requested
    end

    event :publish do
      transitions from: %i[submitted draft], to: :published
    end

    event :archive do
      transitions from: %i[draft submitted changes_requested published], to: :archived
    end
  end

  scope :published, -> { where(status: 'published') }
  scope :draft, -> { where(status: 'draft') }
  scope :filter_by_tag, ->(tag_id) { joins(:tags).where(tags: { id: tag_id }) }
end
