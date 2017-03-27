Puppet::Functions.create_function(:'dotfiles::homedir') do
  def homedir(user)
    File.expand_path("~#{user}")
  end
end
