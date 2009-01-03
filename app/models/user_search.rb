class UserSearch
  attr_accessor :params,  :id, :screen_name, :type, :zxonex_type, :roles, :state, :email, :url, :contact_name, :contact_phone
  
  def initialize(params=nil)
    if !params.nil?
      self.params = params
      self.zxonex_type = params[:zxonex_type] if !params[:zxonex_type].nil?
      self.state = params[:state] if !params[:state].nil?
      self.screen_name = params[:screen_name]
      self.id = params[:id]
      self.type = params[:type]
      self.email = params[:email]
      self.url = params[:url]
      self.contact_phone = params[:contact_phone]
      self.contact_name = params[:contact_name]
    end
  end
  
  def users
    scope = User.scoped({})
    scope = scope.scoped :conditions => ["users.id in (?)",id] if !id.blank?
    scope = scope.scoped :conditions => ["users.zxonex_type in (?)",zxonex_type] if !zxonex_type.blank?
    scope = scope.scoped :conditions => ["users.type in (?)",type] if !type.blank?
    scope = scope.scoped :conditions => ["users.state in (?)",state] if !state.blank?      
    scope = scope.scoped :conditions => ["users.screen_name like ?","%#{screen_name}%"] if !screen_name.blank?      
    scope = scope.scoped :conditions => ["users.email like ?","%#{email}%"] if !email.blank?
    scope = scope.scoped :conditions => ["users.url like ?","%#{url}%"] if !url.blank?
    scope = scope.scoped :conditions => ["users.contact_name like ?","%#{contact_name}%"] if !contact_name.blank?
    scope = scope.scoped :conditions => ["users.contact_phone like ?","%#{contact_phone}%"] if !contact_phone.blank?            
    scope
  end
end