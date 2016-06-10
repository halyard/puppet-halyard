Facter.add('id') do
    has_weight 10
    setcode do
      ENV['SUDO_USER']
    end
end
