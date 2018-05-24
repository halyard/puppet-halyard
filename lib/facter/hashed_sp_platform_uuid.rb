Facter.add('hashed_sp_platform_uuid') do
    has_weight 10
    setcode do
      Digest::SHA512.hexdigest(Facter.value(:sp_platform_uuid))[0...24]
    end
end
