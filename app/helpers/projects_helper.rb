module ProjectsHelper
  def view_project_path(project)
    {:controller => :projects,:action => :view, :id => project}
  end
end
