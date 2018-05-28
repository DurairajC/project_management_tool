class Task < ActiveRecord::Base
	belongs_to :user, foreign_key: 'assigned_to'

	belongs_to :project, foreign_key: 'project_id'

	#Admin
	scope :tasks_done, -> { where(status: 3) }
	scope :inprogres_tasks, -> { where(status: 2) }
	scope :new_tasks, -> { where(status: 1) }

	#developer
	scope :user_tasks_done, -> { where(status: 3,assigned_to: User.current) }
	scope :user_tasks_inprogress, -> { where(status: 2,assigned_to: User.current) }
	scope :user_tasks_new, -> { where(status: 1,assigned_to: User.current) }

    validates :name, presence: true
    validates :name, uniqueness: true
	
end
