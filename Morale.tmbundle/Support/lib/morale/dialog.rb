SUPPORT = ENV['TM_SUPPORT_PATH']
DIALOG = ENV['DIALOG']
 
require SUPPORT + '/lib/escape'
require SUPPORT + '/lib/osx/plist'

# title = "My Alert"
# message = "This is my alert Box"
# buttons = ['OK', 'Close']
#  
# params = {
#     'alertStyle' => 'informational', 
#     'messageTitle' => title, 
#     'informativeText' => message, 
#     'buttonTitles' => buttons
# }
#  
# opts = params.to_plist
#  
# `#{e_sh(DIALOG)} -ep #{e_sh(opts)}`

class Dialog
  attr_accessor :title, :message, :buttons
  
  def initialize(message)
    @title = "Morale"
    @message = message
    @buttons = ['Close']
  end
  
  def display
    params = {
        'alertStyle' => 'informational', 
        'messageTitle' => @title, 
        'informativeText' => @message, 
        'buttonTitles' => @buttons
    }
    opts = params.to_plist
    
    `#{e_sh(DIALOG)} -ep #{e_sh(opts)}`
  end
end