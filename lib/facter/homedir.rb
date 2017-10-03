require 'etc'

Facter.add(:homedirs) do
  setcode do
    Etc.passwd { |u| [u.name, u.dir] }.to_h
  end
end
