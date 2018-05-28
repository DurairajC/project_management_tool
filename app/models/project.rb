class Project < ActiveRecord::Base
    
    has_many :tasks, class_name: 'Task', foreign_key: 'project_id'
    
    validates :name, presence: true
    validates :name, uniqueness: true

end
