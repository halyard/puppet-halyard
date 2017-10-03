require 'etc'

Facter.add('gid') do
    has_weight 10
    setcode do
      Etc.getpwnam(Facter.value(:id)).gid
    end
end
