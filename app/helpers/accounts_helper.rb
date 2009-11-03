module AccountsHelper
  def current_account_name
    current_account.domain_name
  end

  def users_column(record)
    record.users.size.to_s
  end

  def owner_column(record)
    unless record.owner.nil?
      link_to record.owner.username, :controller => :users, :action => :edit, :id => record.owner.id
    end
  end
  
  def visit_column (record)
    link_to "visit", account_url(record.name) + url_for({:controller => :index,:only_path => true})
  end
  
end
