module ProjectsHelper
    
    def task_status(status)

    	if status == 1
    		@status = "New"
    	elsif status == 2
    		@status = "In Progress"
    	elsif status == 3
    		@status = "Done"
    	end
    		
    end
    
end
