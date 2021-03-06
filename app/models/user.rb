require 'digest/sha1'

class User < ActiveRecord::Base
  # extend ActiveSupport::Memoizable
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  include Authorization::AasmRoles

  model_stamper
  stampable

  has_and_belongs_to_many :roles

  # validates_format_of       :first_name,     :with => RE_NAME_OK,  :message => MSG_NAME_BAD
  # validates_length_of       :first_name,     :maximum => 100
  # validates_format_of       :last_name,     :with => RE_NAME_OK,  :message => MSG_NAME_BAD
  # validates_length_of       :last_name,     :maximum => 100
  # 
  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email,    :case_sensitive => false
  validates_format_of       :email,    :with => RE_EMAIL_OK, :message => MSG_EMAIL_BAD


  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :email, :name, :first_name, :last_name, :password, :password_confirmation

  def login
    email
  end
  
  def name
    "#{first_name}, #{last_name}"
  end
  # memoize :name
  
  def clear_reset_code!
    self.reset_code = nil
    save(false)
  end

  def recently_reset_password?
    @reset_code_set
  end

  def make_reset_code!
    @reset_code_set = true
    self.reset_code = self.class.make_token
    save(false)
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    u = find_in_state :first, :activated, :conditions => {:email => login} # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def has_role?(role_in_question)
    @_list ||= self.roles.collect(&:name)
    return true if @_list.include?("admin")
    (@_list.include?(role_in_question.to_s) )
  end

  protected

  def make_activation_code
    self.deleted_at = nil
    self.activation_code = self.class.make_token
  end


end
