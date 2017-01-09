Facter.add('gid') do
    has_weight 10
    setcode do
      'staff'
    end
end
